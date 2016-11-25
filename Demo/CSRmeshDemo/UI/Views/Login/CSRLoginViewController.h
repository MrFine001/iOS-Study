//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <UIKit/UIKit.h>
#import "CSRMainViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface CSRLoginViewController : CSRMainViewController

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
