//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRDevicesManager.h"
#import "CSRDatabaseManager.h"
#import "CSRBluetoothLE.h"
#import "CSRUtilities.h"
#import "CSRConstants.h"
#import "CSRDevicesListViewController.h"
#import "CSRAppStateManager.h"
#import <CSRmesh/SensorModelApi.h>
#import <CSRmesh/ActuatorModelApi.h>
#import "CSRConstants.h"

@interface CSRDevicesManager()

@property (atomic)  NSMutableDictionary *meshRequests;

@end

@implementation CSRDevicesManager

//static CSRDevicesManager *this	= nil;

#pragma mark - Singleton methods

+ (CSRDevicesManager*)sharedInstance
{
    static dispatch_once_t token;
    static CSRDevicesManager *shared = nil;
    
    dispatch_once(&token, ^{
        shared = [[CSRDevicesManager alloc] init];
    });
    
    return shared;
}

- (id)init
{
    if (self = [super init]) {
        
        _unassociatedMeshDevices = [NSMutableArray new];
        _scannedMeshDevices = [NSMutableArray new];
        _meshDevices = [NSMutableArray new];
        _meshAreas = [NSMutableArray new];
        _deviceDictionary = [NSMutableDictionary new];
        [[SensorModelApi sharedInstance] setSensorModelApiDelegate:self];
        
        [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(nsTimerMainQCall) userInfo:nil repeats:YES];
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.12
                                     target:self
                                   selector:@selector(nsTimerMainQCall)
                                   userInfo:nil
                                    repeats:YES];
    return self;
    
}

#pragma mark - NSOperationQueue methods

-(void) nsTimerMainQCall {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        [self timerInMainLoop];
    }];
}


- (void) timerInMainLoop
{
    @synchronized (self) {
        for (CSRmeshDevice *meshDevice in _meshDevices) {
            if (meshDevice.isAssociated) {
                [meshDevice timedMethods];
                
            }
        }
        for (CSRmeshArea *meshArea in _meshAreas) {
            CSRmeshDevice *meshDevice = meshArea.areaDevice;
            if (meshDevice.isAssociated) {
                [meshDevice timedMethods];
                
            }
        }
        
    }
    
}


#pragma mark - Device

- (void)createDeviceFromProperties:(NSDictionary *)deviceProperties
{
    
    CSRmeshDevice *device;
    BOOL isNewDevice = NO;
    @synchronized (self) {
    
        if (deviceProperties[kDEVICE_HASH]) {
            
            NSData *deviceHash = deviceProperties[kDEVICE_HASH];
            device = _deviceDictionary[deviceHash];
            if (device == nil) {
                
                device = [[CSRmeshDevice alloc] initDatabaseDevice:deviceProperties];
                [_deviceDictionary setObject:device forKey:deviceHash];
                
                isNewDevice = YES;
                
            } else {
                
                device = [device initDatabaseDevice:deviceProperties];
                

                
            }
            
            if (device.isAssociated) {
                [_meshDevices addObject:device];
            } else {
                [_scannedMeshDevices addObject:device];
            }
        }
        
        if (device && deviceProperties[kDEVICE_NUMBER]) {
            NSNumber *deviceNumber = deviceProperties[kDEVICE_NUMBER];
            if (_deviceDictionary[deviceNumber]  == nil || isNewDevice)
                [_deviceDictionary setObject:device forKey:deviceNumber];
        }
    }
}

- (CSRmeshDevice *)getDeviceWithDevicePredicate:(NSData*)value
{
    CSRmeshDevice *meshDevice;
    if (value) {
     meshDevice = _deviceDictionary [value];
        
    }
    
    return meshDevice;
}

- (void)addScannedDevice:(CSRmeshDevice*)mDevice
{
    [_scannedMeshDevices addObject:mDevice];
}

// ADD a new device if required.
- (CSRmeshDevice *)addDeviceWithUUID:(NSUUID *)uuid andRSSI:(NSNumber *)rssi
{
    NSData *deviceHash = [[MeshServiceApi sharedInstance] getDeviceHashFromUuid:(CBUUID*)uuid];
 
    
    CSRmeshDevice *meshDevice = [[CSRmeshDevice alloc] init];
    [meshDevice setUuid:uuid];
    [meshDevice setRssi:rssi];
    [meshDevice setDeviceHash:deviceHash];
    
    [_deviceDictionary setObject:meshDevice forKey:uuid];
    [_deviceDictionary setObject:meshDevice forKey:deviceHash];

//    [_unassociatedMeshDevices addObject:meshDevice];
    
    return (meshDevice);
}



