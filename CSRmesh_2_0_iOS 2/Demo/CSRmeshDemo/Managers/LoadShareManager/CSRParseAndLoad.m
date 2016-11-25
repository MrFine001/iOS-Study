//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRParseAndLoad.h"
#import "CSRSettingsEntity.h"
#import "CSRDeviceEntity.h"
#import "CSRAreaEntity.h"
#import "CSRUtilities.h"
#import "CSRDatabaseManager.h"
#import "CSRPlaceEntity.h"
#import "CSRAppStateManager.h"

@interface CSRParseAndLoad()
{
    
    NSManagedObjectContext *managedObjectContext;
}
@end

@implementation CSRParseAndLoad

- (id) init {
    self = [super init];
    if (self) {
       
        managedObjectContext = [CSRDatabaseManager sharedInstance].managedObjectContext;
        
    }
    return self;
}


- (void)parseAndLoadDevices:(NSArray *)devicesArray
{
    for (NSDictionary * deviceDict in devicesArray) {
        
        CSRDeviceEntity *deviceEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CSRDeviceEntity" inManagedObjectContext:managedObjectContext];
        
        NSData *devHash = [CSRUtilities IntToNSData:[deviceDict[@"hash"] integerValue]];
        NSData *modelHigh = [CSRUtilities IntToNSData:[deviceDict[@"modelHigh"] integerValue]];
        NSData *modelLow = [CSRUtilities IntToNSData:[deviceDict[@"modelLow"] integerValue]];

        __block NSMutableData *groups = [NSMutableData data];
        NSArray *groupsArray = deviceDict[@"groups"];


        [groupsArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            uint16_t desiredValue = [obj unsignedShortValue];
            [groups appendBytes:&desiredValue length:sizeof(desiredValue)];
            CSRAreaEntity *areaEntity = [[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:@"areaID == %@", @(desiredValue)] anyObject];
            if (areaEntity) {
                [deviceEntity addAreasObject:areaEntity];
            }
        }];
        NSData *authCode = [CSRUtilities IntToNSData:[deviceDict[@"authCode"] integerValue]];

        
        deviceEntity.deviceId = deviceDict[@"deviceID"];
        deviceEntity.deviceHash = devHash;
        deviceEntity.name = deviceDict[@"name"];
        deviceEntity.appearance = deviceDict[@"appearance"];
        deviceEntity.modelLow = modelLow;
        deviceEntity.modelHigh = modelHigh;
        deviceEntity.groups = groups;
        deviceEntity.authCode = authCode;
        deviceEntity.nGroups = deviceDict[@"numgroups"];
        deviceEntity.isAssociated = deviceDict[@"isAssociated"];
        
        if ([CSRAppStateManager sharedInstance].selectedPlace) {
            [[CSRAppStateManager sharedInstance].selectedPlace addDevicesObject:deviceEntity];
        }
    }
    
    [[CSRDatabaseManager sharedInstance] saveContext];
    [[CSRDatabaseManager sharedInstance] loadDatabase];

    
}

- (void) parseAndLoadGroups:(NSArray *)groupsArray {
    
    

    for (NSDictionary *areaDict in groupsArray) {
        
        CSRAreaEntity *groupObj = [NSEntityDescription insertNewObjectForEntityForName:@"CSRAreaEntity" inManagedObjectContext:managedObjectContext];
        
        groupObj.areaName = areaDict[@"name"];
        groupObj.areaID = areaDict[@"areaID"];
        
        if ([CSRAppStateManager sharedInstance].selectedPlace) {
            [[CSRAppStateManager sharedInstance].selectedPlace addAreasObject:groupObj];
        }


    }
    [[CSRDatabaseManager sharedInstance] saveContext];
}

@end
