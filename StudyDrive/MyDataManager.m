//
//  MyDataManager.m
//  StudyDrive
//
//  Created by FineRui on 2016/11/30.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "MyDataManager.h"
#import "FMDatabase.h"
#import "TestSelectModel.h"
@implementation MyDataManager
+(NSArray *)getData:(DataType)type{
    static FMDatabase *dataBase;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    if(dataBase == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
    }
    if([dataBase open]) {
        NSLog(@"open success!\r\n");
    } else {
        return array;
    }
    switch (type) {
        case chapter:
        {
            NSString *sql = @"select pid,pname,pcount FROM firstlevel";
            FMResultSet *rs = [dataBase executeQuery:sql];
            
            while ([rs next]) {
                TestSelectModel *model = [[TestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d", [rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d", [rs intForColumn:@"pcount"]];
                
                [array addObject:model];
            }
        }
        break;
            
        default:
            break;
    }
    
    return array;
}
@end
