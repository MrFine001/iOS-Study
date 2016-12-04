//
//  AnswerScrollView.h
//  StudyDrive
//
//  Created by FineRui on 2016/12/1.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView: UIView
-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;
@property (nonatomic, assign, readonly) int currentPage;
@end
