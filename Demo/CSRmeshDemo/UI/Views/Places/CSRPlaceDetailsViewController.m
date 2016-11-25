//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRPlaceDetailsViewController.h"
#import "CSRUtilities.h"
#import "CSRConstants.h"
#import "CSRmeshStyleKit.h"
#import "CSRSettingsEntity.h"
#import "CSRDeviceEntity.h"
#import "CSRDatabaseManager.h"
#import "CSRUtilities.h"
#import "NSManagedObject+DeleteEntities.h"
#import "AppDelegate.h"
#import "CSRParseAndLoad.h"
#import "CSRAppStateManager.h"

@interface CSRPlaceDetailsViewController ()
{
    NSUInteger pickerMode;
    NSDictionary *iconImageDictionary;
    NSUInteger placeIconId;
    NSUInteger placeColor;
}

@end

@implementation CSRPlaceDetailsViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set image on back button
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setBackgroundImage:[CSRmeshStyleKit imageOfBack_arrow] forState:UIControlStateNormal];
    [_backButton addTarget:self action:(@selector(back:)) forControlEvents:UIControlEventTouchUpInside];
    
    //Set image on delete button
    _deleteButton.backgroundColor = [UIColor clearColor];
    _deleteButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_deleteButton setImage:[[CSRmeshStyleKit imageOfTrashcan] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [_deleteButton.imageView sizeToFit];
    _deleteButton.tintColor = [UIColor lightGrayColor];
    _deleteButton.imageView.tintColor = [UIColor grayColor];
    
    _placeIconSelectionButton.backgroundColor = [UIColor clearColor];
    _placeIconSelectionButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _placeIconSelectionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    _placeIconSelectionButton.imageView.image = [_placeIconSelectionButton.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [_placeIconSelectionButton.imageView sizeToFit];
    _placeIconSelectionButton.tintColor = [UIColor grayColor];
    
    _placeColorSelectionButton.backgroundColor = [UIColor clearColor];
    _placeColorSelectionButton.layer.cornerRadius = _placeColorSelectionButton.bounds.size.width / 2;
    _placeColorSelectionButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _placeColorSelectionButton.layer.borderWidth = 0.5;
    
    _placeNameTF.delegate = self;
    _placeNetworkKeyTF.delegate = self;
    _placeNetworkKeyTF.secureTextEntry = YES;
    
    _showPasswordCheckbox.delegate = self;
    _showPasswordCheckbox.selected = YES;
    _showPasswordCheckbox.highlighted = NO;
    
    // populate values
    if (_placeEntity.name) {
        _placeNameTF.text = _placeEntity.name;
    }
    
    if (_placeEntity.networkKey) {
        _placeNetworkKeyTF.text = _placeEntity.networkKey;
    }
    
    if ([_placeEntity.iconID integerValue] > -1) {
        
        NSArray *placeIcons = kPlaceIcons;
        
        [placeIcons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSDictionary *placeDictionary = (NSDictionary *)obj;
            
            if ([placeDictionary[@"id"] integerValue] > -1 && [placeDictionary[@"id"] integerValue] == [_placeEntity.iconID integerValue]) {
                
                SEL imageSelector = NSSelectorFromString(placeDictionary[@"iconImage"]);
                
                if ([CSRmeshStyleKit respondsToSelector:imageSelector]) {
                    [_placeIconSelectionButton setImage:(UIImage *)[CSRmeshStyleKit performSelector:imageSelector] forState:UIControlStateNormal];
                    _placeIconSelectionButton.imageView.tintColor = [UIColor grayColor];
                }
                
                *stop = YES;
            }
        }];
        
    }
    
    if (_placeEntity.color) {
        _placeColorSelectionButton.backgroundColor = [CSRUtilities colorFromRGB:[_placeEntity.color integerValue]];
    }
    
    if (!_placeIconSelectionButton.imageView.image) {
        [_placeIconSelectionButton setImage:[CSRmeshStyleKit imageOfIconHouse] forState:UIControlStateNormal];
    }
    _importedURL = ((AppDelegate*)[UIApplication sharedApplication].delegate).passingURL;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (!_placeEntity) {
        _deleteButton.hidden = YES;
    }

}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"placeColorIconPickerSegue"]) {
        CSRPlacesColorIconPickerViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.mode = pickerMode;
        vc.popoverPresentationController.delegate = self;
        vc.popoverPresentationController.containerView.superview.layer.cornerRadius = 0;
        vc.preferredContentSize = CGSizeMake(self.view.frame.size.width - 20., 235.);
    }
}

