//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRMainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CSRDeviceEntity.h"
#import "CSRmeshDevice.h"

typedef NS_ENUM(NSUInteger, CSRAddDeviceWizardMode) {
    CSRAddDeviceWizardMode_DevicesList = 0,
    CSRAddDeviceWizardMode_ScanQRCode = 1,
};

@protocol CSRAddDeviceWizardDelegate <NSObject>

- (void)setMode:(CSRAddDeviceWizardMode)mode;

@end

@interface CSRAddDeviceWizardViewController : CSRMainViewController <AVCaptureMetadataOutputObjectsDelegate, UIGestureRecognizerDelegate, UIPopoverPresentationControllerDelegate>

@property (nonatomic) CSRAddDeviceWizardMode mode;

@property (nonatomic) CSRDeviceEntity *deviceEntity;
@property (nonatomic) CSRmeshDevice *selectedDevice;

@property (weak, nonatomic) IBOutlet UIView *devicesListView;
@property (weak, nonatomic) IBOutlet UIView *scanQRview;

//DevicesList
@property (weak, nonatomic) IBOutlet UITableView *devicesTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *devicesNextButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *associateDeviceButton;

//QR
@property (weak, nonatomic) IBOutlet UIView *qrPreview;
@property (weak, nonatomic) IBOutlet UILabel *qrStatus;
@property (weak, nonatomic) IBOutlet UIView *scanSuccessView;
@property (weak, nonatomic) IBOutlet UIImageView *successTickboxImageView;
@property (weak, nonatomic) IBOutlet UIButton *qrTriggerButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *associateQRButton;

@property (nonatomic) UIBarButtonItem *backButton;

//Need to make scan results global to use it for Segue and Database Operations
@property (nonatomic, strong) NSString *uuidStringFromQRScan;
@property (nonatomic, strong) NSString *acStringFromQRScan;

- (void)showScreensWithMode:(CSRAddDeviceWizardMode)mode;
- (IBAction)toggleQRScan:(id)sender;

@end
