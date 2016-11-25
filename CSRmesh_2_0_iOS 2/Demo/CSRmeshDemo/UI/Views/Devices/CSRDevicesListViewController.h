//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRMainViewController.h"

@interface CSRDevicesListViewController : CSRMainViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addDeviceButton;
@property (nonatomic) NSMutableArray *devices;
@property (nonatomic) UIRefreshControl *refreshControl;

- (void)displayLightControl;

@end
