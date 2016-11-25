/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestBaseObject.h"
#import "CSRRestSiteInfoObject.h"


/*!
    Site Info Object returned for Get Site Call.
*/

@interface CSRRestSiteInfoResponse : CSRRestBaseObject




/*!
    Site's Id
*/
@property(nonatomic) NSString* siteId;
  
/*!
    Site's Name
*/
@property(nonatomic) NSString* name;
  
/*!
    State of site: active or inactive or deleted.
*/
@property(nonatomic) NSString* state;
  
/*!
    Array of Meshes and Gateways associated with the site.
*/
@property(nonatomic) NSArray* meshes;
  
/*!
  Constructs instance of CSRRestSiteInfoResponse

  @param siteId - (NSString*) Site's Id
  @param name - (NSString*) Site's Name
  @param state - (NSString*) State of site: active or inactive or deleted.
  @param meshes - (NSArray*) Array of Meshes and Gateways associated with the site.
  
  @return instance of CSRRestSiteInfoResponse
*/
- (id) initWithsiteId: (NSString*) siteId     
       name: (NSString*) name     
       state: (NSString*) state     
       meshes: (NSArray*) meshes;
       

@end
