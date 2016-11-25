//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header BatteryModelApi is a part of the CSRmesh Api and provides a set of methods related to the Battery Model.
 */


@protocol BatteryModelApiDelegate <NSObject>
@optional


/*!
 * @brief didGetBatteryState. An acknowledgement to the request to get the Battery State. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param batteryLevel - (NSNumber *) one octet - values from 0x00 to 0x64 that represent a linear scaling from empty to full capacity.
 * @param batteryState - (NSNumber *) one octet - Each bit is a Boolean value that determines if a given state is true or false. The value of zero is false, the value of one is true. Battery is powering device 0 ,Battery is charging 1 , Device is externally powered 2 , Service is required for battery 3 , Battery needs replacement 4.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetBatteryState:(NSNumber *)deviceId batteryLevel:(NSNumber *)batteryLevel batteryState:(NSNumber *)batteryState meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getState:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");

@end

@interface BatteryModelApi : CSRmeshApi

/*!
 * @brief getState - request the Battery info from the CSRmesh device. The callback didGetBatteryState is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution. batteryLevel - (NSNumber *) one octet - values from 0x00 to 0x64 that represent a linear scaling from empty to full capacity.
  *batteryState - (NSNumber *) one octet - Each bit is a Boolean value that determines if a given state is true or false. The value of zero is false, the value of one is true. Battery is powering device 0 ,Battery is charging 1 , Device is externally powered 2 , Service is required for battery 3 , Battery needs replacement 4.
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) getState:(NSNumber *)deviceId
               success:(void (^)(NSNumber *deviceId, NSNumber *batteryLevel, NSNumber *batteryState)) success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) getState:(NSNumber *)deviceId
__deprecated_msg("use -(NSNumber *) getState:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");


// The Delegate for this object
@property (nonatomic, weak)   id<BatteryModelApiDelegate>  batteryModelApiDelegate;

@end
