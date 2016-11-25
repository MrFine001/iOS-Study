//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import <UIKit/UIKit.h>
#import "CSRManagePlacesViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CSRManagePlacesViewController *managePlacesViewController;

@property (nonatomic, retain) NSURL *passingURL;
@property (nonatomic) BOOL updateInProgress;
@property (nonatomic) NSString *updateFileName;
@property (nonatomic) double updateProgress;


@end


