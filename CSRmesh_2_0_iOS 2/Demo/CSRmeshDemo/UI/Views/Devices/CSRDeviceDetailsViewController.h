//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <UIKit/UIKit.h>
#import "CSRMainViewController.h"
#import "CSRmeshDevice.h"
#import "CSRDeviceEntity.h"

@interface CSRDeviceDetailsViewController : CSRMainViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *topSectionView;
@property (weak, nonatomic) IBOutlet UIImageView *deviceIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *deviceTitleTextField;
@property (weak, nonatomic) IBOutlet UIView *underlineView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIButton *favouritesButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UIScrollView *areasScrollView;
@property (weak, nonatomic) IBOutlet UITableView *deviceDetailsTableView;

@property (nonatomic) CSRmeshDevice *device;
@property (nonatomic) CSRDeviceEntity *deviceEntity;

- (IBAction)saveDeviceConfiguration:(id)sender;
- (IBAction)toggleFavouriteState:(id)sender;
- (IBAction)editAreas:(id)sender;
- (IBAction)deleteButtonTapped:(id)sender;
- (IBAction)refreshAction:(UIButton *)sender;


@end
