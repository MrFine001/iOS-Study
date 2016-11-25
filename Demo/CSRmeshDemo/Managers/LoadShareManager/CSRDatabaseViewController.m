//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRDatabaseViewController.h"
#import "CSRSettingsEntity.h"
#import "CSRAreaEntity.h"
#import "CSRDeviceEntity.h"
#import "AppDelegate.h"
#import "NSManagedObject+DeleteEntities.h"
#import "CSRDatabaseManager.h"
#import "CSRDevicesManager.h"
#import "CSRDatabaseManager.h"
#import "CSRUtilities.h"
#import "CSRAppStateManager.h"

@interface CSRDatabaseViewController()  {
    
    NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation CSRDatabaseViewController


+ (CSRDatabaseViewController*)sharedInstance
{
    static dispatch_once_t token;
    static CSRDatabaseViewController *shared = nil;
    
    dispatch_once(&token, ^{
        shared = [[CSRDatabaseViewController alloc] init];
    });
    
    return shared;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


//changed to NSMutableSet for faster performance, if we want the sorting, use NSSortDescriptor
- (void) createJSONOnFly
{
    _jsonDictionary = [NSMutableDictionary new];
    _devicesArray = [NSMutableArray new];
    _groupsArray = [NSMutableArray new];
    
    
    ///////////////////Devices//////////////////////////////////////
    
    NSSet *devices = [CSRAppStateManager sharedInstance].selectedPlace.devices;
//    [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:nil];
    if (devices) {
        for (CSRDeviceEntity *device in devices) {
            
            NSInteger hash = [CSRUtilities NSDataToInt:device.deviceHash];
            NSInteger modelLow = [CSRUtilities NSDataToInt:device.modelLow];
            NSInteger modelHigh = [CSRUtilities NSDataToInt:device.modelHigh];
            
            uint16_t *choppedValue = (uint16_t*)device.groups.bytes;
            NSMutableArray *groupsInArray = [NSMutableArray array];
            for (int i = 0; i < device.groups.length/2; i++) {
                NSNumber *group = @(*choppedValue++);
                [groupsInArray addObject:group];
            }
            
            NSInteger authCode = [CSRUtilities NSDataToInt:device.authCode];
            
            [_devicesArray addObject:@{@"deviceID":(device.deviceId) ? (device.deviceId) : @0,
                                       @"name":(device.name) ? (device.name) : @"",
                                       @"appearance":(device.appearance) ? (device.appearance) : @0,
                                       @"hash":[NSNumber numberWithInteger:hash] ? [NSNumber numberWithInteger:hash] : @0,
                                       @"modelLow":[NSNumber numberWithInteger:modelLow] ? [NSNumber numberWithInteger:modelLow] : @0,
                                       @"modelHigh":[NSNumber numberWithInteger:modelHigh] ? [NSNumber numberWithInteger:modelHigh] : @0,
                                       @"numgroups":(device.nGroups) ? (device.nGroups) : @0,
                                       @"groups":groupsInArray,
                                       @"authCode":([NSNumber numberWithInteger:authCode]) ? [NSNumber numberWithInteger:authCode] : @0,
                                       @"isAssociated":device.isAssociated ? device.isAssociated : @0}];
        }
    }
    if (_devicesArray) {
        [_jsonDictionary setObject:_devicesArray forKey:@"devices_list"];
    }
    
    ///////////////////Areas//////////////////////////////////////
    
    NSSet *areas = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:nil];
    
    for (CSRAreaEntity *area in areas) {
        
        [_groupsArray addObject:@{@"areaID":area.areaID, @"name":area.areaName}];
        
    }
    
    [_jsonDictionary setObject:_groupsArray forKey:@"areas_list"];
    
    //To get the current place Name, if we want to use it
    CSRPlaceEntity *placeEntity = [[CSRAppStateManager sharedInstance] selectedPlace];
    
    
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:_jsonDictionary
                                                       options:0
                                                         error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"Got an error :%@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@", placeEntity.name, @"Database.json"]];
    [jsonString writeToFile:appFile atomically:YES encoding:NSUTF8StringEncoding error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