-(NSInteger) getTotalAssociatedDevices {
    NSInteger total = 0;
    for (CSRmeshDevice *meshDevice in _meshDevices) {
        if (meshDevice.isAssociated)
            total+=1;
    }
    return (total);
}

// return the associated device at the given offset.
- (CSRmeshDevice *)getDeviceFromAssociatedList:(NSInteger)offset
{
    NSInteger total = 0;
    
    NSArray *sortedDevicesArray = [NSArray arrayWithArray:_meshDevices];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    _meshDevices = (NSMutableArray*)[sortedDevicesArray sortedArrayUsingDescriptors:@[sort]];
    _meshDevices = [_meshDevices mutableCopy];
    
    for (CSRmeshDevice *meshDevice in _meshDevices) {
        if (meshDevice.isAssociated) {
            if (offset == total)
                return (meshDevice);
            total+=1;
        }
    }
    return (nil);
}

- (NSArray*)getMeshDevicesArray
{
    return [NSArray arrayWithArray:_meshDevices];
}


-(void) didAssociateDevice :(NSNumber *) deviceId deviceHash:(NSData *) deviceHash {
    CSRmeshDevice *meshDevice = _deviceDictionary [deviceHash];
    if (meshDevice) {
        [_deviceDictionary setObject:meshDevice forKey:deviceId];
        [meshDevice didAssociateDevice:deviceId];
    }
}

- (CSRmeshDevice *) addDeviceWithDeviceHash :(NSData *) deviceHash authCode:(NSData *) authCode {
    CSRmeshDevice *meshDevice = _deviceDictionary [deviceHash];
    if (meshDevice == nil) {
        meshDevice = [[CSRmeshDevice alloc] init];
        [_deviceDictionary setObject:meshDevice forKey:deviceHash];
        [_scannedMeshDevices addObject:meshDevice];
        [meshDevice setDeviceHash:deviceHash];
    }
    
    [meshDevice setAuthCode:authCode];
    
    return (meshDevice);
}

-(CSRmeshDevice *) getDeviceFromDeviceId :(NSNumber *) deviceId
{
    CSRmeshDevice *meshDevice;
    if (_deviceDictionary[deviceId])
    {
       meshDevice = _deviceDictionary [deviceId];
    } else {
        meshDevice = nil;//[self addDeviceWithDeviceHash:<#(NSData *)#> authCode:<#(NSData *)#>];
    }
    return (meshDevice);
}

-(void) setDeviceDiscoveryFilter:(id)obj mode:(BOOL) mode
{
    static NSMutableSet *filterSetToYesObjects;
    if (filterSetToYesObjects==nil)
        filterSetToYesObjects = [NSMutableSet set];
    NSInteger totalObjects = [filterSetToYesObjects count];
    if (mode==YES)
        [filterSetToYesObjects addObject:obj];
    else
        [filterSetToYesObjects removeObject:obj];
    
    if (totalObjects==0 && [filterSetToYesObjects count])
        [[CSRDevicesManager sharedInstance] setDeviceDiscoveryFilterEnabled:YES];
    else if ([filterSetToYesObjects count]==0 && totalObjects)
        [[CSRDevicesManager sharedInstance] setDeviceDiscoveryFilterEnabled:NO];
}


-(void) updateAppearance :(NSData *) deviceHash appearanceValue:(NSNumber *) appearanceValue shortName:(NSData *) shortName
{
    CSRmeshDevice *device = _deviceDictionary[deviceHash];
    if (device) {
        [device setAppearanceValue :appearanceValue];
        [device setAppearanceShortname :shortName];
        if (![[[NSString alloc] initWithData:device.appearanceShortname encoding:NSUTF8StringEncoding] isEqualToString:@"CSRmeshGW"])
        {
            [_unassociatedMeshDevices addObject:device];
        }
    }
}

- (void)updateDeviceAssociationInfo:(NSData *)deviceHash withStepsCompleted:(NSNumber *)stepsCompleted ofTotalSteps:(NSNumber *)totalSteps
{
    CSRmeshDevice *meshDevice = _deviceDictionary [deviceHash];
    if (meshDevice) {
        [meshDevice updateAssociationStatusWithNumberofStepsCompleted:stepsCompleted ofTotalSteps:totalSteps];
    }

}

