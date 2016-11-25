//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header PingModelApi is a part of the CSRmesh Api and provides a set of methods related to the Ping Model. 
 */


@protocol PingModelApiDelegate <NSObject>
@optional


/*!
 * @brief didPing. An acknowledgement to the request to ping. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param arbitaryData - (NSData *) data received, 4 octets.
 * @param TTLAtRx - (NSNumber *) Time to Live, TTL, value at device, 1 octet
 * @param RSSIAtRx - (NSNumber *) RSSI of received signal at device, 1 octet
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didPing :(NSNumber *)deviceId arbitaryData:(NSData *)arbitaryData TTLAtRx:(NSNumber *)TTLAtRx RSSIAtRx:(NSNumber *)RSSIAtRx meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) ping :(NSNumber *)deviceId data:(NSData *)data rspTTL:(NSNumber *)rspTTL success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");


@end

@interface PingModelApi : CSRmeshApi

/*!
 * @brief ping - ping the device with some data. The callback didPing is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param data - (NSData *) Data, up to 250 octets.
 * @param rspTTL - (NSNumber *) 1 octet wrapped in NSNumber.
 * @param success - Block called upon successful execution.
 * arbitaryData - (NSData *) data received, 4 octets.
 * TTLAtRx - (NSNumber *) Time to Live, TTL, value at device, 1 octet
 * RSSIAtRx - (NSNumber *) RSSI of received signal at device, 1 octet
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState.
 */
-(NSNumber *) ping :(NSNumber *)deviceId
               data:(NSData *)data
             rspTTL:(NSNumber *)rspTTL
            success:(void (^)(NSNumber *deviceId, NSData *arbitaryData, NSNumber *TTLAtRx, NSNumber *RSSIAtRx)) success
            failure:(void (^)(NSError *error))failure;


-(NSNumber *) ping :(NSNumber *)deviceId data:(NSData *)data rspTTL:(NSNumber *)rspTTL
__deprecated_msg("use -(NSNumber *) ping :(NSNumber *)deviceId data:(NSData *)data rspTTL:(NSNumber *)rspTTL success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<PingModelApiDelegate>  pingModelApiDelegate;

@end
