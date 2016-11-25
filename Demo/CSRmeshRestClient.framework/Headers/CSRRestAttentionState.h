/*!
    Copyright [2015] Qualcomm Technologies International, Ltd.
*/
/* Note: this is an auto-generated file. */


#import <Foundation/Foundation.h>
#import "CSRRestBaseObject.h"


/*!
    The actual Attention State response object
*/

@interface CSRRestAttentionState : CSRRestBaseObject


/*!
    Is attracting attention
*/
 typedef NS_OPTIONS(NSInteger, CSRRestAttentionStateAttractAttentionEnum) {
  CSRRestAttentionStateAttractAttentionEnumFalse,
  CSRRestAttentionStateAttractAttentionEnumTrue,

};



/*!
    Is attracting attention
*/
@property(nonatomic) CSRRestAttentionStateAttractAttentionEnum attractAttention;

/*!
    Duration for attracting attention
*/
@property(nonatomic) NSNumber* duration;
  
/*!
    Id of the responding device
*/
@property(nonatomic) NSNumber* deviceId;
  
/*!
  Constructs instance of CSRRestAttentionState

  @param attractAttention - (CSRRestAttentionStateAttractAttentionEnum) Is attracting attention
  @param duration - (NSNumber*) Duration for attracting attention
  @param deviceId - (NSNumber*) Id of the responding device
  
  @return instance of CSRRestAttentionState
*/
- (id) initWithattractAttention: (CSRRestAttentionStateAttractAttentionEnum) attractAttention     
       duration: (NSNumber*) duration     
       deviceId: (NSNumber*) deviceId;
       

@end
