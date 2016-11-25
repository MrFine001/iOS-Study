//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRAreasDetailViewController.h"
#import "CSRAppStateManager.h"
#import "CSRDatabaseManager.h"
#import "CSRDeviceEntity.h"
#import "CSRmeshStyleKit.h"
#import "CSRUtilities.h"
#import "CSRDevicesManager.h"
#import "CSRDeviceSelectionViewController.h"


@interface CSRAreasDetailViewController () {

    id presenter;
}
@end

@implementation CSRAreasDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.view setNeedsLayout];
    
    //Set navigation buttons
    _backButton = [[UIBarButtonItem alloc] init];
    _backButton.accessibilityLabel = @"backToAreas";
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(back:);
    _backButton.target = self;
    
    [super addCustomBackButtonItem:_backButton];
    
    // obtain Favourite state from Database and then update favourite button
    
    _favouritesButton.backgroundColor = [UIColor clearColor];
    
    if (_areaEntity) {
        [self displayFavouriteState:[_areaEntity.favourite boolValue]];
    }
    
    _areaTitleTextField.delegate = self;
    
    if (![CSRUtilities isStringEmpty:_areaEntity.areaName]) {
        _areaTitleTextField.text = _areaEntity.areaName;
    }

}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _devicesArray = [NSMutableArray new];
    NSSet *deviceSet = _areaEntity.devices;
    NSLog(@"devicesSet:%lu", (unsigned long)[deviceSet count]);
    for (CSRDeviceEntity *device in deviceSet) {
        [_devicesArray addObject:device];
    }
    
    [self adjustAppearance];
    [self displayAreas];

}

- (void)adjustAppearance
{
    if (_areaEntity) {
        [self displayFavouriteState:[_areaEntity.favourite boolValue]];
    }
    
    _areaTitleTextField.delegate = self;
    
    if (_areaEntity) {
        if (![CSRUtilities isStringEmpty:_areaEntity.areaName]) {
            _areaTitleTextField.text = _areaEntity.areaName;
        }
    } else {
        int areaInt = [[CSRDatabaseManager sharedInstance] getNextFreeAreaInt];
        _areaTitleTextField.text = [NSString stringWithFormat:@"Area %d", areaInt];
    }
}


- (void)displayAreas
{
    for (id view in _devicesScrollView.subviews) {
        [view removeFromSuperview];
    }
    
    int yOffset = 5;
    
    for (CSRDeviceEntity *device in _devicesArray) {
        
        //Create row for area view
        UIView *deviceRow = [[UIView alloc] initWithFrame:CGRectMake(_devicesScrollView.frame.origin.x + 40., yOffset, _devicesScrollView.frame.size.width - 50., 30.)];
        
        //Create icon for row
        UIImageView *areaIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0., 0., 30., 30.)];
        areaIcon.image = [CSRmeshStyleKit imageOfAreasIcon];
        [deviceRow addSubview:areaIcon];
        
        //Create label for row
        UILabel *areaNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(areaIcon.frame.size.width + 5., 0., deviceRow.frame.size.width - areaIcon.frame.size.width - 10., deviceRow.frame.size.height)];
        if (device.name) {
            areaNameLabel.text = device.name;
        } else {
            areaNameLabel.text = @"No Areas";
        }
        
        areaNameLabel.font = [UIFont systemFontOfSize:14];
        areaNameLabel.textColor = [UIColor darkGrayColor];
        [deviceRow addSubview:areaNameLabel];
        
        [_devicesScrollView addSubview:deviceRow];
        
        yOffset += deviceRow.frame.size.height + 10.;
        
    }
    
    _devicesScrollView.contentSize = CGSizeMake(_devicesScrollView.frame.size.width, yOffset);
}

-(void) displayFavouriteState :(BOOL) state
{
    if (state) {
        [_favouritesButton setBackgroundImage:[CSRmeshStyleKit imageOfFavourites_on] forState:UIControlStateNormal];
    } else {
        [_favouritesButton setBackgroundImage:[CSRmeshStyleKit imageOfFavourites_off] forState:UIControlStateNormal];
    }
}



#pragma mark - Actions

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveAreaConfiguration:(id)sender
{
    if(_areaEntity) {
        _areaEntity.areaName = _areaTitleTextField.text;
        [[CSRDatabaseManager sharedInstance] saveContext];
    } else {
        if (![CSRUtilities isStringEmpty:_areaTitleTextField.text]) {

            _areaEntity = [[CSRDevicesManager sharedInstance] addMeshArea:_areaTitleTextField.text];
            [[CSRAppStateManager sharedInstance].selectedPlace addAreasObject:_areaEntity];
        } else {
            NSLog(@"Alert: Enter some Value");
        }
        
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
}

- (IBAction)cancelButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];

}

