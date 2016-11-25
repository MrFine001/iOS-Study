//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header PowerModelApi is a part of the CSRmesh Api and provides a set of methods related to the Power Model.
 */


@protocol PowerModelApiDelegate <NSObject>
@optional

/*!
 * @brief didGetPowerState. An acknowledgement to the request to getState, setPowerState. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param state - (NSNumber *) The current power state (0=Off, 1=On, 2=Standby, 3=On from Standby)
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetPowerState:(NSNumber *)deviceId state:(NSNumber *)state meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) setPowerState:(NSNumber *)deviceId state:(NSNumber *)state success:(void (^)(NSNumber *deviceId, NSNumber *state)) success failure:(void (^)(NSError *error))failure");

@end


@interface PowerModelApi : CSRmeshApi


/*!
* @brief getState - Request the power state. The callback didGetPowerState is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
* @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
* @param success - Block called upon successful execution
* @param failure - Block called upon error
* @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
*/
-(NSNumber *) getState:(NSNumber *)deviceId
               success:(void (^)(NSNumber *deviceId, NSNumber *state)) success
               failure:(void (^)(NSError *error))failure;



-(NSNumber *) getState:(NSNumber *)deviceId
__deprecated_msg("use -(NSNumber *) getState:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId, NSNumber *state)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief setPowerState - Set the power state. The callback didGetPowerState is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param state - (NSNumber *) The desired power state (0=Off, 1=On, 2=Standby, 3=On from Standby)
 * @param success - Block called upon successful execution, set to nil to inhibit acknowledgement.
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) setPowerState:(NSNumber *)deviceId
                      state:(NSNumber *)state
                    success:(void (^)(NSNumber *deviceId, NSNumber *state)) success
                    failure:(void (^)(NSError *error))failure;



-(NSNumber *) setPowerState:(NSNumber *)deviceId state:(NSNumber *)state acknowledged:(BOOL)acknowledged
__deprecated_msg("use -(NSNumber *) setPowerState:(NSNumber *)deviceId state:(NSNumber *)state success:(void (^)(NSNumber *deviceId, NSNumber *state)) success failure:(void (^)(NSError *error))failure");



/*!
 * @brief togglePowerState - If the current PowerState is 0x00, Off, then the PowerState shall be set to 0x01, On.
 If the current PowerState is 0x01, On, then the PowerState shall be set to 0x00, Off.
 If the current PowerState is 0x02, Standby, then the PowerState shall be set to 0x03, OnFromStandby. If the current PowerState is 0x03, OnFromStandby, then the PowerState shall be set to 0x02, Standby.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution, set to nil to inhibit acknowledgement.
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
- (NSNumber *)togglePowerState:(NSNumber *)deviceId
                       success:(void (^)(NSNumber *deviceId, NSNumber *state)) success
                       failure:(void (^)(NSError *error))failure;


    // The Delegate for this object
@property (nonatomic, weak)   id<PowerModelApiDelegate>  powerModelApiDelegate;

@end
