/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestAssociationStatusLink.h"
#import "CSRRestNewDeviceBroadCastStatusResponse.h"
#import "CSRRestGetGatewayProfileResponse.h"
#import "CSRRestBaseObject.h"
#import "CSRRestApiStatusCode.h"
#import "CSRRestErrorResponse.h"
#import "CSRRestBaseApi.h"


/*!
  CSRRestMeshConfigGatewayApi is a part of the CSR Mesh Api and provides a set of related methods.
*/
@interface CSRRestMeshConfigGatewayApi: CSRRestBaseApi


/*!
  Request gateway to trigger new device transmit flow for MASP.
 
  This API applies only to the Gateway. It triggers new device transmit flow for MASP.
 
  @param csrmeshApplicationCode - (NSString*)  Application Code of the calling Application.
  @param responseBlock An optional block which receives the results of the resource load.
         If success, a valid object of CSRRestAssociationStatusLink is returned with nil object of NSError and CSRRestErrorResponse.
         If failure, an error object of NSError is returned with nil object of CSRRestAssociationStatusLink and also  a detailed error object of CSRRestErrorResponse for specific error codes and messages may available. See CSRRestApiStatusCode and NSError+StatusCode for more information's on error code details.

  @return meshRequestId - (NSNumber*) The id of the request. Pair up with the id returned in callback handlers.
 */
- (NSNumber*) newDeviceBroadcast : (NSString*) csrmeshApplicationCode 
     responseHandler :(void (^)(NSNumber* meshRequestId, CSRRestAssociationStatusLink* output, NSError* error, CSRRestErrorResponse* errorResponse))responseBlock;



/*!
  Get current status of MASP new device association flow.
 
  This API will get current status of MASP new device association flow, for Gateway behaving as non-configuring device.
 
  @param csrmeshApplicationCode - (NSString*)  Application Code of the calling Application.
  @param responseBlock An optional block which receives the results of the resource load.
         If success, a valid object of CSRRestNewDeviceBroadCastStatusResponse is returned with nil object of NSError and CSRRestErrorResponse.
         If failure, an error object of NSError is returned with nil object of CSRRestNewDeviceBroadCastStatusResponse and also  a detailed error object of CSRRestErrorResponse for specific error codes and messages may available. See CSRRestApiStatusCode and NSError+StatusCode for more information's on error code details.

  @return meshRequestId - (NSNumber*) The id of the request. Pair up with the id returned in callback handlers.
 */
- (NSNumber*) statusNewDeviceBroadcast : (NSString*) csrmeshApplicationCode 
     responseHandler :(void (^)(NSNumber* meshRequestId, CSRRestNewDeviceBroadCastStatusResponse* output, NSError* error, CSRRestErrorResponse* errorResponse))responseBlock;



/*!
  Get profile of gateway.
 
  This API will return the profile of the gateway that the API is addressing.
 
  @param csrmeshApplicationCode - (NSString*)  Application Code of the calling Application.
  @param responseBlock An optional block which receives the results of the resource load.
         If success, a valid object of CSRRestGetGatewayProfileResponse is returned with nil object of NSError and CSRRestErrorResponse.
         If failure, an error object of NSError is returned with nil object of CSRRestGetGatewayProfileResponse and also  a detailed error object of CSRRestErrorResponse for specific error codes and messages may available. See CSRRestApiStatusCode and NSError+StatusCode for more information's on error code details.

  @return meshRequestId - (NSNumber*) The id of the request. Pair up with the id returned in callback handlers.
 */
- (NSNumber*) gatewayProfile : (NSString*) csrmeshApplicationCode 
     responseHandler :(void (^)(NSNumber* meshRequestId, CSRRestGetGatewayProfileResponse* output, NSError* error, CSRRestErrorResponse* errorResponse))responseBlock;



/*!
  Delete a mesh network on gateway.
 
  This API will remove corresponding network keys from CSRmesh stack on gateway. Since the gateway supports more than one mesh network, this API can be used to remove a single network on the gateway.
 
  @param csrmeshApplicationCode - (NSString*)  Application Code of the calling Application.
  @param meshId - (NSString*)  ID is mesh network which needs to be removed from Gateway.
  @param responseBlock An optional block which receives the results of the resource load.
          If success, error object will be nil. If failure a detailed error object of CSRRestErrorResponse for specific error codes and messages may available. See CSRRestApiStatusCode and NSError+StatusCode for more information's on error code details.

  @return meshRequestId - (NSNumber*) The id of the request. Pair up with the id returned in callback handlers.
 */
- (NSNumber*) removeNetwork : (NSString*) csrmeshApplicationCode 
     meshId : (NSString*) meshId 
     responseHandler :(void (^)(NSNumber* meshRequestId,NSError* error, CSRRestErrorResponse* errorResponse))responseBlock;



@end
