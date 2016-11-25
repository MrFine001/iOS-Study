//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CSRmeshApi.h"


/*!
 * @header LightModelApi is a part of the CSRmesh Api and provides a set of methods related to the Light Model.
 */



@protocol LightModelApiDelegate <NSObject>
@optional

/*!
 * @brief didGetLightState. An acknowledgement to the request to getState, setColorTemperature, setRgb, setLevel. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param red - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param green - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param blue - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param level - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param powerState - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param colorTemperature - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param supports - (NSNumber *) unsigned char wrapped in an NSNumber. Support Bits
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetLightState:(NSNumber *)deviceId red:(NSNumber *)red green:(NSNumber *)green blue:(NSNumber *)blue level:(NSNumber *)level powerState:(NSNumber *)powerState colorTemperature:(NSNumber *)colorTemperature supports:(NSNumber *)supports meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getState:(NSNumber *)deviceId success:(void (^)(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *level, NSNumber *powerState, NSNumber *colorTemperature, NSNumber *supports))success failure:(void (^)(NSError *error))failure");
@end



@interface LightModelApi : CSRmeshApi

/*!
 * @brief getState - Request the light state. The callback didGetLightState is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetLightState.
 */
- (NSNumber *)getState:(NSNumber *)deviceId
               success:(void (^)(NSNumber *deviceId,
                                 UIColor *color,
                                 NSNumber *powerState,
                                 NSNumber *colorTemperature,
                                 NSNumber *supports))success
               failure:(void (^)(NSError *error))failure;

-(NSNumber *) getState:(NSNumber *)deviceId
__deprecated_msg("use -(NSNumber *) getState:(NSNumber *)deviceId success:(void (^)(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *level, NSNumber *powerState, NSNumber *colorTemperature, NSNumber *supports))success failure:(void (^)(NSError *error))failure");
/*!
 * @brief setColorTemperature - Set the colour temperature.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param temperature - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param duration - (NSNumber *) unsigned 16-bit wrapped in NSNumber and represents time in millieseconds over which the temperature will fade.
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetLightState.
 */
- (NSNumber *)setColorTemperature:(NSNumber *)deviceId
                      temperature:(NSNumber *)temperature
                         duration:(NSNumber *)duration
                          success:(void (^)(NSNumber *deviceId,
                                            UIColor *color,
                                            NSNumber *powerState,
                                            NSNumber *colorTemperature,
                                            NSNumber *supports))success
                          failure:(void (^)(NSError *error))failure;



-(NSNumber *) setColorTemperature:(NSNumber *)deviceId temperature:(NSNumber *)temperature duration:(NSNumber *)duration
__deprecated_msg("use -(NSNumber *) setColorTemperature:(NSNumber *)deviceId temperature:(NSNumber *)temperature duration:(NSNumber *)duration success:(void (^)(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *level, NSNumber *powerState, NSNumber *colorTemperature, NSNumber *supports))success failure:(void (^)(NSError *error))failure");

/*!
 * @brief setRgb - Set the colour.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param color - (UIColor *) Light color. The alpha value is level.
 * @param duration - (NSNumber *) unsigned 16-bit wrapped in NSNumber and represents time in millieseconds over which the temperature will fade.
 * @param success - Block called upon successful execution, set nil to inhibit acknowledgement
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetLightState.
 */
- (NSNumber *)setColor:(NSNumber *)deviceId
                 color:(UIColor *)color
              duration:(NSNumber *)duration
               success:(void (^)(NSNumber *deviceId,
                                 UIColor  *color,
                                 NSNumber *powerState,
                                 NSNumber *colorTemperature,
                                 NSNumber *supports))success
               failure:(void (^)(NSError *error))failure;




-(NSNumber *) setRgb:(NSNumber *)deviceId red:(NSNumber *)red green:(NSNumber *)green blue:(NSNumber *)blue level:(NSNumber *)level duration:(NSNumber *)duration acknowledged:(BOOL)acknowledged
__deprecated_msg("use -(NSNumber *) setRgb:(NSNumber *)deviceId red:(NSNumber *)red green:(NSNumber *)green blue:(NSNumber *)blue level:(NSNumber *)level duration:(NSNumber *)duration success:(void (^)(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *level, NSNumber *powerState, NSNumber *colorTemperature, NSNumber *supports))success failure:(void (^)(NSError *error))failure");


/*!
 * @brief setPowerLevel - Set power state and then move the power level to the given value over the given duration
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param powesrState - (NSNumber *) unsigned char of the power state
 * @param level - (NSNumber *) unsigned char of the power level
 * @param levelDuration - (NSNumber *) unsigned short of the fade time, in mS
 * @param sustain - (NSNumber *) unsigned short of the wait before fade time, in mS
 * @param decay - (NSNumber *) unsigned short of the time for the light to decay to 0, in mS
 * @param success - Block called upon successful execution, set nil to inhibit acknowledgement
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetLightState.
 */
- (NSNumber *)setPowerLevel:(NSNumber *)deviceId
                      powerState:(NSNumber *)powerState
                      level:(NSNumber *)level
              levelDuration:(NSNumber *)levelDuration
                    sustain:(NSNumber *)sustain
                      decay:(NSNumber *)decay
               success:(void (^)(NSNumber *deviceId,
                                 UIColor *color,
                                 NSNumber *powerState,
                                 NSNumber *colorTemperature,
                                 NSNumber *supports))success
               failure:(void (^)(NSError *error))failure;


/*!
 * @brief setLevel - Set the Intensity.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param level - (NSNumber *) unsigned char wrapped in an NSNumber.
 * @param success - Block called upon successful execution, set nil to inhibit acknowledgement
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetLightState.
 */
- (NSNumber *)setLevel:(NSNumber *)deviceId
                      level:(NSNumber *)level
                    success:(void (^)(NSNumber *deviceId,
                                      UIColor *color,
                                      NSNumber *powerState,
                                      NSNumber *colorTemperature,
                                      NSNumber *supports))success
                    failure:(void (^)(NSError *error))failure;


-(NSNumber *) setLevel:(NSNumber *)deviceId level:(NSNumber *)level acknowledged:(BOOL)acknowledged
__deprecated_msg("use -(NSNumber *) setLevel:(NSNumber *)deviceId level:(NSNumber *)level success:(void (^)(NSNumber *red, NSNumber *green, NSNumber *blue, NSNumber *level, NSNumber *powerState, NSNumber *colorTemperature, NSNumber *supports))success failure:(void (^)(NSError *error))failure");



    // The Delegate for this object
@property (nonatomic, weak)   id<LightModelApiDelegate>  lightModelApiDelegate;



@end
