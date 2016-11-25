//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRmeshManager.h"
#import "CSRConstants.h"
#import "CSRDevicesManager.h"
#import "CSRDeviceEntity.h"
#import "CSRGatewayEntity.h"
#import "CSRDatabaseManager.h"
#import "CSRAppStateManager.h"
#import "CSRMeshUtilities.h"
#import "CSRmeshDevice.h"
#import "CSRUtilities.h"

@implementation CSRmeshManager


+ (id) sharedInstance
{
    
    static dispatch_once_t token;
    static CSRmeshManager *shared = nil;
    
    dispatch_once(&token, ^{
        shared = [[CSRmeshManager alloc] init];
    });
    
    return shared;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setUpDelegates
{
    [[MeshServiceApi sharedInstance] setMeshServiceApiDelegate:self];
    [[AttentionModelApi sharedInstance] setAttentionModelApiDelegate:self];
    [[BearerModelApi sharedInstance] setBearerModelApiDelegate:self];
    [[ConfigModelApi sharedInstance] setConfigModelApiDelegate :self];
    [[FirmwareModelApi sharedInstance] setFirmwareModelApiDelegate:self];
    [[GroupModelApi sharedInstance] setGroupModelApiDelegate:self];
    [[LightModelApi sharedInstance] setLightModelApiDelegate:self];
    [[PowerModelApi sharedInstance] setPowerModelApiDelegate:self];
    [[DataModelApi sharedInstance] setDataModelApiDelegate:self];
    [[PingModelApi sharedInstance] setPingModelApiDelegate:self];
    [[BatteryModelApi sharedInstance] setBatteryModelApiDelegate:self];
    [[SensorModelApi sharedInstance] setSensorModelApiDelegate:self];
    [[ActuatorModelApi sharedInstance] setActuatorModelApiDelegate:self];
}

-(void) setScannerEnabled:(NSNumber *)enabled {
    // Notify all listeners
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    if (enabled)
        [objects setObject:enabled forKey:kScannerEnabledString];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerWillSetScannerEnabledNotification object:self userInfo:objects];
}


-(void) didDiscoverDevice:(CBUUID *)uuid rssi:(NSNumber *)rssi
{
    // Notify all listeners
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    if (uuid)
        [objects setObject:uuid forKey:kDeviceUuidString];
    if (rssi)
        [objects setObject:rssi forKey:kDeviceRssiString];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidDiscoverDeviceNotification object:self userInfo:objects];
}


-(void) didUpdateAppearance:(NSData *)deviceHash appearanceValue:(NSNumber *)appearanceValue shortName:(NSData *)shortName {
    // Notify all listeners
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    if (deviceHash)
        [objects setObject:deviceHash forKey:kDeviceHashString];
    if (appearanceValue)
        [objects setObject:appearanceValue forKey:kAppearanceValueString];
    if (shortName)
        [objects setObject:shortName forKey:kShortNameString];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidUpdateAppearanceNotification object:self userInfo:objects];
}


-(void) isAssociatingDevice:(NSData *)deviceHash stepsCompleted:(NSNumber *)stepsCompleted totalSteps:(NSNumber *)totalSteps meshRequestId:(NSNumber *)meshRequestId {
    [[CSRDevicesManager sharedInstance] updateDeviceAssociationInfo:deviceHash withStepsCompleted:stepsCompleted ofTotalSteps:totalSteps];
    
    // Notify all listeners
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    if (deviceHash)
        [objects setObject:deviceHash forKey:kDeviceHashString];
    if (stepsCompleted)
        [objects setObject:stepsCompleted forKey:kStepsCompletedString];
    if (totalSteps)
        [objects setObject:totalSteps forKey:kTotalStepsString];
    if (meshRequestId)
        [objects setObject:meshRequestId forKey:kMeshRequestIdString];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerIsAssociatingDeviceNotification object:self userInfo:objects];
    
}

