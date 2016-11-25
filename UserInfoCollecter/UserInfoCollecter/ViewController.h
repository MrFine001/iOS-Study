//
//  ViewController.h
//  UserInfoCollecter
//
//  Created by FineRui on 2016/10/13.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *FirstName;
@property (strong, nonatomic) IBOutlet UITextField *LastName;

@property (strong, nonatomic) IBOutlet UITextField *Email;
@property (strong, nonatomic) IBOutlet UITextView *Result;

- (IBAction)StoreResults:(id)sender;

- (IBAction)SHowResults:(id)sender;
@end