#pragma mark - Actions

- (IBAction)openPicker:(id)sender
{
    if ([sender isEqual:_placeColorSelectionButton]) {
        
        pickerMode = CSRPlacesCollectionViewMode_ColorPicker;
        [self performSegueWithIdentifier:@"placeColorIconPickerSegue" sender:self];
        
    } else if ([sender isEqual:_placeIconSelectionButton]) {
        
        pickerMode = CSRPlacesCollectionViewMode_IconPicker;
        [self performSegueWithIdentifier:@"placeColorIconPickerSegue" sender:self];
        
    }
}

- (IBAction)backbuttonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - <UIPopoverPresentationControllerDelegate>

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    // Return no adaptive presentation style, use default presentation behaviour
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    return NO;
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - <CSRPlacesColorIconPickerDelegate>

- (id)selectedItem:(id)item
{
    if (pickerMode == CSRPlacesCollectionViewMode_ColorPicker) {
        
        NSString *selectedColorHex = (NSString *)item;
        _placeColorSelectionButton.backgroundColor = [CSRUtilities colorFromHex:[NSString stringWithFormat:@"%@", selectedColorHex]];
        
    } else if (pickerMode == CSRPlacesCollectionViewMode_IconPicker) {
        
        iconImageDictionary = (NSDictionary *)item;
        
        placeIconId = [(NSNumber *)iconImageDictionary[@"id"] integerValue];
        SEL imageSelector = NSSelectorFromString(iconImageDictionary[@"iconImage"]);
        
        if ([CSRmeshStyleKit respondsToSelector:imageSelector]) {
            [_placeIconSelectionButton setImage:(UIImage *)[CSRmeshStyleKit performSelector:imageSelector] forState:UIControlStateNormal];
        }
        
        _placeIconSelectionButton.imageView.image = [_placeIconSelectionButton.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_placeIconSelectionButton.imageView sizeToFit];
        _placeIconSelectionButton.imageView.tintColor = [UIColor grayColor];
        
    }
    
    return nil;
}

#pragma mark - <CSRCheckbox>
- (void)checkbox:(CSRCheckbox*)sender stateChangeTo:(BOOL)state
{
    if (state == _showPasswordCheckbox.selected) {
        _placeNetworkKeyTF.secureTextEntry = state;
    } else {
        _placeNetworkKeyTF.secureTextEntry = _showPasswordCheckbox.selected;
    }
}