-(void) didAssociateDevice:(NSNumber *)deviceId deviceHash:(NSData *)deviceHash meshRequestId:(NSNumber *)meshRequestId
{

    [[CSRDevicesManager sharedInstance] didAssociateDevice:deviceId deviceHash:deviceHash];
    CSRmeshDevice *meshDevice = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:deviceId];
    
    // Create hash from exisitng gateway
    
    __block BOOL isDeviceGateway = [CSRDevicesManager sharedInstance].isDeviceTypeGateway;
    
    if (!isDeviceGateway) {
        
        CSRDeviceEntity *deviceEntity = nil;
        
        // Does the device already exist?
        NSSet *devices = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@",deviceId];
        if (devices && [devices count]>=1) {
            deviceEntity = [devices anyObject];
        }
        else
            deviceEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CSRDeviceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
        
        
        if (deviceEntity) {
            
            deviceEntity.deviceId = deviceId;
            deviceEntity.isAssociated = @(YES);
            deviceEntity.deviceHash = deviceHash;
            if (meshDevice.appearanceValue)
            {
                deviceEntity.appearance = meshDevice.appearanceValue;
            }
            if (meshDevice.appearanceShortname) {
                NSString *shortName = [CSRUtilities stringFromData:meshDevice.appearanceShortname];
                deviceEntity.name = [NSString stringWithFormat:@"%@ %d", shortName, (int)([deviceId intValue]&0x7fff)];
                meshDevice.name = deviceEntity.name;
            }
            
            [[CSRAppStateManager sharedInstance].selectedPlace addDevicesObject:deviceEntity];
            
            [[CSRDatabaseManager sharedInstance] saveContext];
        }
        
        // request model info for this device.
        [[CSRDevicesManager sharedInstance] getModelsAndGroupsCall:deviceId infoType:@(CSR_Model_low)];
        [NSThread sleepForTimeInterval:0.3];
        [[CSRDevicesManager sharedInstance] getModelsAndGroupsCall:deviceId infoType:@(CSR_Model_high)];
        [NSThread sleepForTimeInterval:0.3];
        if (meshDevice.appearanceValue == nil) {
            [[CSRDevicesManager sharedInstance] getModelsAndGroupsCall:deviceId infoType:@(CSR_Appearance)];
        }
        
        // Notify all listeners
        NSMutableDictionary *objects = [NSMutableDictionary dictionary];
        if (deviceId)
            [objects setObject:deviceId forKey:kDeviceIdString];
        if (deviceHash)
            [objects setObject:deviceHash forKey:kDeviceHashString];
        if (meshRequestId)
            [objects setObject:meshRequestId forKey:kMeshRequestIdString];
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidAssociateDeviceNotification object:self userInfo:objects];
        
        NSMutableDictionary *deviceDictionary = [NSMutableDictionary new];
        
        if (deviceEntity.deviceId) {
            [deviceDictionary setValue:deviceEntity.deviceId forKey:kDEVICE_NUMBER];
        }
        
        if (deviceEntity.deviceHash) {
            [deviceDictionary setValue:deviceEntity.deviceHash forKey:kDEVICE_HASH];
        }
        
        if (deviceEntity.authCode) {
            [deviceDictionary setValue:deviceEntity.authCode forKey:kDEVICE_AUTH_CODE];
        }
        
        if (deviceEntity.name) {
            [deviceDictionary setValue:[NSString stringWithFormat:@"%@ (%04x)",[[NSString alloc] initWithData:meshDevice.appearanceShortname encoding:NSUTF8StringEncoding], [deviceId unsignedShortValue]] forKey:kDEVICE_NAME];
        }
        
        if (deviceEntity.isAssociated) {
            [deviceDictionary setValue:deviceEntity.isAssociated forKey:kDEVICE_ISASSOCIATED];
        }
        
        [[CSRDevicesManager sharedInstance] createDeviceFromProperties:deviceDictionary];
        
    } else {
        
        NSMutableDictionary *objects = [NSMutableDictionary dictionary];
        if (deviceId)
            [objects setObject:deviceId forKey:kDeviceIdString];
        if (deviceHash)
            [objects setObject:deviceHash forKey:kDeviceHashString];
        if (meshRequestId)
            [objects setObject:meshRequestId forKey:kMeshRequestIdString];
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidAssociateDeviceNotification object:self userInfo:objects];
        
    }
    
}


