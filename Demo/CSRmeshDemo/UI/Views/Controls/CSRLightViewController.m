//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRLightViewController.h"
#import "CSRmeshStyleKit.h"
#import "CSRUtilities.h"
#import "CSRConstants.h"
#import "CSRDevicesManager.h"

@interface CSRLightViewController ()
{
    CGFloat intensityLevel;
    CGPoint lastPosition;
    UIColor *chosenColor;
}

@end

@implementation CSRLightViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //Adjust navigation controller appearance
    self.showNavMenuButton = NO;
    self.showNavSearchButton = NO;
    
    [super adjustNavigationControllerAppearance];
    
    //Set navigation buttons
    _backButton = [[UIBarButtonItem alloc] init];
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(back:);
    _backButton.target = self;
    
    [super addCustomBackButtonItem:_backButton];
    
    //Set initial values
    _tapGesture.numberOfTapsRequired = 1;
    _tapGesture.numberOfTouchesRequired = 1;
    
    intensityLevel = 1.0;
    chosenColor = [UIColor whiteColor];
    lastPosition.x = 0;
    lastPosition.y = 0;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    _selectedArea = [[CSRDevicesManager sharedInstance] selectedArea];
    _lightDevice = [[CSRDevicesManager sharedInstance] selectedDevice];
    
    //Set item titles
    if (_lightDevice) {
        self.title = _lightDevice.name;
    } else if (_selectedArea){
        self.title = _selectedArea.areaName;
    } else {
        self.title = @"CSRmesh";
    }
    
    //Get current device power status
    [_powerSwitch setOn:[_lightDevice getPower]];
    
    //Get current device color position/value
    if ([_lightDevice colorPosition] != nil) {
        
        CGPoint position = [_lightDevice.colorPosition CGPointValue];
        [self updateColorIndicatorPosition:position];
        
    }
    
    //Get current device intesinty level
    [_intensitySlider setValue:_lightDevice.getLevel animated:YES];
}

- (void)dealloc
{
    self.view = nil;
}

#pragma mark - Actions

- (IBAction)dragColor:(id)sender
{
    
    BOOL isDragAllowed = NO;
    
    if ([CSRMeshUserManager sharedInstance].bearerType == CSRBearerType_Bluetooth) {
        
        isDragAllowed = YES;
        
    }
    
    if (!isDragAllowed) {
        
        if ([(UIPanGestureRecognizer *)sender state] == UIGestureRecognizerStateBegan) {
            
            isDragAllowed = YES;
            
        } else if ([(UIPanGestureRecognizer *)sender state] == UIGestureRecognizerStateEnded) {
            
            isDragAllowed = YES;
            
        }
        
    }
    
    if (isDragAllowed) {
    
        UIPanGestureRecognizer *recogniser = sender;
        CGPoint touchPoint = [recogniser locationInView:_colorWheel.viewForBaselineLayout];
        
        float frameWidth = _colorWheel.viewForBaselineLayout.frame.size.width;
        float frameHeight = _colorWheel.viewForBaselineLayout.frame.size.height;
        
        if (touchPoint.x > frameWidth) {
            
            touchPoint.x = frameWidth;
            
        } else if (touchPoint.x < 0) {
            
            touchPoint.x = 0;
            
        }
        
        if (touchPoint.y > frameHeight) {
            
            touchPoint.y = frameHeight;
            
        } else if (touchPoint.y < 0) {
            
            touchPoint.y = 0;
            
        }
        
        
        UIColor *pixel = [CSRUtilities colorFromImageAtPoint:&touchPoint frameWidth:frameWidth frameHeight:frameHeight];
        
        CGFloat red, green, blue, alpha;
        if ([pixel getRed:&red green:&green blue:&blue alpha:&alpha] && !(red<0.4 && green<0.4 && blue<0.4)) {
            
            // Send Color to selected light
            if (_lightDevice) {
                
                [_lightDevice setColorWithRed:red green:green blue:blue];
                
            }
            
            
            chosenColor = pixel;
            
            // update position of inidicator
            touchPoint.x += _colorWheel.frame.origin.x;
            touchPoint.y += _colorWheel.frame.origin.y;
            [self updateColorIndicatorPosition:touchPoint];
            
            // Update the device's copy of the color position
            [_lightDevice setColorPosition:[NSValue valueWithCGPoint:touchPoint]];
            
            // Update power button from device
            // The device can turn on the power if the colour is set
            [_powerSwitch setOn:[_lightDevice getPower]];
        }
        
    }
    
}

