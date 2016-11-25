//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header ActuatorModelApi is a part of the CSRmesh Api and provides a set of methods related to the Actuator Model.
 */


@protocol ActuatorModelApiDelegate <NSObject>
@optional


/*!
 * @brief didGetActuatorTypes. An acknowledgement to the request to get the Actuator Types. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param actuatorTypesArray - (NSArray *) Array of unsigned short NSNumber values that represent the Actuator types.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetActuatorTypes :(NSNumber *)deviceId actuatorTypesArray:(NSArray *)actuatorTypesArray meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getTypes :(NSNumber *)deviceId firstType:(NSNumber *)firstType success:(void (^)(NSNumber *deviceId, NSNumber *actuatorType)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief didGetActuatorValue. An acknowledgement to the request to set the Actuator State. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param actuatorType - (NSNumber *) The actuator Type as an unsigned short NSNumber.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetActuatorValueAck :(NSNumber *)deviceId actuatorType:(NSNumber *)actuatorType  meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) setValue:(NSNumber *)deviceId actuatorType:(NSNumber *)actuatorType actuatorValue:(NSNumber *)actuatorValue success:(void (^)(NSNumber *deviceId, NSNumber *actuatorType)) success failure:(void (^)(NSError *error))failure");


@end


@interface ActuatorModelApi : CSRmeshApi


/*!
 * @brief getTypes - request the Actuator Types that follow from the given given Actuator. If success is not nil then upon a successful transaction the success code block is executed and the callback didGetActuatorTypes shall be invoked. If the transaction fails then the failure code block shall be executed and the callback MeshServiceApi:didTimeoutMessage shall be invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param firstType - (NSNumber *) The first actuator type as an unsigned short.
 * @param success - Code block executed upon a successful transaction. The success code block parameters are (NSNumber *deviceId, NSNumber *actuatorType)
 * @param failure - Code block executed upon a failed transaction.
 * @return meshRequestId - (NSNumber *) The id of the request. If success is nil then it is assumed an acknowledge is not required and therefore nil shall be returned.
 */
- (NSNumber *)getTypes:(NSNumber *)deviceId
             firstType:(NSNumber *)firstType
               success:(void (^)(NSNumber *deviceId, NSArray *actuatorTypes)) success
               failure:(void (^)(NSError *error))failure;




-(NSNumber *) getTypes :(NSNumber *)deviceId firstType:(NSNumber *)firstType
__deprecated_msg("use -(NSNumber *) getTypes :(NSNumber *)deviceId firstType:(NSNumber *)firstType");

/*!
 * @brief setValue - Write the given value to the given actuator. If success is not nil then upon a successful transaction the success code block is executed and the callback didGetActuatorValue shall be invoked. If the transaction fails then the failure code block shall be executed and the callback MeshServiceApi:didTimeoutMessage shall be invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param actuatorType - (NSNumber *) The actuator type as an unsigned short wrapped up in an NSNumber.
 * @param actuatorValue - (NSData *) The value for an actuator as double wrapped in NSNumber. For temperature units are kelvin.
 * @param success - Code block executed upon a successful transaction. The success code block parameters are (NSNumber *deviceId, NSNumber *actuatorType)
 * @param failure - Code block executed upon a failed transaction.
 * @return meshRequestId - (NSNumber *) The id of the request. If success is nil then it is assumed an acknowledge is not required and therefore nil shall be returned.
 */
-(NSNumber *) setValue:(NSNumber *)deviceId
          actuatorType:(NSNumber *)actuatorType
         actuatorValue:(NSNumber *)actuatorValue
               success:(void (^)(NSNumber *deviceId, NSNumber *actuatorType)) success
               failure:(void (^)(NSError *error))failure;



-(NSNumber *) setValue:(NSNumber *)deviceId actuatorType:(NSNumber *)actuatorType actuatorValue:(NSNumber *)actuatorValue acknowledge:(NSNumber *)ack
__deprecated_msg("use -(NSNumber *) setValue:(NSNumber *)deviceId actuatorType:(NSNumber *)actuatorType actuatorValue:(NSNumber *)actuatorValue success:(void (^)(NSNumber *deviceId, NSNumber *actuatorType)) success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<ActuatorModelApiDelegate>  actuatorModelApiDelegate;


@end

