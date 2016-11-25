//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header SensorModelApi is a part of the CSRmesh Api and provides a set of methods related to the Sensor Model.
 */


@protocol SensorModelApiDelegate <NSObject>
@optional


/*!
 * @brief didGetSensorTypes. An acknowledgement to the request to get the Sensor Types. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensorTypesArray - (NSArray *) Array of unsigned short NSNumber values that represent the sensor types.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetSensorTypes:(NSNumber *)deviceId sensorTypesArray:(NSArray *)sensorTypesArray meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getTypes:(NSNumber *)deviceId firstType:(NSNumber *)firstType success:(void (^)(NSNumber *deviceId, NSArray *sensorTypes)) success failure:(void (^)(NSError *error))failure");


/*!
 * @brief didSetSensorState. An acknowledgement to the request to set the Sensor State. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensorType - (NSNumber *) The sensor Type as an unsigned short NSNumber.
 * @param repeatInterval - (NSNumber *) The repeat Interval as an unsigned char.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetSensorState:(NSNumber *)deviceId sensorType:(NSNumber *)sensorType repeatInterval:(NSNumber *)repeatInterval  meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getState:(NSNumber *)deviceId sensorType:(NSNumber *)sensorType success:(void (^)(NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief didGetSensorValue. An acknowledgement to the request to set the Sensor State. Provides the value for up to 2 sensor types. The value is of variable length from 0 to 4 octets. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensors - (NSDictionary) - The key is the NSNumber of the sensor Type as an unsigned short and the Value is the float of the sensor value wrapped in an NSNumber.
 * Temperature value will be of type float in units of kelvin and in steps of 1/32 or 0.03125
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetSensorValue:(NSNumber *)deviceId sensors:(NSDictionary *)sensors meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getValue:(NSNumber *)deviceId sensorType1:(NSNumber *)sensorType1 sensorType2:(NSNumber *)sensorType2 success:(void (^)(NSNumber *deviceId, NSDictionary *sensors)) success failure:(void (^)(NSError *error))failure");


@end


@interface SensorModelApi : CSRmeshApi

/*!
 * @enum  SensorTypes
 *        Pass as an unsigned short in an NSNumber object
 * @const   CSR_INTERNAL_AIR_TEMPERATURE The internal air temperature
 * @const   CSR_EXTERNAL_AIR_TEMPERATURE The External air temperature
 * @const   CSR_DESIRED_AIR_TEMPERATURE The desired air temperature
 */
enum SensorTypes {
    CSR_INTERNAL_AIR_TEMPERATURE=1,
    CSR_EXTERNAL_AIR_TEMPERATURE=2,
    CSR_DESIRED_AIR_TEMPERATURE=3
};


