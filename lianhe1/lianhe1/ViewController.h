//
//  ViewController.h
//  lianhe1
//
//  Created by FineRui on 16/6/5.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *userOutput;
- (IBAction)doAlert:(id)sender;

- (IBAction)doMultiButtonAlert:(id)sender;

- (IBAction)doAlertInput:(id)sender;
- (IBAction)doActionSheet:(id)sender;
- (IBAction)doSound:(id)sender;
- (IBAction)doAlertSound:(id)sender;
- (IBAction)doVibration:(id)sender;
@end

