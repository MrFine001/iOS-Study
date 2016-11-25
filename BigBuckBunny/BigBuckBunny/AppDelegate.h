//
//  AppDelegate.h
//  BigBuckBunny
//
//  Created by FineRui on 16/7/8.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewController *viewController;



@end

