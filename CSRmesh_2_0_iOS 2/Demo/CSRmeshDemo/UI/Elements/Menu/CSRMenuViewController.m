//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//


#import "CSRMenuViewController.h"
#import "CSRMenuTableViewCell.h"
#import "CSRMenuActionTableViewCell.h"
#import "CSRAppStateManager.h"
#import "CSRmeshStyleKit.h"
#import "CSRUtilities.h"
#import "CSRConstants.h"
#import "CSRSettingsEntity.h"
#import "CSRDatabaseManager.h"
#import "CSRDeviceEntity.h"
#import "CSRPlaceEntity.h"
#import "CSRGatewayEntity.h"
#import "CSRPlaceDetailsViewController.h"
#import "CSRDevicesManager.h"
#import "CSRDatabaseViewController.h"
#import "CSRBridgeRoaming.h"

@interface CSRMenuViewController () <FBSDKLoginButtonDelegate>
{
    NSArray *placesArray;
    CSRBridgeRoaming *bridgeRoaming;
}

@property (nonatomic) NSArray *menuTier1Array;
@property (nonatomic) NSArray *menuTier2Array;
@property (nonatomic) NSMutableArray *myPlacesArray;
@property (nonatomic) NSMutableArray *sharedPlacesArray;
@property (nonatomic) NSString *segueID;

@end

@implementation CSRMenuViewController

#define kMainTableViewTag 100001;
#define kHouseDetailsTableViewTag 100005;

static BOOL isHouseDetailMenuVisible = NO;

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuTier1Array = @[@{@"icon":[CSRmeshStyleKit imageOfFavouritesIcon], @"name":@"Favourites", @"segueID":@"favouritesSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfActivitiesIcon], @"name":@"Activities", @"segueID":@"activitiesSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfAreasIcon], @"name":@"Areas", @"segueID":@"areasSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfBulbIcon], @"name":@"CSRmesh devices", @"segueID":@"devicesSegue"}];
    
    _menuTier2Array = @[@{@"icon":[CSRmeshStyleKit imageOfUsersIcon], @"name":@"Users", @"segueID":@"usersSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfShareIcon], @"name":@"Share the place", @"segueID":@"shareThePlaceSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfDeveloperOptionsIcon], @"name":@"Developer options", @"segueID":@"developerOptionsSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfSettingsIcon], @"name":@"Settings", @"segueID":@"settingsSegue"},
                       @{@"icon":[CSRmeshStyleKit imageOfAboutIcon], @"name":@"About", @"segueID":@"aboutSegue"}];
    
    //Places
    
    _myPlacesArray = [NSMutableArray new];
    _sharedPlacesArray = [NSMutableArray new];
    
    _mainMenuTableView.tag = kMainTableViewTag;
    _mainMenuTableView.delegate = self;
    _mainMenuTableView.dataSource = self;
    
    _menuSwitchButton.backgroundColor = [UIColor clearColor];
    [_menuSwitchButton setImage:[CSRmeshStyleKit imageOfMenu_arrow_down] forState:UIControlStateNormal];
    
    _placesTableView.tag = kHouseDetailsTableViewTag;
    _placesTableView.delegate = self;
    _placesTableView.dataSource = self;
    
    //Hide second section of the menu
    _placesSectionView.hidden = YES;
    _placesSectionView.alpha = 0.;
    
    _versionLabel.text = [NSString stringWithFormat:@"v%@", [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]];
    
    
    // Manage places button definition
    
    //Set image on delete button
    _managePlacesButton.backgroundColor = [UIColor clearColor];
    _managePlacesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_managePlacesButton setImage:[[CSRmeshStyleKit imageOfInlineGear] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [_managePlacesButton.imageView sizeToFit];
    _managePlacesButton.tintColor = [UIColor lightGrayColor];
    _managePlacesButton.imageView.tintColor = [UIColor grayColor];
    
    // Bearer switch button configuration
    _bearerSwitchButton.backgroundColor = [UIColor clearColor];
    [_bearerSwitchButton addTarget:self action:(@selector(bearerChangeSettings:)) forControlEvents:UIControlEventTouchUpInside];
    
    //KVO
    bridgeRoaming = [CSRBridgeRoaming sharedInstance];
    [self registerBridgesObserver];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configureViewWithSelectedPlace]; 
    
    //Bearer switch
    switch ([CSRAppStateManager sharedInstance].bearerType) {
            
        case CSRSelectedBearerType_Bluetooth:
        {
            if (bridgeRoaming.numberOfConnectedBridges >= 1) {
                
                [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfBluetooth_on] forState:UIControlStateNormal];
                
            } else {
                
                [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfBluetooth_off] forState:UIControlStateNormal];
                
            }
        }
            break;
            
        case CSRSelectedBearerType_Gateway:
            [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfGateway_on] forState:UIControlStateNormal];
            break;
            
        case CSRSelectedBearerType_Cloud:
            [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfCloud_on] forState:UIControlStateNormal];
            break;
            
        default:
            break;
            
    }
    
    //split places into two groups
    
    [_myPlacesArray removeAllObjects];
    [_sharedPlacesArray removeAllObjects];
    
    placesArray = [[[[CSRDatabaseManager sharedInstance] fetchObjectsWithEntityName:@"CSRPlaceEntity" withPredicate:nil] allObjects] mutableCopy];
    
    [placesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        CSRPlaceEntity *place = (CSRPlaceEntity *)obj;
        
        if (![CSRUtilities isStringEmpty:place.owner]) {
            
            if ([place.owner isEqualToString:@"My place"]) {
                
                [_myPlacesArray addObject:place];
                
            } else {
                
                [_sharedPlacesArray addObject:place];
                
            }
        }
        
    }];
    
    // add "+create my place" button"
    
    [_myPlacesArray addObject:@"+ Create a new place"];
    
    [_placesTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    [_placesTableView reloadData];
    
    CGRect mainTableFrame = _mainMenuTableView.frame;
    
    NSLog(@"mainTableFrame: %@", NSStringFromCGRect(mainTableFrame));
    
    _mainMenuTableView.frame = CGRectMake(mainTableFrame.origin.x, mainTableFrame.origin.y, 276., mainTableFrame.size.height);
    
    [self updateViewConstraints];
    
    
    
}

