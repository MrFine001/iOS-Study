//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface CSRMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *placesSectionView;
@property (weak, nonatomic) IBOutlet UIView *topSectionView;
@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeOwnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UITableView *mainMenuTableView;
@property (weak, nonatomic) IBOutlet UITableView *placesTableView;
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *menuSwitchButton;
@property (weak, nonatomic) IBOutlet UIButton *bearerSwitchButton;
@property (weak, nonatomic) IBOutlet UIButton *managePlacesButton;
@property (nonatomic, retain) NSURL *jsonURL;

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue*)segue;
- (IBAction)toggleMenuSwitch:(id)sender;
- (IBAction)logoutTouched:(id)sender;
- (IBAction)managePlacesTouched:(id)sender;

@end
