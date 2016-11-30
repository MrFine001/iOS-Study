//
//  MyDataManager.h
//  StudyDrive
//
//  Created by FineRui on 2016/11/30.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    chapter //章节练习
}DataType;
@interface MyDataManager : NSObject
+(NSArray *)getData:(DataType)type;
@end