- (IBAction)tapColor:(id)sender
{
    UITapGestureRecognizer *recogniser = sender;
    CGPoint touchPoint = [recogniser locationInView:_colorWheel.viewForBaselineLayout];
    
    float frameWidth = _colorWheel.viewForBaselineLayout.frame.size.width;
    float frameHeight = _colorWheel.viewForBaselineLayout.frame.size.height;
    
    UIColor *pixel = [CSRUtilities colorFromImageAtPoint:&touchPoint frameWidth:frameWidth frameHeight:frameHeight];
    
    CGFloat red, green, blue, alpha;
    if ([pixel getRed:&red green:&green blue:&blue alpha:&alpha] && !(red<0.4 && green<0.4 && blue<0.4)) {
        
        // Send Color to selected light
        if (_lightDevice) {
            [_lightDevice setColorWithRed:red green:green blue:blue];
        }
        
        chosenColor = pixel;
        
        // update position of inidicator
        touchPoint.x += _colorWheel.frame.origin.x;
        touchPoint.y += _colorWheel.frame.origin.y;
        
        [self updateColorIndicatorPosition:touchPoint];
        
        // Update the device's copy of the color position
        [_lightDevice setColorPosition:[NSValue valueWithCGPoint:touchPoint]];
        
        // Update power button from device
        // The device can turn on the power if the colour is set
        [_powerSwitch setOn:[_lightDevice getPower]];
    }
}

- (IBAction)intensitySliderDragged:(id)sender
{
    
    BOOL isDragAllowed = NO;
    
    if ([CSRMeshUserManager sharedInstance].bearerType == CSRBearerType_Bluetooth) {
        
        isDragAllowed = YES;
        
    }
    
    if (!isDragAllowed) {
        
        if ([(UIPanGestureRecognizer *)sender state] == UIGestureRecognizerStateBegan) {
            
            isDragAllowed = YES;
            
        } else if ([(UIPanGestureRecognizer *)sender state] == UIGestureRecognizerStateEnded) {
            
            isDragAllowed = YES;
            
        }
        
    }
    
    if (isDragAllowed) {
    
        intensityLevel = _intensitySlider.value;
        
        if (_lightDevice) {
            [_lightDevice setLevel:intensityLevel];
            
            // Update power button from device
            // The device can turn on the power if the colour is set
            [_powerSwitch setOn:[_lightDevice getPower]];
        }
        
    }
    
}

- (IBAction)intensitySliderTapped:(id)sender
{
    UITapGestureRecognizer *recogniser = sender;
    CGPoint touchPoint = [recogniser locationInView:_intensitySlider.viewForBaselineLayout];
    
    intensityLevel = touchPoint.x / _intensitySlider.frame.size.width;
    
    [_intensitySlider setValue:intensityLevel animated:YES];
    
    if (_lightDevice) {
        [_lightDevice setLevel:intensityLevel];
        
        // Update power button from device
        // The device can turn on the power if the colour is set
        [_powerSwitch setOn:[_lightDevice getPower]];
    }
}

- (IBAction)powerSwitchChanged:(id)sender
{
    if (_lightDevice) {
        [_lightDevice setPower:_powerSwitch.isOn];
    }
}

#pragma mark - Color indicator update

- (void)updateColorIndicatorPosition:(CGPoint)position
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [_colorIndicator setCenter:position];
    });
    
    [_colorIndicator setCenter:position];
    lastPosition = position;
}

#pragma mark - Pseudo Navigation Bar item menthods

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