#pragma mark - Actions

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePlace:(id)sender
{
    if (!placeIconId) {
        
        placeIconId = [_placeEntity.iconID integerValue];
        
    }
    
    if ([CSRAppStateManager sharedInstance].isImportMode == YES) {
        
        if (![CSRUtilities isStringEmpty:_placeNameTF.text] && ![CSRUtilities isStringEmpty:_placeNetworkKeyTF.text]) {
            
            CSRPlaceEntity *newPlace = [NSEntityDescription insertNewObjectForEntityForName:@"CSRPlaceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
            
            newPlace.name = _placeNameTF.text;
            newPlace.networkKey = _placeNetworkKeyTF.text;
            newPlace.color = @([CSRUtilities rgbFromColor:_placeColorSelectionButton.backgroundColor]);
            newPlace.iconID = @(placeIconId);
            newPlace.owner = @"My place";
            
            [self checkForSettings];
            [[CSRAppStateManager sharedInstance] setSelectedPlace:newPlace];
            
        } else {
            [self showAlert];
        }
        
        NSData *jsonDataImported = [NSData dataWithContentsOfURL:_importedURL];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonDataImported options:NSJSONReadingMutableLeaves error:&error];
        CSRParseAndLoad *parseLoad = [[CSRParseAndLoad alloc] init];
        
        NSArray *groupsArray = jsonDictionary[@"areas_list"];
        [parseLoad parseAndLoadGroups:groupsArray];
        
        NSArray *devicesArray = jsonDictionary[@"devices_list"];
        [parseLoad parseAndLoadDevices:devicesArray];
        
        [[CSRAppStateManager sharedInstance] setIsImportMode:NO];
        
        [CSRUtilities saveObject:[[[[CSRAppStateManager sharedInstance].selectedPlace objectID] URIRepresentation] absoluteString] toDefaultsWithKey:@"kCSRLastSelectedPlaceID"];

        [[CSRAppStateManager sharedInstance] setupPlace];
        [self dismissViewControllerAnimated:NO completion:nil];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
    } else if (_placeEntity) {
        
        if (![CSRUtilities isStringEmpty:_placeNameTF.text] && ![CSRUtilities isStringEmpty:_placeNetworkKeyTF.text]) {
            
            _placeEntity.name = _placeNameTF.text;
            _placeEntity.networkKey = _placeNetworkKeyTF.text;
            _placeEntity.color = @([CSRUtilities rgbFromColor:_placeColorSelectionButton.backgroundColor]);
            _placeEntity.iconID = @(placeIconId);
            _placeEntity.owner = @"My place";
            
            [self checkForSettings];
            [[CSRDatabaseManager sharedInstance] saveContext];
            
            [CSRUtilities saveObject:[[[[CSRAppStateManager sharedInstance].selectedPlace objectID] URIRepresentation] absoluteString] toDefaultsWithKey:@"kCSRLastSelectedPlaceID"];
            
            [[CSRAppStateManager sharedInstance] setupPlace];

            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            [self showAlert];
        }
    } else {
        if (![CSRUtilities isStringEmpty:_placeNameTF.text] && ![CSRUtilities isStringEmpty:_placeNetworkKeyTF.text]) {
            CSRPlaceEntity *newPlace = [NSEntityDescription insertNewObjectForEntityForName:@"CSRPlaceEntity" inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
            
            newPlace.name = _placeNameTF.text;
            newPlace.networkKey = _placeNetworkKeyTF.text;
            newPlace.color = @([CSRUtilities rgbFromColor:_placeColorSelectionButton.backgroundColor]);
            newPlace.iconID = @(placeIconId);
            newPlace.owner = @"My place";
            
            _placeEntity = newPlace;
            
            [self checkForSettings];
            
            [[CSRDatabaseManager sharedInstance] saveContext];
            
            [self dismissViewControllerAnimated:YES completion:nil];

        } else {
                [self showAlert];
        }
    }
}

- (void) showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                    message:@"Name and Network key should not be empty, please enter some values"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];

}

- (IBAction)deletePlace:(id)sender
{
    
    if (![[_placeEntity objectID] isEqual:[[CSRAppStateManager sharedInstance].selectedPlace objectID]]) {
        
        [[CSRDatabaseManager sharedInstance].managedObjectContext deleteObject:_placeEntity];
        [[CSRDatabaseManager sharedInstance] saveContext];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"You can't delete current selected place"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)checkForSettings
{
    if (_placeEntity.settings) {
        
        _placeEntity.settings.retryInterval = @2.0;
        _placeEntity.settings.retryCount = @5;
        _placeEntity.settings.concurrentConnections = @1;
        _placeEntity.settings.listeningMode = @1;
        
    } else {
        
        CSRSettingsEntity *settings = [NSEntityDescription insertNewObjectForEntityForName:@"CSRSettingsEntity"
                                                                    inManagedObjectContext:[CSRDatabaseManager sharedInstance].managedObjectContext];
        settings.retryInterval = @2.0;
        settings.retryCount = @5;
        settings.concurrentConnections = @1;
        settings.listeningMode = @1;
        
        _placeEntity.settings = settings;
        
    }
}

@end
