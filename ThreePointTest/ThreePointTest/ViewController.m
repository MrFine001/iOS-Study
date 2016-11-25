//
//  ViewController.m
//  ThreePointTest
//
//  Created by FineRui on 16/1/5.
//  Copyright © 2016年 FineRui. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestView *view = [[TestView alloc]initWithFrame:self.view.frame];
    self.view = view;
    //[view release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