- (void)viewDidLayoutSubviews
{

    CGRect mainTableFrame = _mainMenuTableView.frame;
    
    NSLog(@"mainTableFrame: %@", NSStringFromCGRect(mainTableFrame));
    
    _mainMenuTableView.frame = CGRectMake(mainTableFrame.origin.x, mainTableFrame.origin.y, 276., mainTableFrame.size.height);
    
    [self updateViewConstraints];
    
}

#pragma mark - Table View data source methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if ([tableView isEqual:_mainMenuTableView]) {
        if (section == 1) {
            return 2.;
        } else {
            return 0;
        }
    } else {
        return  52.;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([tableView isEqual:_mainMenuTableView]) {

        if (section == 1) {
        
            UIView *view = [[UIView alloc] init];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10., 0., tableView.frame.size.width - 20., 2.)];
            line.backgroundColor = [UIColor lightGrayColor];
            
            [view addSubview:line];
            
            return view;
            
        }
        
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([tableView isEqual:_placesTableView]) {
        view.tintColor = [UIColor whiteColor];
        
        UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
        [headerView.textLabel setTextColor:[CSRUtilities colorFromHex:kColorBlueCSR]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger placesSectionCount = 0;
    
    if ([tableView isEqual:_mainMenuTableView]) {
        
       return 2;
        
    } else if ([tableView isEqual:_placesTableView]) {
        
        if ([_myPlacesArray count] > 0) {
            placesSectionCount++;
        }
        
        if ([_sharedPlacesArray count] > 0) {
            placesSectionCount++;
        }
            
        return placesSectionCount;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    if ([tableView isEqual:_mainMenuTableView]) {
        
        if (section == 0) {
            
            return [_menuTier1Array count];
            
        } else if (section == 1) {
            
            return [_menuTier2Array count];
            
        }
        
    } else if ([tableView isEqual:_placesTableView]) {
        
        if (section == 0) {
            
            if ([_myPlacesArray count] > 0) {
                
                return [_myPlacesArray count];
                
            } else {
                
                return [_sharedPlacesArray count];
                
            }
            
        } else if (section == 1) {
            
            if ([_sharedPlacesArray count] > 0) {
                
                return [_sharedPlacesArray count];
                
            }
            
        }
        
    }
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    
    if ([tableView isEqual:_placesTableView]) {
        
        //dynamic set needs to applied here
        
        switch (section) {
                
            case 0:
                
                if ([_myPlacesArray count] > 0) {
                    
                    sectionName = @"MY PLACES";
                    
                } else if ([_sharedPlacesArray count] > 0) {
                    
                    sectionName = @"PLACES SHARED WITH ME";
                    
                }
                
                break;
                
            case 1:
                
                if ([_sharedPlacesArray count] > 0) {
                    
                    sectionName = @"PLACES SHARED WITH ME";
                    
                }
                
                break;
                
            default:
                sectionName = @"";
                break;
        }
        
    }
    
    return sectionName;
}

#pragma mark - Table View methods

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
    
    if ([tableView isEqual:_mainMenuTableView]) {
        
        if (indexPath.section == 0) {
            
            if (_menuTier1Array && [_menuTier1Array count] > 0) {
                
                id obj = [_menuTier1Array objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    
                    CSRMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRMenuTableViewCellIdentifier];
                    
                    NSDictionary *menuDict = obj;
                    cell.iconImageView.image = menuDict[@"icon"];
                    cell.nameLabel.text = menuDict[@"name"];
                    return cell;
                    
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
            
        } else if (indexPath.section == 1) {
            
            if (_menuTier2Array && [_menuTier2Array count] > 0) {
                
                id obj = [_menuTier2Array objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    
                    CSRMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRMenuTableViewCellIdentifier];
                    
                    NSDictionary *menuDict = obj;
                    cell.iconImageView.image = menuDict[@"icon"];
                    cell.nameLabel.text = menuDict[@"name"];
                    return cell;
                    
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
            
        }
    
    } else if ([tableView isEqual:_placesTableView]) {
        
        if (indexPath.section == 0) {
            
            if (_myPlacesArray && [_myPlacesArray count] > 0) {
                
                id obj = [_myPlacesArray objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[CSRPlaceEntity class]]) {
                    
                    CSRMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRMenuTableViewCellIdentifier];
                    
                    CSRPlaceEntity *place = (CSRPlaceEntity *)obj;
                    cell.nameLabel.text = place.name;
                    return cell;
                    
                } else if ([obj isKindOfClass:[NSString class]]) {
                    
                    CSRMenuActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuActionTableViewCellIdentifier"];
                    
                    cell.actionNameLabel.text = obj;
                    return cell;
                
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
            
        } else if (indexPath.section == 1) {
            
            if (_sharedPlacesArray && [_sharedPlacesArray count] > 0) {
                
                id obj = [_sharedPlacesArray objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[CSRPlaceEntity class]]) {
                    
                    CSRMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CSRMenuTableViewCellIdentifier];
                    
                    CSRPlaceEntity *place = (CSRPlaceEntity *)obj;
                    cell.nameLabel.text = place.name;
                    return cell;
                    
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
            
        }
    
    }
    
    
    
    
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_mainMenuTableView]) {
        
        if (indexPath.section == 0) {
            
            if (_menuTier1Array && [_menuTier1Array count] > 0) {
                
                id obj = [_menuTier1Array objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary *menuDict = obj;
                    
                    if ([[menuDict allKeys] count] > 0) {
                        _segueID = menuDict[@"segueID"];
                    }
                    
                }
            }
            
            if (![CSRUtilities isStringEmpty:_segueID]) {
                [self performSegueWithIdentifier:_segueID sender:self];
            }
            
        } else if (indexPath.section == 1) {
            
            if (_menuTier2Array && [_menuTier2Array count] > 0) {
                
                id obj = [_menuTier2Array objectAtIndex:indexPath.row];
                
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    
                    NSDictionary *menuDict = obj;
                    
                    if ([[menuDict allKeys] count] > 0) {
                        _segueID = menuDict[@"segueID"];
                    }
                    
                }
            }
            
            if (![CSRUtilities isStringEmpty:_segueID] && indexPath.row != 1) {
                [self performSegueWithIdentifier:_segueID sender:self];
            }
            
            if (indexPath.row == 1) {
                
                [[CSRDatabaseViewController sharedInstance] createJSONOnFly];
                
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentsDirectory = [paths objectAtIndex:0];
                
                //To get the current place Name
                CSRPlaceEntity *placeEntity = [[CSRAppStateManager sharedInstance] selectedPlace];
                
                //make a file name to write the data to using the documents directory:
                NSString *fileName = [NSString stringWithFormat:@"%@/%@_Database.json", documentsDirectory, placeEntity.name];
                _jsonURL = [NSURL fileURLWithPath:fileName];
                
                
                UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[_jsonURL]
                                                                                         applicationActivities:nil];
                [activityVC setValue:@"JSON Attached" forKey:@"subject"];
                
                activityVC.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                    //^(NSString *activityType, BOOL completed) {
                    NSLog(@"Activity Type Selected :%@", activityType);
                    if (completed) {
                        NSLog(@"Selected Activity was completed");
                    } else {
                        if (activityType == NULL) {
                            NSLog(@"User dismissed the view controller without making a selection");
                        } else {
                            NSLog(@"Activity was not performed");
                        }
                    }
                };
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self presentViewController:activityVC animated:YES completion:nil];
                    if ([activityVC respondsToSelector:@selector(popoverPresentationController)]) {
                        UIPopoverPresentationController *activity = [activityVC popoverPresentationController];
                        CGRect frame = [_mainMenuTableView rectForRowAtIndexPath:indexPath];
                        
                        //convert table row frame to view reference
                        CGRect frameInView = [_mainMenuTableView convertRect:frame toView:self.view];
                        activity.sourceRect = frameInView;
                        activity.sourceView = self.view;
                    }

                }];
            }
            
        }
        
    } else if ([tableView isEqual:_placesTableView]) {
        
        if (indexPath.section == 0) {
            
            if (_myPlacesArray && [_myPlacesArray count] > 0) {
                
                if ([[_myPlacesArray objectAtIndex:indexPath.row] isKindOfClass:[CSRPlaceEntity class]]) {
                
                    CSRPlaceEntity *place = [_myPlacesArray objectAtIndex:indexPath.row];
                
                    [CSRAppStateManager sharedInstance].selectedPlace = place;
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_data" object:self];
                    [self configureViewWithSelectedPlace];
                    
                } else if ([[_myPlacesArray objectAtIndex:indexPath.row] isKindOfClass:[NSString class]]) {
                    
                    [self performSegueWithIdentifier:@"createNewPlaceSegue" sender:self];
                    
                }
            }
            
        } else if (indexPath.section == 1) {
            
            if (_sharedPlacesArray && [_sharedPlacesArray count] > 0) {
                
                if ([[_sharedPlacesArray objectAtIndex:indexPath.row] isKindOfClass:[CSRPlaceEntity class]]) {
                    
                    CSRPlaceEntity *place = [_sharedPlacesArray objectAtIndex:indexPath.row];
                    
                    [CSRAppStateManager sharedInstance].selectedPlace = place;
                    
                    // TODO: set the cloudMeshID
                    // Library something == place.settings.cloudMeshID;
                    
                    [self configureViewWithSelectedPlace];
                    
                    
                    
                }
            }
            
        }
        
    }
    
    return indexPath;
}

