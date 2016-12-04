//
//  Tools.m
//  StudyDrive
//
//  Created by FineRui on 2016/12/2.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(NSArray *)getAnswerWithString:(NSString *)str{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
    
    for(int i=1; i<=4; i++) {
        [array addObject:[arr[i] substringFromIndex:2]];
    }
    
    return array;
}

+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size{
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
    
    return newSize;
}
@end
