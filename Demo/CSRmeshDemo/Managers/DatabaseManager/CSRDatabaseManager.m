//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRDatabaseManager.h"
#import "CSRUtilities.h"
#import "CSRDeviceEntity.h"
#import "CSRDevicesManager.h"
#import "CSRConstants.h"
#import "CSRmeshManager.h"
#import "CSRAppStateManager.h"
#import "CSRGatewayEntity.h"

@interface CSRDatabaseManager ()

@end

@implementation CSRDatabaseManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Singleton methods

+ (CSRDatabaseManager*)sharedInstance
{
    static dispatch_once_t token;
    static CSRDatabaseManager *shared = nil;
    
    dispatch_once(&token, ^{
        shared = [[CSRDatabaseManager alloc] init];
    });
    
    return shared;
}


- (id) init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(csrMeshListener:)
                                                     name:kCSRmeshManagerTransactionNotification
                                                   object:nil];
        
        [[CSRmeshManager sharedInstance] setUpDelegates];
        
    }
    
    return self;
    
}

#pragma mark - Core Data stack methods

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CSRmesh" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[CSRUtilities documentsDirectoryPathURL] URLByAppendingPathComponent:@"CSRmesh.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"csr.com.CSRmeshDemo.DB" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Fetch Method

- (NSSet *)fetchObjectsWithEntityName:(NSString *)entityName withPredicate:(id)stringOrPredicate, ...
{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext]];
    
    if (stringOrPredicate) {
        
        NSPredicate *predicate;
        
        if ([stringOrPredicate isKindOfClass:[NSString class]] && stringOrPredicate != nil) {
            
            va_list variadicArguments;
            va_start(variadicArguments, stringOrPredicate);
            predicate = [NSPredicate predicateWithFormat:stringOrPredicate arguments:variadicArguments];
            va_end(variadicArguments);
            
        } else {
            
            NSAssert2([stringOrPredicate isKindOfClass:[NSPredicate class]],
                      @"Second parameter passed to %s is of unexpected class %@",
                      sel_getName(_cmd), NSStringFromClass([stringOrPredicate class]));
            predicate = (NSPredicate *)stringOrPredicate;
            
        }
        
        [request setPredicate:predicate];
        
    }
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error != nil) {
        [NSException raise:NSGenericException format:@"%@",[error description]];
        return nil;
    }
    
    return [NSSet setWithArray:results];
    
}

#pragma mark - Insert method

#pragma mark - Update method

#pragma mark - Delete method

#pragma mark - Database helper methods

- (id)retrieveSingleObjectWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    
    if (dictionary && [[dictionary allKeys] count] <= 0) {
        return nil;
    }
    
    NSFetchRequest *request;
    
    for (NSString *key in [dictionary allKeys]) {
        
        if ([key isEqualToString:@"entity"]) {
            request = [[NSFetchRequest alloc] initWithEntityName:dictionary[@"entity"]];
        }
        
    }
    
    
    return nil;
}

- (NSSet *)retrieveManyObjectWithDictionary:(NSDictionary *)dictionary
{
    
    return nil;
}

- (id)retrieveOneValueWithDictionary:(NSDictionary *)dictionary
{
    return nil;
}