- (CSRmeshDevice *)checkPreviouslyScannedDevicesWithDeviceHash:(NSData*)deviceHash
{
    __block CSRmeshDevice *foundDevice;
    [_scannedMeshDevices enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CSRmeshDevice *scannedDevice = (CSRmeshDevice *)obj;
        
        if ([scannedDevice.deviceHash isEqualToData:deviceHash]) {
            foundDevice = scannedDevice;
            *stop = YES;
        }
    }];
    
    if (foundDevice) {
        return foundDevice;
    }
    
    return nil;
}

- (CSRmeshDevice*)getAllDevices
{
//    return (_allDevicesArea.areaDevice);
    return nil;
}

#pragma mark ----
#pragma mark - AREA related Functions

-(void) createAreaFromProperties : (NSDictionary *) areaProperties {
    
    NSNumber *areaNumber = areaProperties [kAREA_NUMBER];
    NSString *areaName = areaProperties [kAREA_NAME];
    
    @synchronized (self) {
        CSRmeshArea *area = [[CSRmeshArea alloc] initWithNumber:areaNumber andName:areaName];
        [_meshAreas addObject:area];
        
//        [area setAreaName:areaName];
    }
}

- (NSInteger) getTotalAreas {
    return (_meshAreas.count);
}


- (CSRAreaEntity*) addMeshArea:(NSString *)name {
    
    int areaInt = [[CSRDatabaseManager sharedInstance] getNextFreeAreaInt];
    CSRmeshArea *area = [[CSRmeshArea alloc] initWithNumber:@(areaInt) andName:name];
    [_meshAreas addObject:area];
    
    CSRAreaEntity *areaObj = [[CSRDatabaseManager sharedInstance] saveNewArea:@(areaInt) areaName:name];

    return areaObj;
}

-(CSRmeshArea *) getArea :(NSInteger) offset {
    
    CSRmeshArea *meshArea = nil;
    
    NSArray *sortedArray = [NSArray arrayWithArray:_meshAreas];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"areaName" ascending:YES];
    _meshAreas = (NSMutableArray*)[sortedArray sortedArrayUsingDescriptors:@[sort]];
    _meshAreas = [_meshAreas mutableCopy];
    
    if (offset <= _meshAreas.count)
        meshArea = _meshAreas[offset];
    return (meshArea);
}

- (CSRmeshArea *) getAreaFromId :(NSNumber *) areaIdNumber {
    for (CSRmeshArea *meshArea in _meshAreas) {
        if ([areaIdNumber isEqualToNumber:meshArea.areaNumber])
            return (meshArea);
    }
    return (nil);
}

#pragma mark ------
#pragma mark Remove Devices

- (void)initiateRemoveDevice:(CSRmeshDevice *)meshDevice
{
    @synchronized (self)
    {
        [[CSRBluetoothLE sharedInstance] setScanner:YES :meshDevice];
        [self setDeviceDiscoveryFilter:meshDevice mode:YES];
        [self resetDevice:meshDevice.deviceId];
        [meshDevice setResetRetriesRemaining:20];
        [meshDevice setResetTimer:[NSTimer scheduledTimerWithTimeInterval:0.5
                                                                   target:self
                                                                 selector:@selector(resetRetryEngine:)
                                                                 userInfo:meshDevice
                                                                  repeats:YES]];
        meshDevice.uuid = nil;
        meshDevice.pendingRemoval = YES;
        
        
    }
}

-(void) resetRetryEngine :(NSTimer *) timer {
    CSRmeshDevice *meshDevice = timer.userInfo;
    if (meshDevice != nil && meshDevice.uuid == nil) {
        if (meshDevice.resetRetriesRemaining) {
            [[CSRDevicesManager sharedInstance] resetDevice:meshDevice.deviceId];
            meshDevice.resetRetriesRemaining -= 1;
        }
        else {
            if (meshDevice.resetTimer)
                [meshDevice.resetTimer invalidate];
            else
                [timer invalidate];
        }
    }
}

