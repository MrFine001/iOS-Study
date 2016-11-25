//
// Copyright 2014 - 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import "CSRmeshApi.h"

/*!
 * @header GroupModelApi is a part of the CSRmesh Api and provides a set of methods related to the Group Model.
 */


@protocol GroupModelApiDelegate <NSObject>
@optional

/*!
 * @brief didGetNumModelGroupIds. Invoked by the CSRmesh library to indicate success:get Number of Model Group IDs. This callback will be replaced with success and failure code blocks in the next version therefore please discontinue its use.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param modelNo - (NSNumber *) The model number for which this calback is made.
 * @param numberOfModelGroupIds - (NSNumber *) The number of Group indexes supported by this model
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didGetNumModelGroupIds:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo numberOfModelGroupIds:(NSNumber *)numberOfModelGroupIds meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) getModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success failure:(void (^)(NSError *error))failure");



/*!
 * @brief didSetModelGroupId. Invoked by the CSRmesh library to indicate success:set Model Group ID
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param modelNo - (NSNumber *) The model number
 * @param groupIndex - (NSData *) The offset of the groupID in the table of Group indexes supported by the model
 * @param instance - (NSNumber *) The model instance
 * @param groupId - (NSNumber *) The group ID is an unsigned 16-bit number.
 * @param meshRequestId - (NSNumber *) The ID assigned to the Api call that triggered this callback.
 */
-(void) didSetModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex instance:(NSNumber *)instance groupId:(NSNumber *)groupId meshRequestId:(NSNumber *)meshRequestId
__deprecated_msg("use success and failure blocks in the method -(NSNumber *) setModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex instance:(NSNumber *)instance groupId:(NSNumber *)groupId success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success failure:(void (^)(NSError *error))failure");

@end



@interface GroupModelApi : CSRmeshApi

/*!
 * @brief getNumModelGroupIds - Request the Total number of Group Ids for a Model. The callback didGetNumModelGroupIds is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param modelNo - (NSNumber *) The Model number for the Group IDs request
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetNumModelGroupIds.
 */
-(NSNumber *) getNumModelGroupIds:(NSNumber *)deviceId
                          modelNo:(NSNumber *)modelNo
                          success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success
                          failure:(void (^)(NSError *error))failure;


-(NSNumber *) getNumModelGroupIds:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo
__deprecated_msg("use -(NSNumber *) getNumModelGroupIds:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success failure:(void (^)(NSError *error))failure");

/*!
 * @brief setModelGroupId - Set Group Id for a Model, group index and model instance. The callback didSetModelGroupId is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param modelNo - (NSNumber *) The Model number for the Group IDs request
 * @param groupIndex - (NSNumber *) A number of Group IDs can be stored in a model instance, this is determined by a call to
 * @param instance - (NSNumber *) The model instance for this device for which the Group ID for the given group index is set
 * @param groupId - (NSNumber *) The groupId to be set for the given Model, intance and Group index
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetNumModelGroupIds.
 */
-(NSNumber *) setModelGroupId:(NSNumber *)deviceId
                      modelNo:(NSNumber *)modelNo
                   groupIndex:(NSNumber *)groupIndex
                     instance:(NSNumber *)instance
                      groupId:(NSNumber *)groupId
                      success:(void (^)(NSNumber *deviceId,
                                        NSNumber *modelNo,
                                        NSNumber *groupIndex,
                                        NSNumber *instance,
                                        NSNumber *groupId))success
                      failure:(void (^)(NSError *error))failure;

-(NSNumber *) setModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex instance:(NSNumber *)instance groupId:(NSNumber *)groupId
__deprecated_msg("use -(NSNumber *) setModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex instance:(NSNumber *)instance groupId:(NSNumber *)groupId success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success failure:(void (^)(NSError *error))failure");

/*!
 * @brief getModelGroupId - Get Group Id for a Model and group index. The callback didSetModelGroupId is invoked upon success. The MeshServiceApi:didTimeoutMessage is invoked on failure.
 * @param deviceId - (NSNumber *) The ID of this device. Refer to the delegate MeshServiceApi.didAssociateDevice
 * @param modelNo - (NSNumber *) The Model number for the Group IDs request
 * @param groupIndex - (NSNumber *) A number of Group IDs can be stored in a model instance, this is determined by a call to
 * @param success - Block called upon successful execution
 * @param failure - Block called upon error
 * @return meshRequestId - (NSNumber *) The id of the request. Pair up with the id returned in didGetNumModelGroupIds.
 */
-(NSNumber *) getModelGroupId:(NSNumber *)deviceId
                      modelNo:(NSNumber *)modelNo
                   groupIndex:(NSNumber *)groupIndex
                      success:(void (^)(NSNumber *deviceId,
                                        NSNumber *modelNo,
                                        NSNumber *groupIndex,
                                        NSNumber *instance,
                                        NSNumber *groupId))success
                      failure:(void (^)(NSError *error))failure;


-(NSNumber *) getModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex
__deprecated_msg("use -(NSNumber *) getModelGroupId:(NSNumber *)deviceId modelNo:(NSNumber *)modelNo groupIndex:(NSNumber *)groupIndex success:(void (^)(NSNumber *deviceId, NSNumber *modelNo, NSNumber *numberOfModelGroupIds))success failure:(void (^)(NSError *error))failure");

// The Delegate for this object
@property (nonatomic, weak)   id<GroupModelApiDelegate>  groupModelApiDelegate;


@end