#pragma mark --- Local Database Methods
- (void) loadDatabase
{
    
    @synchronized (self) {
        
        // Wipe the storing arrays
        [[[CSRDevicesManager sharedInstance] meshDevices] removeAllObjects];
        [[[CSRDevicesManager sharedInstance] scannedMeshDevices] removeAllObjects];

        // Get next free device number and store it
        [[[CSRDevicesManager sharedInstance] meshAreas] removeAllObjects];
        
        
        // Get devices from current place
        NSSet *devices;
        
        if ([CSRAppStateManager sharedInstance].selectedPlace) {
            
            devices = [CSRAppStateManager sharedInstance].selectedPlace.devices;
            
            CSRSettingsEntity *settings = [CSRAppStateManager sharedInstance].selectedPlace.settings;
            
            if (settings) {
                
                newDatabase = NO;
                
            } else {
                
                newDatabase = YES;
                settings = [NSEntityDescription insertNewObjectForEntityForName:@"CSRSettingsEntity" inManagedObjectContext:self.managedObjectContext];
                settings.userID = nil;
                settings.retryInterval = @2.0;
                settings.retryCount = @1;
                settings.concurrentConnections = @1;
                settings.listeningMode = @1;
                
                settings.siteID = nil;
                
                [CSRAppStateManager sharedInstance].selectedPlace.settings = settings;
                
            }
            
        }
        
        for (CSRDeviceEntity *device in devices) {
                
                NSMutableDictionary *deviceProperties = [NSMutableDictionary dictionary];
                if (device.deviceHash) {
                    [deviceProperties setObject:device.deviceHash forKey:kDEVICE_HASH];
                }
                
                if (device.authCode) {
                    [deviceProperties setObject:device.authCode forKey:kDEVICE_AUTH_CODE];
                }
                if (device.deviceId) {
                    [deviceProperties setObject:@([device.deviceId unsignedShortValue]) forKey:kDEVICE_NUMBER];
                }
                
                if (device.name) {
                    [deviceProperties setObject:device.name forKey:kDEVICE_NAME];
                }
                
                if (device.modelLow) {
                    [deviceProperties setObject:device.modelLow forKey:kDEVICE_MODELS_LOW];
                }
                
                if (device.modelHigh) {
                    [deviceProperties setObject:device.modelHigh forKey:kDEVICE_MODELS_HIGH];
                }
                
                if (device.isAssociated) {
                    [deviceProperties setObject:device.isAssociated forKey:kDEVICE_ISASSOCIATED];
                }
            
                [[CSRDevicesManager sharedInstance] createDeviceFromProperties:deviceProperties];
            }
        
            
            // Group Entity
            NSSet *areas = [self fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:nil];
            for (CSRAreaEntity *area in areas) {
                NSMutableDictionary *areaProperties = [NSMutableDictionary dictionary];
                if (area.areaID)
                    [areaProperties setObject:area.areaID forKey:kAREA_NUMBER];
                if (area.areaName)
                    [areaProperties setObject:area.areaName forKey:kAREA_NAME];
                [[CSRDevicesManager sharedInstance] createAreaFromProperties:areaProperties];
            }
    }
    
}


-(CSRSettingsEntity *) fetchSettingsEntity {
    NSSet *settings = [self fetchObjectsWithEntityName:@"CSRSettingsEntity" withPredicate:nil];
    CSRSettingsEntity *settingEntity = nil;
    if (settings && settings.count) {
        id setting = [settings anyObject];
        if ([setting isKindOfClass:[CSRSettingsEntity class]]) {
            settingEntity = setting;
        }
    }
    return (settingEntity);
}

- (CSRSettingsEntity *)settingsForCurrentlySelectedPlace
{
    
    if ([CSRAppStateManager sharedInstance].selectedPlace) {
        
        return (CSRSettingsEntity *)[CSRAppStateManager sharedInstance].selectedPlace.settings;
    }
    
    return nil;
    
}

//============================================================================
// get group entity from database
-(CSRAreaEntity *) fetchAreaEntity :(NSNumber *) groupId  {
    NSSet *groups = [self fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:@"number == %@",groupId];
    CSRAreaEntity *groupObj = nil;
    if (groups && groups.count) {
        id group = [groups anyObject];
        if ([group isKindOfClass:[CSRAreaEntity class]]) {
            groupObj = group;
        }
    }
    return (groupObj);
}