/*!
 * @brief getTypes - request the Sensor Types that follow from the given sensor. Upon a successful transaction the success code block is executed with the parameters (NSNumber *deviceId, NSArray *sensorTypes) and the callback didGetSensorTypes is invoked. Upon a failed transaction the failure code block is executed and the callback MeshServiceApi:didTimeoutMessage is invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param firstType - (NSNumber *) The first sensor type as an unsigned short.
 * @param success - Block called upon successful execution. (NSNumber *deviceId, NSArray *sensorTypes)
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) getTypes:(NSNumber *)deviceId
             firstType:(NSNumber *)firstType
               success:(void (^)(NSNumber *deviceId, NSArray *sensorTypes)) success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) getTypes:(NSNumber *)deviceId firstType:(NSNumber *)firstType
__deprecated_msg("use -(NSNumber *) getTypes:(NSNumber *)deviceId firstType:(NSNumber *)firstType success:(void (^)(NSNumber *deviceId, NSArray *sensorTypes)) success failure:(void (^)(NSError *error))failure");
/*!
 * @brief setState - Set the given sensor to the given state. Upon a successful transaction the success code block is executes with the parameters (NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval) and the callback didGetSensorState is invoked. Upon a failed transaction the failure code block is executed and the callback MeshServiceApi:didTimeoutMessage is invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensorType - (NSNumber *) The sensor type as an unsigned short.
 * @param repeatInterval - (NSNumber *) The sensor repeat interval state as an unsigned char.
 * @param success - Block called upon successful execution. (NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval)
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) setState :(NSNumber *)deviceId
             sensorType:(NSNumber *)sensorType
         repeatInterval:(NSNumber *)repeatInterval
                success:(void (^)(NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval)) success
                failure:(void (^)(NSError *error))failure;



-(NSNumber *) setState :(NSNumber *)deviceId sensorType:(NSNumber *)sensorType repeatInterval:(NSNumber *)repeatInterval
__deprecated_msg("use -(NSNumber *) setState :(NSNumber *)deviceId sensorType:(NSNumber *)sensorType repeatInterval:(NSNumber *)repeatInterval success:(void (^)(NSNumber *deviceId, NSNumber *repeatInterval)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief getState - Get the state for the given sensor. The success code block is executed upon a successful transaction and the the callback didSetSensorState is invoked. The failure code block is executed upon an unsuccessful transaction and the callbackMeshServiceApi:didTimeoutMessage is invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensorType - (NSNumber *) The sensor type as an unsigned short wrapped up in an NSNumber.
 * @param success - Upon a successful transaction, this code block is executed with the parameters (NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval)
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) getState:(NSNumber *)deviceId
            sensorType:(NSNumber *)sensorType
               success:(void (^)(NSNumber *deviceId, NSNumber *sensorType, NSNumber *repeatInterval)) success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) getState:(NSNumber *)deviceId sensorType:(NSNumber *)sensorType
__deprecated_msg("use -(NSNumber *) getState:(NSNumber *)deviceId sensorType:(NSNumber *)sensorType success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief setValue - Write the given value to the given sensor. Up to two sensors can be written in one command. If success is not nil then the meshRequestId will be returned, otherwise nil will be returned. If success code block is not nil then it will be executed upon a successful transaction and the callback didGetSensorValue will be invoked. If the transaction fails then the failure code block is executed. If the success parameter is nil then CSRmesh acknowledgement will be supressed.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensors - (NSDictionary) - The key is the NSNumber of the sensor Type as an unsigned short and the Value is the NSNumber of the sensor value of size one to four octets.
 * Temperature value should be in Kelvin and of type float wrapped in an NSNumber.
 * @param success - Upon a successful transaction the success code block will be executed with the parameters (NSNumber *deviceId, NSDictionary *sensors)
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) setValue:(NSNumber *)deviceId
               sensors:(NSDictionary *)sensors
           acknowledge:(NSNumber *)ack
               success:(void (^)(NSNumber *deviceId, NSDictionary *sensors)) success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) setValue:(NSNumber *)deviceId sensors:(NSDictionary *)sensors acknowledge:(NSNumber *)ack
__deprecated_msg("use -(NSNumber *) setValue:(NSNumber *)deviceId sensors:(NSDictionary *)sensors acknowledge:(NSNumber *)ack success:(void (^)((NSNumber *deviceId, NSDictionary *sensors)) success failure:(void (^)(NSError *error))failure");

/*!
 * @brief getValue - Read the value for the given sensor(s). A read request for up to two sensors can be made in one command. Upon a successful transaction the success code block will be executed and the callback didGetSensorValue will be invoked. If the transaction is unsuccessful the failure code block will be executed and the callback MeshServiceApi:didTimeoutMessage will be invoked.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param sensorType1 - (NSNumber *) The first sensor type as an unsigned short wrapped up in an NSNumber.
 * @param sensorType2 - (NSNumber *) The second sensor type as an unsigned short wrapped up in an NSNumber. This is optional and may be nil.
 * @param success - Code block executed upon a successful transaction. The success code block parameters are (NSNumber *deviceId, NSDictionary *sensors)
 * @param failure - Code block executed upon an unsuccessful transaction.
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) getValue:(NSNumber *)deviceId
           sensorType1:(NSNumber *)sensorType1
           sensorType2:(NSNumber *)sensorType2
               success:(void (^)(NSNumber *deviceId, NSDictionary *sensors)) success
               failure:(void (^)(NSError *error))failure;



-(NSNumber *) getValue:(NSNumber *)deviceId sensorType1:(NSNumber *)sensorType1 sensorType2:(NSNumber *)sensorType2
__deprecated_msg("use -(NSNumber *) getValue:(NSNumber *)deviceId sensorType1:(NSNumber *)sensorType1 sensorType2:(NSNumber *)sensorType2 success:(void (^)(NSNumber *deviceId, NSDictionary *sensors)) success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<SensorModelApiDelegate>  sensorModelApiDelegate;


@end

