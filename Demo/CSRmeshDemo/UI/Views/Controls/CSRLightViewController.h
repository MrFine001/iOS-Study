//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import <UIKit/UIKit.h>
#import "CSRMainViewController.h"
#import "CSRmeshDevice.h"
#import "CSRmeshArea.h"
#import "CSRmeshDevice.h"

@interface CSRLightViewController : CSRMainViewController

@property (weak, nonatomic) IBOutlet UIImageView *colorWheel;
@property (weak, nonatomic) IBOutlet UISlider *intensitySlider;
@property (weak, nonatomic) IBOutlet UISwitch *powerSwitch;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (weak, nonatomic) IBOutlet UIImageView *colorIndicator;
@property (nonatomic) UIBarButtonItem *backButton;
@property (nonatomic) CSRmeshDevice *lightDevice;
@property (nonatomic) CSRmeshArea *selectedArea;

- (IBAction)dragColor:(id)sender;
- (IBAction)tapColor:(id)sender;
- (IBAction)intensitySliderDragged:(id)sender;
- (IBAction)powerSwitchChanged:(id)sender;
- (void)updateColorIndicatorPosition:(CGPoint)position;

@end
