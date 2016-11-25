//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header AttentionModelApi is a part of the CSRmesh Api and provides a set of methods related to the Attention Model.
 *
 */

@protocol AttentionModelApiDelegate <NSObject>
@optional

/*!
 * @brief didGetState delegate. Invoked by the CSRmesh library upon receiving a state message fron the device
 * @param deviceId The ID assigned by the library to this device
 * @param state The attract attention state of the device.
 *  YES = attracting attention
 *  NO = not attracting attention
 * @param meshRequestId The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetState:(NSNumber *)deviceId state:(BOOL)state meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) setState:(NSNumber *)deviceId attractAttention:(BOOL)attractAttention duration:(NSNumber *)duration success:(void (^)(NSNumber *deviceId, NSNumber *state))success failure:(void (^)(NSError *error))failure");
@end


@interface AttentionModelApi : CSRmeshApi


    // Attention Api Method
    // Flash the Light in Red at 50% duty cycle
    // duration is in milliseconds
/*!
 * @brief setState - If attractAttention is set to YES then the LED will flash at duty cycle of 50% and at a rate set by duration.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param attractAttention - Enable or Disable attract attention
 * @param duration - (NSNumber *) Unsigned Short Value of the duration in milliseconds
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - The id of the message.
 */
-(NSNumber *) setState:(NSNumber *)deviceId
      attractAttention:(BOOL)attractAttention
              duration:(NSNumber *)duration
               success:(void (^)(NSNumber *deviceId, NSNumber *state))success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) setState:(NSNumber *)deviceId attractAttention:(BOOL)attractAttention duration:(NSNumber *)duration
__deprecated_msg("use -(NSNumber *) setState:(NSNumber *)deviceId attractAttention:(BOOL)attractAttention duration:(NSNumber *)duration success:(void (^)(NSNumber *deviceId, NSNumber *state))success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<AttentionModelApiDelegate>  attentionModelApiDelegate;


@end