-(void) didGetDeviceInfo:(NSNumber *)deviceId info:(NSDictionary *)info infoType:(NSNumber *)infoType meshRequestId:(NSNumber *)meshRequestId
{
    CSRmeshDevice *meshDevice = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:deviceId];
    
    CSRDeviceEntity *deviceEntity = nil;
    // Does the device already exist?
    NSSet *devices = [[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@",deviceId];
    if (devices && [devices count]>=1) {
        deviceEntity = [devices anyObject];
    }
    else {
        deviceEntity = [NSEntityDescription insertNewObjectForEntityForName:@"CSRDeviceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
    }
    
    NSData *data;
    
    if ([infoType intValue] == CSR_Model_low) {
        
        data = info[kDEVICE_MODELS_LOW];
        deviceEntity.modelHigh = data;
        
    }
    if ([infoType intValue] == CSR_Model_high){
        
        data = info[kDEVICE_MODELS_HIGH];
        deviceEntity.modelLow = data;
    }
    
    
    if (meshDevice) {
        
        [meshDevice createModelsWithModelNumber:data withInfoType:infoType];
    }
    
    
    NSNumber *appearance = info[kDEVICE_APPEARANCE];
    if (appearance) {
        NSString *name;
        switch ([appearance integerValue]) {
            case CSRApperanceNameLight:
            case CSRApperanceNameLight2:
                name = [NSString stringWithFormat:@"Light %d",(int)([deviceId intValue]&0x7fff)];
                break;
            case CSRApperanceNameSensor:
            case CSRApperanceNameSensor2:
                name = [NSString stringWithFormat:@"Sensor %d",(int)([deviceId intValue]&0x7fff)];
                break;
            case CSRApperanceNameHeater:
            case CSRApperanceNameHeater2:
                name = [NSString stringWithFormat:@"Heater %d",(int)([deviceId intValue]&0x7fff)];
                break;
            case CSRApperanceNameSwitch:
            case CSRApperanceNameSwitch2:
                name = [NSString stringWithFormat:@"Switch %d",(int)([deviceId intValue]&0x7fff)];
                break;
                
            default:
                break;
        }
        
        meshDevice.name = name;
        
        if (deviceEntity) {
            deviceEntity.name = name;
            deviceEntity.appearance = appearance;
        }
    }
    
    [[CSRDatabaseManager sharedInstance] saveContext];
    // save model info into Database
    [[CSRDatabaseManager sharedInstance] saveDeviceModel:deviceId modelNumber:data infoType:infoType];
    
    if (info) {
        NSMutableDictionary *objects = [NSMutableDictionary dictionaryWithDictionary:info];
        if (meshRequestId)
            [objects setObject:meshRequestId forKey:kMeshRequestIdString];
        if (deviceId)
            [objects setObject:deviceId forKey:kDeviceIdString];
        if (infoType)
            [objects setObject:infoType forKey:kInfoTypeString];
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidGetDeviceInfoNotification object:self userInfo:objects];
    }
}

-(void) didTimeoutMessage:(NSNumber *)meshRequestId
{
    // Notify all listeners
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    
    if (meshRequestId) {
        
        [objects setObject:meshRequestId forKey:kMeshRequestIdString];
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidTimeoutMessageNotification object:self userInfo:objects];
}

#pragma mark models and groups notifications

-(void) didGetNumModelGroupIds:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo numberOfModelGroupIds:(NSNumber *)numberOfModelGroupIds meshRequestId:(NSNumber *)meshRequestId{
    
    NSMutableDictionary *objects = [NSMutableDictionary dictionary];
    if (deviceId)
        [objects setObject:deviceId forKey:kDEVICE_NUMBER];
    if (modelNo)
        [objects setObject:modelNo forKey:kDEVICE_MODEL_NUMBER_STRING];
    if (numberOfModelGroupIds)
        [objects setObject:numberOfModelGroupIds forKey:kDEVICE_NUMBER_OF_MODEL_GROUP_ID_STRING];
    if (meshRequestId)
        [objects setObject:meshRequestId forKey:kDEVICE_MESH_REQUEST_ID_STRING];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDidGetNumberOfModelGroupIdsNotification object:self userInfo:objects];
}




@end
