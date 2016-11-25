//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRMainViewController.h"

@interface CSRAssociatedGatewaysListViewController : CSRMainViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addGatewayButton;
@property (nonatomic) UIBarButtonItem *backButton;

- (IBAction)addGateway:(id)sender;

@end