#pragma mark - Device Methods
//============================================================================
// Save the new Device Id into the database
-(void) saveDeviceId :(NSNumber *) newDeviceId {
    NSSet *setOfDevices = [self fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:nil];
    if (setOfDevices) {
        id setting = [setOfDevices anyObject];
        if ([setting isKindOfClass:[CSRDeviceEntity class]]) {
            CSRDeviceEntity *deviceObj = setting;
            deviceObj.deviceId = newDeviceId;
            [self saveContext];
        }
    }
}

- (NSNumber*) getNextFreeDeviceNumber
{
    
    NSSet *devicesSet;
    
    if ([CSRAppStateManager sharedInstance].selectedPlace) {
        
        devicesSet = [CSRAppStateManager sharedInstance].selectedPlace.devices;
        
    }
    
    NSMutableArray *allDeviceIds = [NSMutableArray new];
    for (CSRDeviceEntity *device in devicesSet) {
        [allDeviceIds addObject:device.deviceId];
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [allDeviceIds sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    

    __block int previousAddress = 0x8000;
    __block BOOL found = NO;
    __block int objValue;
    if (!allDeviceIds || (allDeviceIds && [allDeviceIds count] < 1)) {
        return @(0x8001);
    } else {

    [allDeviceIds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        objValue = [(NSNumber*)obj intValue];
     
        if ((objValue - previousAddress) > 1) {
            
            // found gap
            objValue = previousAddress + 1; // 0x8000
            
            found=YES;
            *stop=YES;
         
     } else {
         
        previousAddress = [(NSNumber*)obj intValue];
         
     }
        
    }];
    
     if (!found) {
         if (objValue != 0xffff) {
             // free Device Id
             objValue ++;
             found = YES;
         }
     }
     
    if (!found) {
        return @(-1);
    }

    return @(objValue);
    }

}

- (int) getNextFreeAreaInt
{
    
    NSSet *areasSet = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:nil];
    NSMutableArray *allAreaIds = [NSMutableArray new];
    for (CSRAreaEntity *area in areasSet) {
        [allAreaIds addObject:area.areaID];
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [allAreaIds sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    
    __block int previousAddress = 0;
    __block BOOL found = NO;
    __block int objValue;
    if (!allAreaIds || (allAreaIds && [allAreaIds count] < 1)) {
        return 1;
    } else {
        
        [allAreaIds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            objValue = [(NSNumber*)obj intValue];
            
            if ((objValue - previousAddress) > 1) {
                
                // found gap
                objValue = previousAddress + 1;
                
                found=YES;
                *stop=YES;
                
            } else {
                
                previousAddress = [(NSNumber*)obj intValue];
                
            }
            
        }];
        
        if (!found) {
            if (objValue != 0x7fff) {
                // free Device Id
                objValue ++;
                found = YES;
            }
        }
        
        if (!found) {
            return -1;
        }
        
        return objValue;
    }
    
}

#pragma mark - Gateway methods

- (NSNumber*)getNextFreeGatewayDeviceId
{
    
    NSSet *gateways;
    
    if ([CSRAppStateManager sharedInstance].selectedPlace) {
        
        gateways = [CSRAppStateManager sharedInstance].selectedPlace.gateways;
        
    }
    
    NSMutableArray *gatewaysIds = [NSMutableArray new];
    
    for (CSRGatewayEntity *gateway in gateways) {
        [gatewaysIds addObject:gateway.deviceId];
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    [gatewaysIds sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    __block int previousAddress = 0xFFFF;
    __block BOOL found = NO;
    __block int objValue;
    
    if (!gatewaysIds || (gatewaysIds && [gatewaysIds count] < 1)) {
        
        return @(0xFFFF);
        
    } else {
        
        [gatewaysIds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            objValue = [(NSNumber*)obj intValue];
            
            if ((objValue - previousAddress) > 1) {
                
                // found gap
                objValue = previousAddress - 1; // 0x8000
                
                found = YES;
                *stop = YES;
                
            } else {
                
                previousAddress = [(NSNumber*)obj intValue];
                
            }
            
        }];
        
        if (!found) {
            
            if (objValue != 0x8001) {
                
                // free gateway deviceId
                objValue --;
                found = YES;
                
            }
            
        }
        
        if (!found) {
            
            return @(-1);
            
        }
        
        return @(objValue);
    }
    
}


#pragma mark - Device Deletion Methods

-(void) removeDeviceFromDatabase :(NSNumber *) deviceId
{
    NSSet *devices = [self fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@" ,deviceId];
    if (devices && [devices count]>=1) {
        CSRDeviceEntity *deviceEntity = [devices anyObject];
        [_managedObjectContext deleteObject:deviceEntity];
        [self saveContext];
    }

}


#pragma mark - AREA Methods
//============================================================================
// Save the new Group Id into the database
-(void) saveAreaId :(NSNumber *) newAreaId {
    NSSet *areas = [self fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:nil];
    if (areas) {
        id area = [areas anyObject];
        if ([area isKindOfClass:[CSRAreaEntity class]]) {
            CSRAreaEntity *areaObj = area;
            areaObj.areaID = newAreaId;
            [self saveContext];
        }
    }
}


-(CSRAreaEntity*) saveNewArea :(NSNumber *) areaId areaName:(NSString *) areaName {
    
    NSSet *areas = [self fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:@"areaID == %@", areaId];
    CSRAreaEntity *areaObj;
    if (areas && areas.count) {
        id area = [areas anyObject];
        if ([area isKindOfClass:[CSRAreaEntity class]]) {
            areaObj = area;
        }
    }
    else {
        areaObj = [NSEntityDescription insertNewObjectForEntityForName:@"CSRAreaEntity" inManagedObjectContext:self.managedObjectContext];
    }
    
    if (areaObj) {
        areaObj.areaName = areaName;
        areaObj.areaID = areaId;
        [self saveContext];
        
    }
    return areaObj;
}

- (void) saveDeviceModel :(NSNumber *) deviceNumber modelNumber:(NSData *) modelNumber infoType:(NSNumber *) infoType {
    
    CSRDeviceEntity *deviceEntity = nil;
    
    if (deviceNumber) {
        // Does the device already exist?
        NSSet *devices = [self fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@",deviceNumber];
        if (devices && [devices count]>=1) {
            deviceEntity = [devices anyObject];

            if ([infoType intValue] == CSR_Model_low) {
                if (modelNumber)
                    deviceEntity.modelLow = [NSData dataWithData:modelNumber];
            }
            else if ([infoType intValue] == CSR_Model_high) {
                if (modelNumber)
                    deviceEntity.modelHigh = [NSData dataWithData:modelNumber];
            }
            [self saveContext];
        }
    }
}

#pragma mark ----
#pragma mark - Area Deletion Methods

- (void) removeAreaFromDatabaseWithAreaId:(NSNumber*)areaId
{
    NSSet *area = [self fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:@"areaID == %@" ,areaId];
    if (area && [area count]>=1) {
        CSRAreaEntity *areaEntity = [area anyObject];
        [_managedObjectContext deleteObject:areaEntity];
        [self saveContext];
    }
}


- (void) csrMeshListener: (NSNotification *)notification {
    
    CSRDeviceEntity *deviceEntity = nil;
    
    // Does the device already exist?
    NSSet *devices = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@" ,kDEVICE_NUMBER];
    
    if (devices && [devices count] >= 1) {
        
        deviceEntity = [devices anyObject];
        
    } else {
        
        deviceEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CSRDeviceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
        
    }
}

- (void) toggleDeviceAreaMembership:(NSNumber *)deviceId andAreaId:(NSNumber *)areaId withIndex:(NSNumber *)index
{
    CSRDeviceEntity *deviceEntity;
    
    NSSet *devices = [self fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@", deviceId];
    for (deviceEntity in devices) {
        deviceEntity.groups = nil;
        deviceEntity.nGroups = nil;
    }
    
}




@end
