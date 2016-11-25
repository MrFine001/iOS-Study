//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRDeviceDetailsViewController.h"
#import "CSRAppStateManager.h"
#import "CSRDatabaseManager.h"
#import "CSRDeviceEntity.h"
#import "CSRmeshStyleKit.h"
#import "CSRUtilities.h"
#import "CSRDevicesManager.h"
#import "CSRAreaSelectionViewController.h"
#import "CSRDeviceSelectionTableViewCell.h"
#import <CSRmesh/BatteryModelApi.h>
#import <CSRmesh/ConfigModelApi.h>
#import <CSRmesh/DataModelApi.h>
#import <CSRmesh/FirmwareModelApi.h>

@interface CSRDeviceDetailsViewController ()
{
    id presenter;
}

@property (nonatomic) NSMutableArray *areasArray;
@property (nonatomic) NSMutableDictionary *deviceDetailsDictionary;

@end

@implementation CSRDeviceDetailsViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _areasArray = [NSMutableArray new];
    _deviceDetailsDictionary = [NSMutableDictionary new];
    
    NSSet *areasSet = _deviceEntity.areas ;
    for (CSRAreaEntity *area in areasSet) {
        [_areasArray addObject:area];
    }
    
    //Set navigation buttons
    _backButton = [[UIBarButtonItem alloc] init];
    _backButton.image = [CSRmeshStyleKit imageOfBack_arrow];
    _backButton.action = @selector(back:);
    _backButton.target = self;
    
    [super addCustomBackButtonItem:_backButton];
    
    // obtain Favourite state from Database and then update favourite button
    
    _favouritesButton.backgroundColor = [UIColor clearColor];
    
    if (_deviceEntity) {
        [self displayFavouriteState:[_deviceEntity.favourite boolValue]];
    }
    
    _deviceTitleTextField.delegate = self;
    
    if (![CSRUtilities isStringEmpty:_deviceEntity.name]) {
        _deviceTitleTextField.text = _deviceEntity.name;
    }
    _deviceIcon.image = [CSRmeshStyleKit imageOfLight_on];

}

#pragma mark --
#pragma mark Refresh Action