- (void) removeDevice:(CSRmeshDevice *)meshDevice
{
    @synchronized(self)
    {
        [self setDeviceDiscoveryFilter:meshDevice mode:NO];
        if (meshDevice.resetTimer)
            [meshDevice.resetTimer invalidate];
        [self didResetDevice:meshDevice.deviceId];
        
        NSArray *keys = [_deviceDictionary allKeys];
        for (id key in keys) {
            if ([_deviceDictionary[key] isEqual:meshDevice]) {
                [_deviceDictionary removeObjectForKey:key];
            }
        }
        [[CSRBluetoothLE sharedInstance] setScanner:NO :meshDevice];
        [_meshDevices removeObject:meshDevice];
        meshDevice.pendingRemoval = NO;
    }
}


-(void) didResetDevice :(NSNumber *) deviceId {
    CSRmeshDevice *meshDevice = _deviceDictionary [deviceId];
    if (meshDevice) {
        [_deviceDictionary removeObjectForKey:deviceId];
        [meshDevice didResetDevice];
//        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRDevicesManagerDidRemoveUnassociatedDevicesNotification object:self userInfo:nil];
    }
}

#pragma mark ------
#pragma mark Remove Areas

- (void) removeAreaWithAreaId:(NSNumber *)areaId
{
    CSRmeshArea *meshArea = [self getAreaFromId:areaId];
    [_meshAreas removeObject:meshArea];
    [[CSRDatabaseManager sharedInstance] removeAreaFromDatabaseWithAreaId:areaId];
}

#pragma mark ------
#pragma mark Temperature Control Methods

//============================================================================
// Actuator message to set desired temperature
-(void) setDesiredTemperatureForArea :(CSRmeshArea *) meshArea
{
    if (meshArea.setTemperatureDelay) {
        [meshArea.setTemperatureDelay invalidate];
    }
    
    meshArea.setTemperatureDelay = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                                     target:self
                                                                   selector:@selector(setTemperatureDelayed:)
                                                                   userInfo:meshArea
                                                                    repeats:NO];
}

-(void) setTemperatureDelayed :(NSTimer *) timer
{
    CSRmeshArea *meshArea = timer.userInfo;
    if (meshArea) {
        NSNumber *actuatorType = @(CSR_DESIRED_AIR_TEMPERATURE);
        float centirgrade = [meshArea.desiredTemperatureSetByUser floatValue];
        NSLog (@"Set Temp=%0.1f °C",centirgrade);
        float kelvin = centirgrade + 273.15;
        NSNumber *temperatureValue = @(kelvin);
        NSNumber *meshReq = [[ActuatorModelApi sharedInstance] setValue:meshArea.areaNumber actuatorType:actuatorType actuatorValue:temperatureValue success:^(NSNumber *deviceId, NSNumber *actuatorType) {
            NSLog(@"deviceId :%@, actuatorType :%@", deviceId, actuatorType);
        } failure:^(NSError *error) {
            //
        }];
//        NSNumber *meshRequest = [[ActuatorModelApi sharedInstance] setValue:meshArea.areaNumber actuatorType:actuatorType actuatorValue:temperatureValue acknowledge:@YES];
        [_meshRequests setObject:meshArea forKey:meshReq];
        
        // Remove previous unacknowledged requests
        NSMutableArray *removals = [NSMutableArray array];
        for (NSNumber *oldMeshRequestId in meshArea.meshRequests) {
            [removals addObject:oldMeshRequestId];
            [[MeshServiceApi sharedInstance] killTransaction:oldMeshRequestId];
        }
        
        if (removals.count>0) {
            for (NSNumber *oldMeshRequestId in removals) {
                [meshArea.meshRequests removeObjectForKey:oldMeshRequestId];
            }
        }
        
        // Create a record for this request so it can be paired with acknowledgement
        NSMutableDictionary *request = [NSMutableDictionary dictionary];
        request[AREA_MESH_REQUEST] = meshArea;
        request[AREA_SENSOR_TYPE] =  actuatorType;
        request[AREA_SENSOR_VALUE] = meshArea.desiredTemperatureSetByUser;
        request[AREA_SENSOR_CONVERTED_VALUE] = temperatureValue;
        [meshArea.meshRequests setObject:request forKey:meshReq];
        
        // remove NSTimer object as this is used to decide whether we should set deisred temp from received.
        meshArea.setTemperatureDelay=nil;
    }
}

//============================================================================
// Sensor Actuator Notifications
-(void) didGetSensorTypes :(NSNotification *)notification
{
}

