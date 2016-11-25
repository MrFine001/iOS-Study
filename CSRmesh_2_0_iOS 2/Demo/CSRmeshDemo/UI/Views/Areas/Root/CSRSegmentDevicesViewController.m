//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRSegmentDevicesViewController.h"
#import "CSRmeshStyleKit.h"
#import "CSRAppStateManager.h"
#import "CSRmeshDevice.h"
#import "CSRDeviceEntity.h"
#import "CSRAreaEntity.h"
#import "CSRDevicesManager.h"
#import "CSRmeshDevice.h"
#import "CSRDevicesManager.h"
#import "CSRUtilities.h"

@interface CSRSegmentDevicesViewController ()

@end

@implementation CSRSegmentDevicesViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lightViewController = nil;
    _temperatureViewController = nil;
    _lockViewController = nil;
    
    self.segmentSwitch.apportionsSegmentWidthsByContent = YES;

    _devicesMutableArray = [NSMutableArray new];
    
    [self refreshDevices:nil];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    //Set navigation buttons
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(backForSelf:);
    _backButton.target = self;
    
    if (_areaEntity) {
        self.title = _areaEntity.areaName;
        [self.segmentSwitch setSelectedSegmentIndex:0];
        [self segmentSwitch:self.segmentSwitch];

    }
    if (_deviceEntity) {
        CSRmeshDevice *device = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:_deviceEntity.deviceId];
        self.title = device.name;
    }
    
    }

- (void)refreshDevices:(id)sender
{
    
    if (_areaEntity) {
    [_devicesMutableArray removeAllObjects];
    
    __block BOOL foundLight = NO;
    __block BOOL foundTemperatureSensor = NO;
    __block BOOL foundHeater = NO;
    __block BOOL foundSwitch = NO;
    
    _devicesMutableArray = [[_areaEntity.devices allObjects] mutableCopy];
    
    [_devicesMutableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        CSRDeviceEntity *deviceEntity = (CSRDeviceEntity*)obj;
        if ([deviceEntity.appearance isEqual:@(CSRApperanceNameLight)] || [deviceEntity.appearance isEqual:@(CSRApperanceNameLight2)]) {
            foundLight = YES;
        }
        if ([deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameSensor)] || [deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameSensor2)]) {
            foundTemperatureSensor = YES;
        }
        if ([deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameHeater)] || [deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameHeater2)]) {
            foundHeater =YES;
        }
        if ([deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameSwitch)] || [deviceEntity.appearance isEqualToNumber:@(CSRApperanceNameSwitch2)]) {
            foundSwitch = YES;
        }
        
    }];
    
    
    [self.segmentSwitch removeAllSegments];
    
    if (foundLight && !foundTemperatureSensor && !foundHeater && !foundSwitch) {
        self.segmentSwitch.hidden = YES;
        [self.segmentSwitch insertSegmentWithImage:[CSRUtilities imageWithImage:[CSRmeshStyleKit imageOfLight_on] scaledToSize:CGSizeMake(26, 26)]  atIndex:0 animated:NO];

    }
    else {
        //self.segmentSwitch.hidden = YES;
        [self.segmentSwitch insertSegmentWithImage:[CSRUtilities imageWithImage:[CSRmeshStyleKit imageOfLight_on] scaledToSize:CGSizeMake(26, 26)]  atIndex:0 animated:NO];

    }
    if (foundTemperatureSensor && foundHeater) {
        [self.segmentSwitch insertSegmentWithImage:[CSRUtilities imageWithImage:[CSRmeshStyleKit imageOfSensor] scaledToSize:CGSizeMake(26, 26)]  atIndex:1 animated:NO];

    }
    if (foundSwitch) {
        [self.segmentSwitch insertSegmentWithImage:[CSRUtilities imageWithImage:[CSRmeshStyleKit imageOfLight_on] scaledToSize:CGSizeMake(26, 26)]  atIndex:2 animated:NO];

    }
    }
    if (_deviceEntity) {
        self.segmentSwitch.hidden = YES;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _lightViewController = (CSRLightViewController*)[storyboard instantiateViewControllerWithIdentifier:@"LightViewController"];
        
        [self addChildViewController:_lightViewController];
        _lightViewController.view.frame = CGRectMake(0, 0, _controlView.frame.size.width, _controlView.frame.size.height);
        [_controlView addSubview:_lightViewController.view];
        [_lightViewController didMoveToParentViewController:self];

    }
    
}

- (IBAction)segmentSwitch:(UISegmentedControl*)sender
{
    NSUInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
        {
            _temperatureViewController.view = nil;
            _lockViewController.view = nil;
            [self instantiateView:@"LightViewController"];
        }
            break;
        case 1:
        {
            _lightViewController.view = nil;
            _lockViewController.view = nil;
            [self instantiateView:@"TemperatureViewController"];
        }
            break;
        case 2:
        {
            _lightViewController.view = nil;
            _temperatureViewController.view = nil;
            [self instantiateView:@"LockViewController"];
        }
            break;
            
        default:
            break;
    }
    
}

- (void) instantiateView:(NSString*)viewName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc1= (UIViewController*)[storyboard instantiateViewControllerWithIdentifier:viewName];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self addChildViewController:vc1];
        vc1.view.frame = CGRectMake(0, 0, _controlView.frame.size.width, _controlView.frame.size.height);
        [_controlView addSubview:vc1.view];
        [vc1 didMoveToParentViewController:self];
    });
}

- (IBAction)backForSelf:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
