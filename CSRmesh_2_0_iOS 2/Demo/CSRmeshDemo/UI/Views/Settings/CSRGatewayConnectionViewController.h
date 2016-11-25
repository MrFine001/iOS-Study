//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRMainViewController.h"
#import "CSRGatewayEntity.h"
#import <CSRmesh/CSRGatewayNetService.h>
#import "CSRConstants.h"

@interface CSRGatewayConnectionViewController : CSRMainViewController

@property (nonatomic) CSRGatewayNetService *gateway;
@property (nonatomic) CSRGatewayEntity *gatewayEntity;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic) CSRGatewayConnectionMode mode;

- (IBAction)cancel:(id)sender;

@end
