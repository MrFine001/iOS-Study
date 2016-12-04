//
//  AnswerTableViewCell.h
//  StudyDrive
//
//  Created by FineRui on 2016/12/1.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *answerImage;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
