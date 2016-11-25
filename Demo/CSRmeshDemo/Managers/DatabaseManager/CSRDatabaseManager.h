//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CSRDatabaseManager.h"
#import "CSRAreaEntity.h"
#import "CSRSettingsEntity.h"

@interface CSRDatabaseManager : NSObject {
    BOOL newDatabase;
}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CSRDatabaseManager*)sharedInstance;
- (void)saveContext;

//Fetch
- (NSSet *)fetchObjectsWithEntityName:(NSString *)entityName withPredicate:(id)stringOrPredicate, ...;

//DEVICE
-(void) saveDeviceId :(NSNumber *) newDeviceId;
- (NSNumber *) getNextFreeDeviceNumber;
- (int) getNextFreeAreaInt;

#pragma mark - Gateway methods
- (NSNumber*)getNextFreeGatewayDeviceId;

//Groups
- (CSRAreaEntity*) saveNewArea :(NSNumber *) areaId areaName:(NSString *) areaName;
- (void) saveAreaId :(NSNumber *) newAreaId;

// Remove Device
-(void) removeDeviceFromDatabase :(NSNumber *) deviceId;

//Remove Area
- (void) removeAreaFromDatabaseWithAreaId:(NSNumber*)areaId;

//Database Local functions
-(void) loadDatabase;
//-(NSString *) fetchNetworkKey;
- (CSRAreaEntity *) fetchAreaEntity :(NSNumber *) groupId;
- (CSRSettingsEntity *)fetchSettingsEntity;
- (CSRSettingsEntity *)settingsForCurrentlySelectedPlace;

- (void) saveDeviceModel :(NSNumber *) deviceNumber modelNumber:(NSData *) modelNumber infoType:(NSNumber *) infoType;

//relate device with groups
- (void) toggleDeviceAreaMembership:(NSNumber*)deviceId andAreaId:(NSNumber*)areaId withIndex:(NSNumber*)index;

@end
