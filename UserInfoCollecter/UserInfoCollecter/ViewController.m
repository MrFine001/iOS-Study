//
//  ViewController.m
//  UserInfoCollecter
//
//  Created by FineRui on 2016/10/13.
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

- (IBAction)hideKeyboard:(id)sender {
    //使用resignFirstResponder 让当前对键盘有控制权的对象放弃第一响应者状态
    [self.LastName resignFirstResponder];
    [self.FirstName resignFirstResponder];
    [self.Email resignFirstResponder];
}

- (IBAction)StoreResults:(id)sender {
    NSString *csvLine = [NSString stringWithFormat:@"%@,%@,%@\n", self.FirstName.text, self.LastName.text,
                         self.Email.text];
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        [[NSFileManager defaultManager] createFileAtPath:surveyFile contents:nil attributes:nil];
    }
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:surveyFile];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[csvLine dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
    
    self.FirstName.text = @"";
    self.LastName.text = @"";
    self.Email.text = @"";
}

- (IBAction)SHowResults:(id)sender {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *surveyFile = [docDir stringByAppendingPathComponent:@"surveyresults.csv"];
  
    if([[NSFileManager defaultManager] fileExistsAtPath:surveyFile]) {
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:surveyFile];
        NSString *surveyResults = [[NSString alloc] initWithData:[fileHandle availableData] encoding:NSUTF8StringEncoding];
        [fileHandle closeFile];
        self.Result.text = surveyResults;
    }
}
@end
