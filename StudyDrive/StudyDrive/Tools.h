//
//  Tools.h
//  StudyDrive
//
//  Created by FineRui on 2016/12/2.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject
+(NSArray *)getAnswerWithString:(NSString *)str;
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size;
@end