#pragma mark - Actions

- (IBAction)toggleMenuSwitch:(id)sender
{
    
    _menuSwitchButton.enabled = NO;
    
//    CGRect topSectionOldFrame = _topSectionView.frame;
//    
//    CGFloat topViewHeight = 195.0f;
    
    NSLog(@"self.view.frame.size: %@", NSStringFromCGSize(self.view.frame.size));
    
    if (_placesSectionView.hidden) {
        
        [UIView animateWithDuration:0.2
                         animations:^{
//                             _topSectionView.frame = CGRectMake(topSectionOldFrame.origin.x, topSectionOldFrame.origin.y, topSectionOldFrame.size.width, self.view.frame.size.height);
                             _placesSectionView.hidden = NO;
                             _placesSectionView.alpha = 1.;
                             
                         }
                         completion:^(BOOL finished){
                             NSLog(@"top menu max size completed");
                             isHouseDetailMenuVisible = YES;
                             _menuSwitchButton.enabled = YES;
                             [_menuSwitchButton setImage:[CSRmeshStyleKit imageOfMenu_arrow_up] forState:UIControlStateNormal];
                         }];
        
    } else {
        
        [UIView animateWithDuration:0.2
                         animations:^{
//                             _topSectionView.frame = CGRectMake(topSectionOldFrame.origin.x, topSectionOldFrame.origin.y, topSectionOldFrame.size.width, topViewHeight);
                             _placesSectionView.alpha = 0.;
                         }
                         completion:^(BOOL finished){
                             NSLog(@"top menu min size completed");
                             _placesSectionView.hidden = YES;
                             isHouseDetailMenuVisible = NO;
                             _menuSwitchButton.enabled = YES;
                             [_menuSwitchButton setImage:[CSRmeshStyleKit imageOfMenu_arrow_down] forState:UIControlStateNormal];
                         }];
    }
    
    
}

