//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header DataModelApi is a part of the CSRmesh Api and provides a set of methods related to the Data Model.
 */

@protocol DataModelApiDelegate <NSObject>
@optional

/*!
 * @brief didSendData. An acknowledgement to the request to sendData. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param data - (NSData *) The data sent.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didSendData:(NSNumber *)deviceId data:(NSData *)data meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) sendData:(NSNumber *)deviceId data:(NSData *)data success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");


/*!
 * @brief didReceiveBlockData. Asynchronous callback upon receiving a block of data
 * @param deviceId - (NSNumber *) The ID of the sending device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param data - (NSData *) The data sent.
 */
-(void) didReceiveBlockData:(NSNumber *)deviceId data:(NSData *)data ;


/*!
 * @brief didReceiveStreamData. Asynchronous callback upon receiving a packet of streamed data. More packets of data will follow until didReceiveStreamDataEnd. The receiver must assemble the parts in the correct order, as set by the stream number, to construct the whole.
 * @param deviceId - (NSNumber *) The ID of the sending device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param streamNumber - (NSNumber *) 2 octet unsigned number, Unsigned 16.
 * @param data - (NSData *) The data sent.
 */
-(void) didReceiveStreamData:(NSNumber *)deviceId streamNumber:(NSNumber *)streamNumber data:(NSData *)data;

/*!
 * @brief didReceiveStreamDataEnd. Asynchronous callback to indicate end of stream. Terminates a stream receive.
 * @param deviceId - (NSNumber *) The ID of the sending device. Refer to the delegate MeshServiceApi.didAssociateDevice
 */
-(void) didReceiveStreamDataEnd:(NSNumber *)deviceId;

@end


@interface DataModelApi : CSRmeshApi

/*!
 * @brief sendData - Send data to device. The callback didSendData is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param data - (NSData *) Data, up to 250 octets.
 * @param success - Block called upon successful execution, if nil then data will be sent by Block Data transfer otherwise Stream data transfer
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetPowerState. For block data transfers, if the length of (NSData *)data exceeds 10 then the request will be rejected and a nil returned.
 */
-(NSNumber *) sendData:(NSNumber *)deviceId
                  data:(NSData *)data
               success:(void (^)(NSNumber *deviceId, NSData *data)) success
               failure:(void (^)(NSError *error))failure;


-(NSNumber *) sendData:(NSNumber *)deviceId data:(NSData *)data acknowledged:(NSNumber *)acknowledged
__deprecated_msg("use -(NSNumber *) sendData:(NSNumber *)deviceId data:(NSData *)data success:(void (^)(NSNumber *deviceId, NSData *data)) success failure:(void (^)(NSError *error))failure");


    // The Delegate for this object
@property (nonatomic, weak)   id<DataModelApiDelegate>  dataModelApiDelegate;


@end
