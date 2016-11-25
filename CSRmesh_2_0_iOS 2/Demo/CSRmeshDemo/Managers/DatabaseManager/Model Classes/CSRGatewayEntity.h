//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CSRGatewayEntity : NSManagedObject

@property (nonatomic, retain) NSString * basePath;
@property (nonatomic, retain) NSString * host;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * port;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) NSNumber * deviceId;
@property (nonatomic, retain) NSNumber * state;

@end
