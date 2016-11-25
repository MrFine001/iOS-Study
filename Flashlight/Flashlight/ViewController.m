//
//  ViewController.m
//  Flashlight
//
//  Created by FineRui on 16/9/17.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "ViewController.h"
#define kOnOffToggle @"onoff"
#define kBrightnessLevel @"brightness"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    self.brightnessSlider.value = [userdefaults floatForKey:kBrightnessLevel];
    self.toggleSwitch.on = [userdefaults boolForKey:kOnOffToggle];
    if ([userdefaults boolForKey:kOnOffToggle]) {
        self.setLightSourceAlphaValue.alpha = [userdefaults floatForKey:kBrightnessLevel];
    } else {
        self.setLightSourceAlphaValue.alpha = 0.0;
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLightSourceAlphaValue:(id)sender {
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setBool:self.toggleSwitch.on forKey:kOnOffToggle];
    [userdefaults setFloat:self.brightnessSlider.value forKey:kBrightnessLevel];
    [userdefaults synchronize];
    
    if (self.toggleSwitch.on) {
        self.setLightSourceAlphaValue.alpha = self.brightnessSlider.value;
    } else {
        self.setLightSourceAlphaValue.alpha = 0.0;
    }
}
@end
