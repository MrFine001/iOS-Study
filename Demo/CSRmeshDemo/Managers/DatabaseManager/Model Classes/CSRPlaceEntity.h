//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CSRAreaEntity, CSRDeviceEntity, CSRGatewayEntity, CSRSettingsEntity;

@interface CSRPlaceEntity : NSManagedObject

@property (nonatomic, retain) NSString * cloudSiteID;
@property (nonatomic, retain) NSNumber * color;
@property (nonatomic, retain) NSNumber * hostControllerID;
@property (nonatomic, retain) NSNumber * iconID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * networkKey;
@property (nonatomic, retain) NSString * owner;
@property (nonatomic, retain) NSSet *areas;
@property (nonatomic, retain) NSSet *devices;
@property (nonatomic, retain) NSSet *gateways;
@property (nonatomic, retain) CSRSettingsEntity *settings;
@end

@interface CSRPlaceEntity (CoreDataGeneratedAccessors)

- (void)addAreasObject:(CSRAreaEntity *)value;
- (void)removeAreasObject:(CSRAreaEntity *)value;
- (void)addAreas:(NSSet *)values;
- (void)removeAreas:(NSSet *)values;

- (void)addDevicesObject:(CSRDeviceEntity *)value;
- (void)removeDevicesObject:(CSRDeviceEntity *)value;
- (void)addDevices:(NSSet *)values;
- (void)removeDevices:(NSSet *)values;

- (void)addGatewaysObject:(CSRGatewayEntity *)value;
- (void)removeGatewaysObject:(CSRGatewayEntity *)value;
- (void)addGateways:(NSSet *)values;
- (void)removeGateways:(NSSet *)values;

@end
