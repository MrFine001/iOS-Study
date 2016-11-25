//
// Copyright 2015 Qualcomm Technologies International, Ltd.
//

#import "CSRMainViewController.h"
#import "CSRPlacesColorIconPickerViewController.h"
#import "CSRCheckbox.h"
#import "CSRPlaceEntity.h"

@interface CSRPlaceDetailsViewController : CSRMainViewController <UIPopoverPresentationControllerDelegate, CSRPlacesColorIconPickerDelegate, UITextFieldDelegate, CSRCheckboxDelegate, UIAlertViewDelegate>

@property (nonatomic) CSRPlaceEntity *placeEntity;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *placeNameTF;
@property (weak, nonatomic) IBOutlet UITextField *placeNetworkKeyTF;
@property (weak, nonatomic) IBOutlet UIButton *placeIconSelectionButton;
@property (weak, nonatomic) IBOutlet UIButton *placeColorSelectionButton;
@property (weak, nonatomic) IBOutlet CSRCheckbox *showPasswordCheckbox;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *importUpdateButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

//Share Database
@property (nonatomic, retain) NSURL *importedURL;

- (IBAction)openPicker:(id)sender;
- (IBAction)backbuttonTapped:(id)sender;
- (IBAction)savePlace:(id)sender;
- (IBAction)deletePlace:(id)sender;


@end
