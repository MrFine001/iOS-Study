//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//



#import <UIKit/UIKit.h>
#import "CSRMainViewController.h"


@interface CSRDatabaseViewController : CSRMainViewController <UIAlertViewDelegate, UIDocumentInteractionControllerDelegate>


+ (CSRDatabaseViewController*)sharedInstance;

@property (nonatomic, retain) NSMutableDictionary *jsonDictionary;
@property (nonatomic, retain) NSMutableDictionary *deviceDictionary;
@property (nonatomic, retain) NSMutableArray *devicesArray;

@property (nonatomic, retain) NSMutableArray *groupsArray;

@property (nonatomic, retain) NSString *localNetworkKey;
@property (nonatomic, retain) NSSet *settings;

@property (nonatomic, retain) NSURL *jsonURL;

- (void) createJSONOnFly;



@end