- (IBAction)toggleFavouriteState:(id)sender
{
    //
    // 1. Toggle favourite for this Device
    // 2. Update image for this device to inidicate new Favourite state
    //
    
    if (_areaEntity) {
        BOOL state = [_areaEntity.favourite boolValue];
        state = !state;
        [_areaEntity setFavourite:@(state)];
        [[CSRDatabaseManager sharedInstance] saveContext];
        
        // update Image
        [self displayFavouriteState:state];
        
    }
}

- (IBAction)editDevices:(id)sender
{
    if(_areaEntity) {
        
    } else {
        if (![CSRUtilities isStringEmpty:_areaTitleTextField.text]) {
            
            _areaEntity = [[CSRDevicesManager sharedInstance] addMeshArea:_areaTitleTextField.text];
            [[CSRAppStateManager sharedInstance].selectedPlace addAreasObject:_areaEntity];
            
        } else {
            NSLog(@"Alert: Please enter a valid name");
        }
    }
}

-(IBAction)deleteArea:(id)sender
{
    
    if ([_devicesArray count] != 0)
    {
        [_devicesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            CSRDeviceEntity *localDeviceEntity = (CSRDeviceEntity*)obj;
            
            NSNumber *groupIndex = [self getValueByIndex:localDeviceEntity];
            NSLog(@"groupIndex :%@", groupIndex);
            [[GroupModelApi sharedInstance] setModelGroupId:localDeviceEntity.deviceId
                                                    modelNo:@(0xff)
                                                 groupIndex:groupIndex // index of the array where that value was located
                                                   instance:@(0)
                                                    groupId:@(0) //0 for deleting
                                                    success:^(NSNumber *deviceId,
                                                              NSNumber *modelNo,
                                                              NSNumber *groupIndex,
                                                              NSNumber *instance,
                                                              NSNumber *desired) {
                                                        
                                                        uint16_t *dataToModify = (uint16_t*)localDeviceEntity.groups.bytes;
                                                        NSMutableArray *desiredGroups = [NSMutableArray new];
                                                        for (int count=0; count < localDeviceEntity.groups.length/2; count++, dataToModify++) {
                                                            NSNumber *groupValue = @(*dataToModify);
                                                            [desiredGroups addObject:groupValue];
                                                        }
                                                        
                                                        NSNumber *areaValue = [desiredGroups objectAtIndex:[groupIndex integerValue]];
                                                        
                                                        CSRAreaEntity *areaEntity = [[[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRAreaEntity" withPredicate:@"areaID == %@", areaValue] allObjects] firstObject];
                                                        
                                                        if (areaEntity) {
                                                            
                                                            [_areaEntity removeDevicesObject:localDeviceEntity];
                                                        }
                                                        
                                                        
                                                        NSMutableData *myData = (NSMutableData*)localDeviceEntity.groups;
                                                        uint16_t desiredValue = [desired unsignedShortValue];
                                                        int groupIndexInt = [groupIndex intValue];
                                                        if (groupIndexInt>-1) {
                                                            uint16_t *groups = (uint16_t *) myData.mutableBytes;
                                                            *(groups + groupIndexInt) = desiredValue;
                                                        }
                                                        
                                                        localDeviceEntity.groups = (NSData*)myData;
                                                        
                                                        [[CSRDatabaseManager sharedInstance] saveContext];
                                                        
                                                        
                                                    } failure:^(NSError *error) {
                                                        NSLog(@"mesh timeout");
                                                        
                                                    }];
            
            [NSThread sleepForTimeInterval:0.3];
            
        }];
    }
    if(_areaEntity) {
        [[CSRDevicesManager sharedInstance] removeAreaWithAreaId:_areaEntity.areaID];
        [[CSRAppStateManager sharedInstance].selectedPlace removeAreasObject:_areaEntity];
        [[CSRDatabaseManager sharedInstance].managedObjectContext deleteObject:_areaEntity];
    }
    
    //UI stuff
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:spinner];
    spinner.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [spinner startAnimating];
    
    [self performSelector:@selector(dismissViewController:) withObject:spinner afterDelay:2];
    
}

- (void) dismissViewController:(UIActivityIndicatorView*)spin
{
    [self dismissViewControllerAnimated:YES completion:^{
        [spin stopAnimating];
    }];
    
}

//method to getIndexByValue
- (NSNumber *) getValueByIndex:(CSRDeviceEntity*)deviceEntity
{
    
    uint16_t *dataToModify = (uint16_t*)deviceEntity.groups.bytes;
    
    for (int count=0; count < deviceEntity.groups.length/2; count++, dataToModify++) {
        if (*dataToModify == [_areaEntity.areaID unsignedShortValue]) {
            return @(count);
            
        } else if (*dataToModify == 0){
            return @(count);
        }
    }
    
    return @(-1);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"selectOrAddDeviceSegue"] && _areaEntity) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRDeviceSelectionViewController *vc = (CSRDeviceSelectionViewController*)[navController topViewController];
        vc.areaEntity = _areaEntity;
    }
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.backgroundColor = [UIColor clearColor];
    [textField resignFirstResponder];
    return NO;
}


@end