- (IBAction)logoutTouched:(id)sender
{
    
}

#pragma mark - Facebook

// Mandatory but unused. The hamburger will have
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error
{
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    [self performSegueWithIdentifier:@"logoutSegue" sender:self];
}

- (IBAction)managePlacesTouched:(id)sender
{
    [self performSegueWithIdentifier:@"managePlacesSegue" sender:nil];
}

//TODO: sort the sizing issue: check if self.view.frame.size.height is bigger than self.tableView.contentSize.height
//TODO: add the rotation handler
//TODO: sort the delegate and tableview padding

#pragma mark - Navigation

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue*)segue
{
}

- (IBAction)bearerChangeSettings:(id)sender
{
    [self performSegueWithIdentifier:@"settingsSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"createNewPlaceSegue"]) {
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        CSRPlaceDetailsViewController *vc = (CSRPlaceDetailsViewController*)[navController topViewController];
        vc.title = @"Create a new place";
        
    } else {
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        UINavigationController *vc = (UINavigationController*)[navController topViewController];
        
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:vc.view.bounds];
        vc.view.layer.masksToBounds = NO;
        vc.view.layer.shadowColor = [UIColor blackColor].CGColor;
        vc.view.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
        vc.view.layer.shadowOpacity = 0.5f;
        vc.view.layer.shadowPath = shadowPath.CGPath;
        
    }
}

