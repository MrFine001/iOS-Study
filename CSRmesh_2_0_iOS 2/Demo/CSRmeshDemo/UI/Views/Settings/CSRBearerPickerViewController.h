//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRMainViewController.h"

@protocol CSRBearerPickerDelegate <NSObject>

- (id)selectedBearerOption:(id)option;

@end

@interface CSRBearerPickerViewController : CSRMainViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) id <CSRBearerPickerDelegate> delegate;

@end
