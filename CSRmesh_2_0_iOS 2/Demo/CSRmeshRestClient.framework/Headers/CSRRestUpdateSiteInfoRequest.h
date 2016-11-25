/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestBaseObject.h"
#import "CSRRestSiteInfoObject.h"


/*!
    Request Object for Updating Site's Information.
*/

@interface CSRRestUpdateSiteInfoRequest : CSRRestBaseObject


/*!
    State of site. One of active, inactive or deleted
*/
 typedef NS_OPTIONS(NSInteger, CSRRestUpdateSiteInfoRequestStateEnum) {
  CSRRestUpdateSiteInfoRequestStateEnumactive,
  CSRRestUpdateSiteInfoRequestStateEnuminactive,
  CSRRestUpdateSiteInfoRequestStateEnumdeleted,

};



/*!
    Name of the Site.
*/
@property(nonatomic) NSString* name;
  
/*!
    State of site. One of active, inactive or deleted
*/
@property(nonatomic) CSRRestUpdateSiteInfoRequestStateEnum state;

/*!
    Array of Meshes and Gateways associated with the site.
*/
@property(nonatomic) NSArray* meshes;
  
/*!
  Constructs instance of CSRRestUpdateSiteInfoRequest

  @param name - (NSString*) Name of the Site.
  @param state - (CSRRestUpdateSiteInfoRequestStateEnum) State of site. One of active, inactive or deleted
  @param meshes - (NSArray*) Array of Meshes and Gateways associated with the site.
  
  @return instance of CSRRestUpdateSiteInfoRequest
*/
- (id) initWithname: (NSString*) name     
       state: (CSRRestUpdateSiteInfoRequestStateEnum) state     
       meshes: (NSArray*) meshes;
       

@end