#pragma mark - Selected place setup

- (void)configureViewWithSelectedPlace
{
    //set initially selected place
    
    if ([CSRAppStateManager sharedInstance].selectedPlace) {
        
        //Set network key for communication with devices
//        [[CSRDevicesManager sharedInstance] setNetworkPassPhrase:[CSRAppStateManager sharedInstance].selectedPlace.networkKey];
        
        if (![CSRUtilities isStringEmpty:[CSRAppStateManager sharedInstance].selectedPlace.name]) {
            _placeNameLabel.text = [CSRAppStateManager sharedInstance].selectedPlace.name;
        }
        
        if (![CSRUtilities isStringEmpty:[CSRAppStateManager sharedInstance].selectedPlace.owner]) {
            _placeOwnerLabel.text = [CSRAppStateManager sharedInstance].selectedPlace.owner;
        }
        
        _topSectionView.backgroundColor = [CSRUtilities colorFromRGB:[[CSRAppStateManager sharedInstance].selectedPlace.color integerValue]];
        
        if ([[CSRAppStateManager sharedInstance].selectedPlace.iconID integerValue] > -1) {
            
            NSArray *placeIcons = kPlaceIcons;
            
            [placeIcons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                NSDictionary *placeDictionary = (NSDictionary *)obj;
                
                if ([placeDictionary[@"id"] integerValue] > -1 && [placeDictionary[@"id"] integerValue] == [[CSRAppStateManager sharedInstance].selectedPlace.iconID integerValue]) {
                    
                    SEL imageSelector = NSSelectorFromString(placeDictionary[@"iconImage"]);
                    
                    if ([CSRmeshStyleKit respondsToSelector:imageSelector]) {
                        _placeImageView.image = (UIImage *)[CSRmeshStyleKit performSelector:imageSelector];
                        _placeImageView.tintColor = [UIColor whiteColor];
                    }
                    
                    *stop = YES;
                }
            }];
            
        }
        
//        //set the gateway
//        if ([[CSRAppStateManager sharedInstance].selectedPlace.gateways count] > 0) {
//
//            [CSRAppStateManager sharedInstance].currentGateway = (CSRGatewayEntity *)[[[CSRAppStateManager sharedInstance].selectedPlace.gateways allObjects] lastObject];
        
//            if (gateway) {
//
//                switch ([CSRAppStateManager sharedInstance].bearerType) {
//                        
//                    case 1:
//                        [[CSRAppStateManager sharedInstance] setupCloudWithEndpoint:CSRMeshCloudEndpoint_REST
//                                                                           withMode:CSRMeshCloudMode_CNC];
//                        break;
//                        
//                    case 2:
//                        [[CSRAppStateManager sharedInstance] setupCloudWithEndpoint:CSRMeshCloudEndpoint_Gateway
//                                                                           withMode:CSRMeshCloudMode_CNC];
//                        break;
//                        
//                    default:
//                        break;
//                }
//                
//                
//                
//            }
//            
//        }

//        // TODO: remove after demo
//        else {
//            
//            [[CSRAppStateManager sharedInstance] setupCloudWithEndpoint:CSRMeshCloudEndpoint_Gateway
//                                                               withMode:CSRMeshCloudMode_CNC];
//            
//        }

        [CSRUtilities saveObject:[[[[CSRAppStateManager sharedInstance].selectedPlace objectID] URIRepresentation] absoluteString] toDefaultsWithKey:@"kCSRLastSelectedPlaceID"];
        
        [[CSRAppStateManager sharedInstance] setupPlace];
        
//        [[CSRDatabaseManager sharedInstance] loadDatabase];
        
    }
    
    
    
}

#pragma mark - KVO

- (void)registerBridgesObserver
{
    
    [bridgeRoaming addObserver:self
                    forKeyPath:@"numberOfConnectedBridges"
                       options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                       context:NULL];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"numberOfConnectedBridges"]) {
        
//        NSLog(@"[KVO] numberOfConnectedBridges: %@ (old : %@)",[change valueForKey:@"new"], [change valueForKey:@"old"]);
        
        if ([change valueForKey:@"new"]) {
        
            NSNumber *numberOfConnectedBridges = [change valueForKey:@"new"];
            
            if ([CSRAppStateManager sharedInstance].bearerType == CSRSelectedBearerType_Bluetooth) {
                
                if ([numberOfConnectedBridges intValue] >= 1) {
                    
                    [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfBluetooth_on] forState:UIControlStateNormal];
                    
                } else {
                    
                    [_bearerSwitchButton setBackgroundImage:[CSRmeshStyleKit imageOfBluetooth_off] forState:UIControlStateNormal];
                    
                }
                
            }
            
        }

    }
    
}


@end
