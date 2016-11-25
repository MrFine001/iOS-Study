//
//  ViewController.h
//  Flashlight
//
//  Created by FineRui on 16/9/17.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *setLightSourceAlphaValue;

@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitch;
- (IBAction)setLightSourceAlphaValue:(id)sender;

@end

