/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestBaseObject.h"
#import "CSRRestSensorMissing.h"


/*!
    Response Object of Missing API for model Sensor
*/

@interface CSRRestSensorMissingResponse : CSRRestBaseObject


/*!
    Status of the request - Pending,Completed or TimeOut
*/
 typedef NS_OPTIONS(NSInteger, CSRRestSensorMissingResponseStatusEnum) {
  CSRRestSensorMissingResponseStatusEnumPending,
  CSRRestSensorMissingResponseStatusEnumCompleted,
  CSRRestSensorMissingResponseStatusEnumTimeOut,

};



/*!
    Status of the request - Pending,Completed or TimeOut
*/
@property(nonatomic) CSRRestSensorMissingResponseStatusEnum status;

/*!
    Status check URL for pending responses.
*/
@property(nonatomic) NSString* statusUrl;
  
/*!
    The actual Sensor Missing response object
*/
@property(nonatomic) NSArray* missing;
  
/*!
  Constructs instance of CSRRestSensorMissingResponse

  @param status - (CSRRestSensorMissingResponseStatusEnum) Status of the request - Pending,Completed or TimeOut
  @param statusUrl - (NSString*) Status check URL for pending responses.
  @param missing - (NSArray*) The actual Sensor Missing response object
  
  @return instance of CSRRestSensorMissingResponse
*/
- (id) initWithstatus: (CSRRestSensorMissingResponseStatusEnum) status     
       statusUrl: (NSString*) statusUrl     
       missing: (NSArray*) missing;
       

@end