- (IBAction)refreshAction:(UIButton *)sender
{
    [_deviceDetailsDictionary removeAllObjects];
    
    NSNumber *deviceNumber = [_deviceEntity deviceId];
//    [[BatteryModelApi sharedInstance] getState:deviceNumber
//                                       success:^(NSNumber *deviceId, NSNumber *batteryLevel, NSNumber *batteryState) {
//                                           NSLog(@"deviceId :%@, batteryLevel :%@, batteryState :%@", deviceId, batteryLevel ,batteryState);
//                                           uint8_t state = [batteryState unsignedCharValue];
//                                           NSString *stateString;
//                                           switch (state) {
//                                               case 0:
//                                                   stateString=@"Battery is Powering Device";
//                                                   break;
//                                               case 1:
//                                                   stateString=@"Battery is Charging";
//                                                   break;
//                                               case 2:
//                                                   stateString=@"Device is Externally powered";
//                                                   break;
//                                               case 3:
//                                                   stateString=@"Service is required for Battery";
//                                                   break;
//                                               case 4:
//                                                   stateString=@"Battery needs replacement";
//                                                   break;
//                                               default:
//                                                   stateString=@"Battery state unknown";
//                                                   break;
//                                                   
//                                           }
//                                           if (batteryLevel) {
//                                               
//                                               [_deviceDetailsDictionary setValue:batteryLevel forKey:stateString];
//                                               [_deviceDetailsTableView reloadData];
//                                           }
//                                       } failure:^(NSError *error) {
//                                           NSLog(@"Error :%@", error);
//                                       }];
    
//    [[ConfigModelApi sharedInstance] getInfo:_deviceEntity.deviceId infoType:@(4)
//                                     success:^(NSNumber *deviceId, NSDictionary *info, NSNumber *infoType) {
//                                         NSNumber *pidNumber = info[kCSR_PRODUCT_IDENTIFIER];
//                                         if (pidNumber) {
//                                             
//                                             [_deviceDetailsDictionary setValue:pidNumber forKey:@"PID"];
//                                             [_deviceDetailsTableView reloadData];
//                                         }
//                                     } failure:^(NSError *error) {
//                                         NSLog(@"Error :%@", error);
//                                     }];

    const char testMessage[] = {1, 0, 0, 0, 0, 0, 0, 0, 0 };
    NSData *testData = [NSData dataWithBytes:testMessage length:9];

    [[DataModelApi sharedInstance] sendData:_deviceEntity.deviceId data:testData
                                    success:^(NSNumber *deviceId, NSData *data) {
                                        if (data) {
                                            [_deviceDetailsDictionary setValue:data forKey:@"Data"];
                                            [_deviceDetailsTableView reloadData];
                                        }
                                    } failure:^(NSError *error) {
                                        
                                    }];
    
//    [[FirmwareModelApi sharedInstance] getVersionInfo:_deviceEntity.deviceId
//                                              success:^(NSNumber *deviceId, NSNumber *versionMajor, NSNumber *versionMinor) {
//                                                  [_deviceDetailsDictionary setValue:versionMinor forKey:@"Version Minor"];
//                                                  [_deviceDetailsDictionary setValue:versionMajor forKey:@"Version Major"];
//                                                  [_deviceDetailsTableView reloadData];
//                                              } failure:^(NSError *error) {
//                                                  
//                                              }];
    
//    [[ConfigModelApi sharedInstance] getParameters:_deviceEntity.deviceId
//                                           success:^(NSNumber *deviceId, NSNumber *txInterval, NSNumber *txDuration, NSNumber *rxDutyCycle, NSNumber *txPower, NSNumber *timeToLive) {
//                                               NSLog(@"deviceId :%@, txInterval :%@, txDuration :%@, rxDutyCycle :%@, txPower :%@, timeToLive :%@", deviceId, txInterval, txDuration, rxDutyCycle, txPower, timeToLive);
//                                           } failure:^(NSError *error) {
//                                               NSLog(@"");
//                                           }];
//    
//    [[ConfigModelApi sharedInstance] setParameters:_deviceEntity.deviceId
//                                        txInterval:@1
//                                        txDuration:@2
//                                       rxDutyCycle:@3
//                                           txPower:@4
//                                        timeToLive:@5
//                                           success:^(NSNumber *deviceId, NSNumber *txInterval, NSNumber *txDuration, NSNumber *rxDutyCycle, NSNumber *txPower, NSNumber *timeToLive) {
//                                               NSLog(@"");
//                                           } failure:^(NSError *error) {
//                                               NSLog(@"");
//                                           }];
//    [[ConfigModelApi sharedInstance] discoverDevice:_deviceEntity.deviceId
//                                            success:^(NSNumber *deviceId, NSData *deviceHash) {
//                                                NSLog(@"In success block - SJ1");
//                                            } failure:^(NSError *error) {
//                                                NSLog(@"In Failure Block - SJ1");
//                                            }];
//    [[ConfigModelApi sharedInstance] setDeviceId:_deviceEntity.deviceId
//                                      deviceHash:_deviceEntity.deviceHash
//                                     newDeviceId:[[CSRDatabaseManager sharedInstance] getNextFreeDeviceNumber]
//                                         success:^(NSNumber *newDeviceId, NSData *deviceHash) {
//                                             NSLog(@"In success block - SJ");
//                                         } failure:^(NSError *error) {
//                                             NSLog(@"In Failure Block - SJ");
//                                         }];
}

#pragma mark - Layout Subviews

-(void) displayFavouriteState :(BOOL) state
{
    if (state) {
        [_favouritesButton setBackgroundImage:[CSRmeshStyleKit imageOfFavourites_on] forState:UIControlStateNormal];
    } else {
        [_favouritesButton setBackgroundImage:[CSRmeshStyleKit imageOfFavourites_off] forState:UIControlStateNormal];
    }
}


#pragma mark - Button actions

