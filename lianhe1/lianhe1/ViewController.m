//
//  ViewController.m
//  lianhe1
//
//  Created by FineRui on 16/6/5.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doAlert:(id)sender {
/* iOS9 has deprecated the UIAlertView instead of UIAlertController*/
/*
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Alert Button Selected" message:@"I need your attention Now!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertDialog show];
 */
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert Button Selected"
                                                                   message:@"I need your attention Now!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)doMultiButtonAlert:(id)sender {
#if 0
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"alert button selected" message:@"I need your attention Now" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Maybe Later",@"Never", nil];
    [alertDialog show];
#else
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert Button Selected"
                                                                   message:@"I need your attention Now!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Never" style:UIAlertActionStyleCancel
                                                          handler:nil];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
#endif
}
#if 0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Maybe Later"]) {
        self.userOutput.text = @"Clecked 'Maybe Later'";
    } else  if([buttonTitle isEqualToString:@"OK"]) {
        self.userOutput.text = @"Clecked 'OK'";
    } else {
        self.userOutput.text = @"Clecked 'Never'";
    }
    
    if([alertView.title isEqualToString:@"Email Address"]) {
        self.userOutput.text = [[alertView textFieldAtIndex:0] text];
    }
}
#endif
- (IBAction)doAlertInput:(id)sender {
#if 0
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:@"Email Address" message:@"Please enter your email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    alertDialog.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertDialog show];
#else
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Email Address"
                                                                   message:@"Please enter your email address!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = NSLocalizedString(@"Album Name", @"");
    }];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {}];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Never" style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
#endif
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Destroy"]) {
        self.userOutput.text = @"Clicked 'Destroy";
    } else  if([buttonTitle isEqualToString:@"Negotiate"]) {
        self.userOutput.text = @"Clicked 'Negotiate";
    } else   if([buttonTitle isEqualToString:@"Compromise"]) {
        self.userOutput.text = @"Clicked 'Compromise";
    } else {
        self.userOutput.text = @"Clicked 'Cancel";
    }
}

- (IBAction)doActionSheet:(id)sender {
#if 0
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Available" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destroy" otherButtonTitles:@"Negotiate",@"Compromise", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
#else
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Email Address"
                                                                   message:@"Please enter your email address!"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
#endif
}

- (IBAction)doSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"soundeffect" ofType:@".wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)doAlertSound:(id)sender {
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@".wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    
    AudioServicesPlayAlertSound(soundID);
}

- (IBAction)doVibration:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
