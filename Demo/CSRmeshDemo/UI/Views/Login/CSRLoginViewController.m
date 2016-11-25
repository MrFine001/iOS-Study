//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRLoginViewController.h"
#import "CSRAlertView.h"
#import "CSRUserEntity.h"
#import "CSRDatabaseManager.h"
#import "CSRAppStateManager.h"

@interface CSRLoginViewController () <FBSDKLoginButtonDelegate>

@end

@implementation CSRLoginViewController

@synthesize loginButton;

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    if (![FBSDKAccessToken currentAccessToken]) {
        
        self.loginButton.readPermissions = @[@"public_profile", @"email"];
        self.loginButton.delegate = self;
        
        _activityIndicator.hidden = NO;
        [_activityIndicator startAnimating];
        
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setupApplication)
                                                 name:kCSRAppStateManagerDidFinishLoginProcessNotification
                                               object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kCSRAppStateManagerDidFinishLoginProcessNotification
                                                  object:nil];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    
    if (!error) {
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/email" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
            
         }];
        
        [[CSRAppStateManager sharedInstance] createUserForCurrentlyLoggedInUser];
        
    } else {
        CSRAlertView *alert = [[CSRAlertView alloc]
                               initWithTitle:@"Unable to log into Facebook"
                               message:error.localizedDescription
                               delegate:self
                               cancelButtonTitle:nil
                               otherButtonTitles:@"OK", nil];

        [alert show];
    }
}

// Mandatory but unused. The hamburger will have
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {}

#pragma mark - App Setup

- (void)setupApplication
{
    
    [_activityIndicator stopAnimating];
    _activityIndicator.hidden = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