- (IBAction)saveDeviceConfiguration:(id)sender
{
    _deviceEntity.name = _deviceTitleTextField.text;
    
    [[CSRDatabaseManager sharedInstance] saveContext];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toggleFavouriteState:(id)sender
{
    //
    // 1. Toggle favourite for this Device
    // 2. Update image for this device to inidicate new Favourite state
    //
    
    if (_deviceEntity) {
        BOOL state = [_deviceEntity.favourite boolValue];
        state = !state;
        [_deviceEntity setFavourite:@(state)];
        [[CSRDatabaseManager sharedInstance] saveContext];
        
        // update Image
        [self displayFavouriteState:state];
        
    }
}

- (IBAction)editAreas:(id)sender
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [_deviceDetailsDictionary count];
    }
    if (section == 1) {
        return [_areasArray count];
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Device Details";
    }
    if (section == 1) {
        return @"Areas";
    }
    return 0;
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([tableView isEqual:_deviceDetailsTableView]) {
        view.tintColor = [UIColor whiteColor];
        
        UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
        [headerView.textLabel setTextColor:[CSRUtilities colorFromHex:kColorBlueCSR]];
    }
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deviceDetailsCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deviceDetailsCellIdentifier"];
    }
    
    if (indexPath.section == 0) {
        if (_deviceDetailsDictionary && [_deviceDetailsDictionary count] > 0) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@ :%@", [[_deviceDetailsDictionary allKeys] objectAtIndex:indexPath.row], [[_deviceDetailsDictionary allValues] objectAtIndex:indexPath.row]];
            cell.imageView.image = nil;
            return cell;
            
        } else {
            return nil;
        }
        
    } else if (indexPath.section == 1) {
        
        if (_areasArray && [_areasArray count] > 0) {
            
            CSRAreaEntity *areaEntity = [_areasArray objectAtIndex:indexPath.row];
            
            cell.imageView.image = [CSRmeshStyleKit imageOfAreasIcon];
            cell.textLabel.text = areaEntity.areaName;
            return cell;
            
        } else {
            return nil;
        }
        
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"selectOrAddGroupsSegue"]) {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRAreaSelectionViewController *vc = (CSRAreaSelectionViewController*)[navController topViewController];
        vc.deviceEntity = _deviceEntity;
    }
}

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteButtonTapped:(id)sender
{
    _device = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:_deviceEntity.deviceId];
//    [[CSRDevicesManager sharedInstance] initiateRemoveDevice:_device];
    
    if (presenter) {
        presenter = nil;
    }
    
    presenter = self;
    
//    if (_device != nil) {
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Remove %@?", _device.name]
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController.view setTintColor:[CSRUtilities colorFromHex:kColorBlueCSR]];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action) {
                                                             }];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             CSRDeviceEntity *deviceEntity = [[[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRDeviceEntity" withPredicate:@"deviceId == %@", _device.deviceId] allObjects] firstObject];
                                                             _device = [[CSRDevicesManager sharedInstance] getDeviceFromDeviceId:_device.deviceId];
                                                             if (_device) {
                                                                 [[CSRDevicesManager sharedInstance] initiateRemoveDevice:_device];
                                                             }
                                                             if(_deviceEntity) {
                                                                 [[CSRAppStateManager sharedInstance].selectedPlace removeDevicesObject:deviceEntity];
                                                                 [[CSRDatabaseManager sharedInstance].managedObjectContext deleteObject:deviceEntity];
                                                                 [[CSRDatabaseManager sharedInstance] saveContext];
                                                             }
                                                             
                                                             [[CSRDevicesManager sharedInstance] removeDevice:_device];
                                                             
                                                             NSNumber *deviceNumber = [[CSRDatabaseManager sharedInstance] getNextFreeDeviceNumber];
                                                             [[MeshServiceApi sharedInstance] setNextDeviceId:deviceNumber];
                                                             [[CSRDevicesManager sharedInstance] setDeviceIdNumber:deviceNumber];
                                                             
                                                             [presenter dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
//    }
}


-(void) removeDeviceAlert :(NSTimer *)timer {
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
