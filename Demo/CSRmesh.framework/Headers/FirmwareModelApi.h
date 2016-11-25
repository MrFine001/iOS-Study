//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header FirmwareModelApi is a part of the CSRmesh Api and provides a set of methods related to the Firmware Model.
 */

@protocol FirmwareModelApiDelegate <NSObject>
@optional

/*!
 * @brief didSetUpdateRequired. Invoked by the CSRmesh library to indicate success:set Device to Firmware update mode. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didSetUpdateRequired:(NSNumber *)deviceId meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) setUpdateRequired:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId))success failure:(void (^)(NSError *error))failure");

/*!
 * @brief didSetUpdateRequired. Invoked by the CSRmesh library to indicate success:set Device to Firmware update mode. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param versionMajor - (NSNumber *) unsigned Short of the major portion of the version number
 * @param versionMinor - (NSNumber *) unsigned Short of the minor portion of the version number
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetVersionInfo:(NSNumber *)deviceId versionMajor:(NSNumber *)versionMajor versionMinor:(NSNumber *)versionMinor meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getVersionInfo:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId, NSNumber *versionMajor, NSNumber *versionMinor))success failure:(void (^)(NSError *error))failure");
@end


@interface FirmwareModelApi : CSRmeshApi

/*!
 * @brief setUpdateRequired - Request the device to enter Firmware Update Mode. The callback didSetUpdateRequired is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didSetUpdateRequired.
 */
-(NSNumber *) setUpdateRequired:(NSNumber *)deviceId
                        success:(void (^)(NSNumber *deviceId))success
                        failure:(void (^)(NSError *error))failure;



-(NSNumber *) setUpdateRequired:(NSNumber *)deviceId
__deprecated_msg("use -(NSNumber *) setUpdateRequired:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId))success failure:(void (^)(NSError *error))failure");


/*!
 * @brief getVersionInfo - Request the device software version. The callback didGetVersionInfo is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetVersionInfo.
 */
-(NSNumber *) getVersionInfo:(NSNumber *)deviceId
                     success:(void (^)(NSNumber *deviceId, NSNumber *versionMajor, NSNumber *versionMinor))success
                     failure:(void (^)(NSError *error))failure;



-(NSNumber *) getVersionInfo:(NSNumber *)deviceId
__deprecated_msg("use -(NSNumber *) getVersionInfo:(NSNumber *)deviceId success:(void (^)(NSNumber *deviceId, NSNumber *versionMajor, NSNumber *versionMinor))success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<FirmwareModelApiDelegate>  firmwareModelApiDelegate;

@end
