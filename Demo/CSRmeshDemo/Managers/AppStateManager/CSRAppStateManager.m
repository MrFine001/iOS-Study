//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAppStateManager.h"
#import "CSRDatabaseManager.h"
#import "CSRUtilities.h"
#import <CSRmesh/CSRMeshUserManager.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CSRmeshSettings.h"
#import "CSRBluetoothLE.h"
#import "CSRDevicesManager.h"

@interface CSRAppStateManager() <CSRBluetoothLEDelegate>

@end


@implementation CSRAppStateManager

#pragma mark - Singleton methods

+ (CSRAppStateManager*)sharedInstance
{
    static dispatch_once_t token;
    static CSRAppStateManager *shared = nil;
    
    dispatch_once(&token, ^{
        shared = [[CSRAppStateManager alloc] init];
    });
    
    return shared;
}

- (id)init
{
    if (self = [super init]) {
        
        _bearerType = (CSRSelectedBearerType)0;
        _isBearerModeAutomatic = NO;
        _isImportMode = NO;
        
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDataModelChange:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:[[CSRDatabaseManager sharedInstance] managedObjectContext]];
    
    return self;
}

- (void)handleDataModelChange:(NSNotification *)note
{
}

#pragma mark - Connection switch

- (void)switchConnectionForSelectedBearerType:(CSRSelectedBearerType)bearerType
{
    
    _bearerType = bearerType;
    
    switch (_bearerType) {
            
        case CSRSelectedBearerType_Bluetooth:
            [[CSRmeshSettings sharedInstance] setBleConnectMode:(BleAutoConnectMode)2];
            [[MeshServiceApi sharedInstance] setBluetoothBearerEnabled];
            [[CSRBluetoothLE sharedInstance] setBleDelegate:self];
            
            break;
            
        case CSRSelectedBearerType_Cloud:
            [[CSRmeshSettings sharedInstance] setBleConnectMode:(BleAutoConnectMode)0];
            [[MeshServiceApi sharedInstance] setRestBearerEnabled];
            [[CSRBluetoothLE sharedInstance] setBleDelegate:nil];
            [self setupCloudWithEndpoint:CSRMeshRestEndpoint_Cloud
                                withMode:CSRMeshRestMode_CNC];
            
            break;
            
        case CSRSelectedBearerType_Gateway:
            [[CSRmeshSettings sharedInstance] setBleConnectMode:(BleAutoConnectMode)0];
            [[MeshServiceApi sharedInstance] setRestBearerEnabled];
            [[CSRBluetoothLE sharedInstance] setBleDelegate:nil];
            [self setupCloudWithEndpoint:CSRMeshRestEndpoint_Gateway
                                withMode:CSRMeshRestMode_CNC];
            
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Cloud setup

- (void)setupCloudWithEndpoint:(CSRMeshRestEndpoint)endpoint withMode:(CSRMeshRestMode)mode;
{
    
    [CSRMeshUserManager sharedInstance].applicationId = kAppCode;
    [CSRMeshUserManager sharedInstance].tenant.tenantId = _selectedPlace.settings.cloudTenancyID;
    [CSRMeshUserManager sharedInstance].site.siteId = _selectedPlace.cloudSiteID;
    
    _currentGateway = nil;
    
    if (!_currentGateway) {
        
        if ([_selectedPlace.gateways count] > 0) {
            
            _currentGateway = (CSRGatewayEntity *)[_selectedPlace.gateways anyObject];
            
        }
        
    }
    
    switch (endpoint) {
        case CSRMeshRestEndpoint_Cloud:
            
            switch (mode) {
                    
                case CSRMeshRestMode_Config:
                    
                    [[CSRMeshUserManager sharedInstance] setupCloud:kCloudServerUriScheme
                                                               host:_globalCloudHost //kCloudServerUrl
                                                               port:kCloudServerPort
                                                           basePath:kConfigServerBasePath
                                                          serverURL:CSRRestServerComponent_CONFIG];
                    break;
                    
                case CSRMeshRestMode_CNC:
                    
                    [[CSRMeshUserManager sharedInstance] setupCloud:kCloudServerUriScheme
                                                               host:_globalCloudHost //kCloudServerUrl
                                                               port:kCloudServerPort
                                                           basePath:kCNCServerBasePath
                                                          serverURL:CSRRestServerComponent_CNC];
                    
                default:
                    break;
            }
            
            break;
            
            
        case CSRMeshRestEndpoint_Gateway:
            
            switch (mode) {
                    
                case CSRMeshRestMode_Config:
                    
                    [[CSRMeshUserManager sharedInstance] setupCloud:kGatewayServerUriScheme
                                                               host:_currentGateway.host
                                                               port:[NSString stringWithFormat:@"%@", _currentGateway.port]
                                                           basePath:[NSString stringWithFormat:@"/cgi-bin%@", kConfigServerBasePath]
                                                          serverURL:CSRRestServerComponent_CONFIG];
                    break;
                    
                case CSRMeshRestMode_CNC:
                    
                    [[CSRMeshUserManager sharedInstance] setupCloud:kGatewayServerUriScheme
                                                               host:_currentGateway.host
                                                               port:[NSString stringWithFormat:@"%@", _currentGateway.port]
                                                           basePath:[NSString stringWithFormat:@"/cgi-bin%@", kCNCServerBasePath]
                                                          serverURL:CSRRestServerComponent_CNC];
                    
                    break;
                    
                default:
                    break;
            }
            
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Place setup

- (void)createDefaultPlace
{
    NSSet *places = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRPlaceEntity" withPredicate:nil];
    
    if ([places count] <= 0) {
        
        CSRPlaceEntity *defaultPlace = [NSEntityDescription insertNewObjectForEntityForName:@"CSRPlaceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
        
        defaultPlace.name = @"iOS House";
        defaultPlace.networkKey = @"qwerty";
        defaultPlace.color = @([CSRUtilities rgbFromColor:[CSRUtilities colorFromHex:@"#2196f3"]]);
        defaultPlace.iconID = @(8);
        defaultPlace.owner = @"My place";
        
        [[CSRDatabaseManager sharedInstance] saveContext];
        
        [CSRUtilities saveObject:[[[defaultPlace objectID] URIRepresentation] absoluteString] toDefaultsWithKey:@"kCSRLastSelectedPlaceID"];
        
    }
    
    
}

- (void)setupPlace
{
    
    id placeIdURLString = [CSRUtilities getValueFromDefaultsForKey:@"kCSRLastSelectedPlaceID"];
    NSManagedObjectID *placeID = [[CSRDatabaseManager sharedInstance].persistentStoreCoordinator managedObjectIDForURIRepresentation:[NSURL URLWithString:placeIdURLString]];
    
    if ([placeID isKindOfClass:[NSManagedObjectID class]]) {
        
        NSArray *placesArray = [[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRPlaceEntity" withPredicate:nil] allObjects];
        
        [placesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            CSRPlaceEntity *place = (CSRPlaceEntity *)obj;
            
            if ([[place objectID] isEqual:placeID]) {
                
                _selectedPlace = place;
                
                [[CSRDevicesManager sharedInstance] setNetworkPassPhrase:_selectedPlace.networkKey];
                
                [self selectCurrentGateway];
                
                *stop = YES;
                
            }
            
        }];
        
    }
    
}

- (void)selectCurrentGateway
{
    if (_selectedPlace && [_selectedPlace.gateways count] > 0) {
        
        _currentGateway = (CSRGatewayEntity *)[[_selectedPlace.gateways allObjects] objectAtIndex:0];
        
    }
}

- (void)selectGatewayCommunicationChannel
{
    if (_currentGateway) {
    
        if ([_currentGateway.state intValue] == CSRGateWayState_Cloud) {
            
            [self setupCloudWithEndpoint:CSRMeshRestEndpoint_Cloud withMode:CSRMeshRestMode_CNC];
            
        } else if ([_currentGateway.state intValue] == CSRGateWayState_Local) {
            
            [self setupCloudWithEndpoint:CSRMeshRestEndpoint_Gateway withMode:CSRMeshRestMode_CNC];
            
        }
        
    }
}

#pragma mark - User methods

- (CSRUserEntity *)createUserForCurrentlyLoggedInUser
{
    
    __block NSString *email, *name, *userId;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error)
             {
                     NSLog(@"fetched user:%@", result);
                     userId = result[@"id"];
                     name = result[@"name"];
                     email = result[@"email"];
                     
                     if (![CSRUtilities isStringEmpty:name] && ![CSRUtilities isStringEmpty:userId]) { //![CSRUtilities isStringEmpty:email] && 
                         
                         [[NSNotificationCenter defaultCenter] postNotificationName:kCSRAppStateManagerDidFinishLoginProcessNotification object:nil];
                     }
                 }
             }];
    }
    
    CSRUserEntity *user = [[[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRUserEntity" withPredicate:@"userId == %@", userId] allObjects] firstObject];
    
    if (user) {
        
        if ([CSRUtilities isStringEmpty:user.token]) {
            
            user.token = [FBSDKAccessToken currentAccessToken].tokenString;
            
        }
        
    } else {

        user = [NSEntityDescription insertNewObjectForEntityForName:@"CSRUserEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
        user.token = [FBSDKAccessToken currentAccessToken].tokenString;
        user.name = name;
        user.email = email;
        user.userId = userId;

    }
    
    [[CSRDatabaseManager sharedInstance] saveContext];
    
    return user;
    
}

@end