-(void) didGetSensorState :(NSNotification *)notification
{
}

//============================================================================
// Post a notification when a sensor changes so the UI can respond
-(void) postNotifcation
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SENSOR_VALUE_CHANGED object:self userInfo:nil];
}



//============================================================================
// Assume desired temperture acknowledge has been received. Check that this is so and for the meshGroup that
// this acknowledge is related to the meshRequest, if its desiredTemperature is equal to the received then set its
// isDesiredTemperatureAcknowledged to YES.
-(void) didGetSensorValue:(NSNumber *)deviceId sensors:(NSDictionary *)sensors meshRequestId:(NSNumber *)meshRequest
{
    if (meshRequest) {
        CSRmeshArea *meshArea = _meshRequests [meshRequest];
        [_meshRequests removeObjectForKey:meshRequest];
        if (meshArea && [meshArea isKindOfClass:[CSRmeshArea class]]) {
            for (NSNumber *sensorType in sensors) {
                if ([sensorType isEqualToNumber:@(CSR_DESIRED_AIR_TEMPERATURE)]) {
                    NSNumber *value = sensors[sensorType];
                    float centigrade = (roundf(([value floatValue]-273.15)*10))/10;
                    value = [NSNumber numberWithFloat:centigrade];
                    meshArea.desiredTemperatureAcknowledged = value;
                    [self postNotifcation];
                }
                else if ([sensorType isEqualToNumber:@(CSR_INTERNAL_AIR_TEMPERATURE)]) {
                    NSNumber *value = sensors[sensorType];
                    float centigrade = (roundf(([value floatValue]-273.15)*10))/10;
                    value = [NSNumber numberWithFloat:centigrade];
                    meshArea.currentTemperature = value;
                    [self postNotifcation];
                }
            }
        }
    }
    else {
        if (deviceId) {
            CSRmeshArea *meshArea = [self getAreaFromId:deviceId];
            if (meshArea) {
                if (sensors) {
                    for (NSNumber *type in sensors) {
                        if ([type isEqualToNumber:@(CSR_DESIRED_AIR_TEMPERATURE)]) {
                            NSNumber *value = sensors[type];
                            float centigrade = (roundf(([value floatValue]-273.15)*10))/10;
                            value = [NSNumber numberWithFloat:centigrade];
                            meshArea.desiredTemperatureAcknowledged = value;
                            // Set the desired value from received but only if we are not waiting to send desired.
                            if (meshArea.setTemperatureDelay == nil && meshArea.meshRequests.count == 0)
                                meshArea.desiredTemperatureSetByUser = value;
                            [self postNotifcation];
                        }
                        else if ([type isEqualToNumber:@(CSR_INTERNAL_AIR_TEMPERATURE)]) {
                            NSNumber *value = sensors[type];
                            float centigrade = (roundf(([value floatValue]-273.15)*10))/10;
                            value = [NSNumber numberWithFloat:centigrade];
                            meshArea.currentTemperature = value;
                            [self postNotifcation];
                        }
                    }
                }
            }
        }
    }
}

-(void) didGetActuatorValueAck :(NSNotification *)notification
{
    NSNumber *meshRequest = notification.userInfo[kMeshRequestIdString];
    if (meshRequest) {
        CSRmeshArea *meshArea = _meshRequests [meshRequest];
        [_meshRequests removeObjectForKey:meshRequest];
        if (meshArea && [meshArea isKindOfClass:[CSRmeshArea class]]) {
            // retrieve record for this request
            NSMutableDictionary *request = meshArea.meshRequests[meshRequest];
            if (request) {
                NSNumber *rxSensorType = notification.userInfo[kActuatorTypeString];
                NSNumber *txSensorType = request[AREA_SENSOR_TYPE];
                if ([rxSensorType isEqualToNumber:txSensorType]) {
                    meshArea.desiredTemperatureAcknowledged = request[AREA_SENSOR_VALUE];
                    [self postNotifcation];
                }
                // remove record for this request
                [meshArea.meshRequests removeObjectForKey:meshRequest];
            }
        }
    }
}


-(void) didTimeoutNotification :(NSNotification *)notification {
    NSNumber *meshRequest = notification.userInfo[kMeshRequestIdString];
    if (meshRequest) {
        [_meshRequests removeObjectForKey:meshRequest];
        CSRmeshArea *meshArea = _meshRequests [meshRequest];
        if (meshArea && [meshArea isKindOfClass:[CSRmeshArea class]]) {
            [meshArea.meshRequests removeObjectForKey:meshRequest];
        }
    }
}

