//
//  ViewController.m
//  Adjusting frame
//
//  Created by FineRui on 15/12/29.
//  Copyright © 2015年 FineRui. All rights reserved.
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

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id context) {
        //计算旋转之后的宽度并赋值
        CGSize screen = [UIScreen mainScreen].bounds.size;
        //界面处理逻辑
        if(screen.width > screen.height) {
            NSLog(@"Landscape,width:%f, height:%f ", screen.width, screen.height);
            self.viewLable.frame = CGRectMake(screen.width/2.0-90.0, 40.0, 180.0, 40.0);
            self.Button1.frame = CGRectMake(20.0, 120.0, 280.0, 190.0);
            self.Button2.frame = CGRectMake(20.0, 320.0, 280.0, 190.0);
        } else {
            NSLog(@"Portrait,width:%f, height:%f ", screen.width, screen.height);
            self.viewLable.frame = CGRectMake(screen.width/2.0-90.0, 40.0, 180.0, 40.0);
            self.Button1.frame = CGRectMake(90.0, 90.0, 390.0, 70.0);
            self.Button2.frame = CGRectMake(90.0, 200.0, 390.0, 70.0);
        }
    }completion:^(id context){
        NSLog(@"动画播放完以后处理");
    }];
}

#if 0
//add this but not success
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
       toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        self.viewLable.frame = CGRectMake(70.0, 40.0, 180.0, 40.0);
        self.Button1.frame = CGRectMake(20.0, 120.0, 280.0, 190.0);
        self.Button2.frame = CGRectMake(20.0, 320.0, 280.0, 190.0);
    }  else {
        self.viewLable.frame = CGRectMake(194.0, 20.0, 180.0, 40.0);
        self.Button1.frame = CGRectMake(90.0, 90.0, 390.0, 70.0);
        self.Button2.frame = CGRectMake(90.0, 200.0, 390.0, 70.0);
    }
}
#endif
@end