#pragma mark ------
#pragma mark API Calls

- (void)associateDeviceFromCSRDeviceManager:(NSData *)deviceHash authorisationCode:(NSData *)authCode
{
    
    // get the next free device ID
    NSNumber *deviceId;
    
    if (_isDeviceTypeGateway) {
        
        deviceId = [[CSRDatabaseManager sharedInstance] getNextFreeGatewayDeviceId];
        
    } else {
        
        deviceId = [[CSRDatabaseManager sharedInstance] getNextFreeDeviceNumber];
        
    }
    
    [[MeshServiceApi sharedInstance] associateDevice:deviceHash
                                   authorisationCode:authCode
                                            deviceId:deviceId
                                             success:^(NSNumber *deviceId, NSData *deviceHash, NSNumber *meshRequestId) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDeviceAssociationSuccessNotification
                                                            object:self
                                                          userInfo:@{@"deviceId": deviceId, @"deviceHash":deviceHash}];
        
    } progress:^(NSData *deviceHash, NSNumber *stepsCompleted, NSNumber *totalSteps, NSNumber *meshRequestId) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDeviceAssociationProgressNotification
                                                            object:self
                                                          userInfo:@{@"stepsCompleted": stepsCompleted, @"totalSteps":totalSteps}];
        
    } failure:^(NSError *error) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kCSRmeshManagerDeviceAssociationFailedNotification
                                                            object:self
                                                          userInfo:@{@"error":error}];
        
    }];
    
}

- (void)getModelsAndGroupsCall:(NSNumber *)deviceId infoType:(NSNumber *)infoType
{
    [[ConfigModelApi sharedInstance] getInfo:deviceId infoType:infoType success:^(NSNumber *deviceId, NSDictionary *info, NSNumber *infoType) {
        //
    } failure:^(NSError *error) {
        //
    }];
}

- (void)setDeviceDiscoveryFilterEnabled:(BOOL)enabled
{
    [[MeshServiceApi sharedInstance] setDeviceDiscoveryFilterEnabled:enabled uuid:^(CBUUID *uuid, NSNumber *rssi) {
        NSLog (@"uuid=%@",uuid);
    } appearance:^(NSData *deviceHash, NSNumber *appearanceValue, NSData *shortName) {
        NSString *name = [[NSString alloc] initWithData:shortName encoding:NSUTF8StringEncoding];
        NSLog (@"Appearance=%@ %@",appearanceValue, name);
    }];
}

- (void)setAttention:(NSData *)deviceHash attentionState:(NSNumber *)attentionState withDuration:(NSNumber *)duration
{
    [[MeshServiceApi sharedInstance] setAttentionPreAssociation:deviceHash attentionState:attentionState withDuration:duration];
}

- (void)getNumberOfModelGroupIds:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo
{
    [[GroupModelApi sharedInstance] getNumModelGroupIds:deviceId modelNo:modelNo success:^(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds) {
        
    } failure:^(NSError *error) {
        //
    }];
}

- (void)setSiteID:(NSString *) siteID
{
    [[MeshServiceApi sharedInstance] setNetworkPassPhrase:siteID];
}

-(void) setNetworkPassPhrase:(NSString *)passPhrase
{
    [[MeshServiceApi sharedInstance] setNetworkPassPhrase:passPhrase];
}

-(void) setAttentionPreAssociation:(NSData *)deviceHash attentionState:(NSNumber *)attentionState withDuration:(NSNumber *) duration
{
    [[MeshServiceApi sharedInstance] setAttentionPreAssociation:deviceHash attentionState:attentionState withDuration:duration];
}

-(void) resetDevice:(NSNumber *)deviceId
{
    [[ConfigModelApi sharedInstance] resetDevice:deviceId];
}

- (void) setNextDeviceID:(NSNumber *)deviceNo
{
    [[MeshServiceApi sharedInstance] setNextDeviceId:deviceNo];
}

- (id)getStateForDeviceWithId:(NSNumber *)deviceId
{
    
    CSRmeshDevice *device = [self getDeviceFromDeviceId:deviceId];
    
    if (device) {
        
        return device.stateValue;
        
    }
    
    return nil;
}


@end
