//
//  selectView.m
//  StudyDrive
//
//  Created by FineRui on 2016/11/16.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "selectView.h"

@implementation selectView
{
    UIButton *_button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame andBtn: (UIButton *)btn {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _button = btn;
        NSLog(@"creatBtn\r\n");
        [self creatBtn];
    }
    
    return self;
}

-(void) creatBtn {
    for(int i=0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.frame.size.width/4*i+self.frame.size.width/4/2-30, self.frame.size.height-80, 60, 60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        NSLog(@"add %d button:%f,%f,%f,%f\r\n",i+1,self.frame.size.width/4*i+self.frame.size.width/4/2-30,self.frame.size.height-80,self.frame.size.width,self.frame.size.height);
        [self addSubview:btn];
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{self.alpha = 0;}];
}

-(void) click:(UIButton *)btn{
  //  [_button setBackgroundImage:[btn backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [_button setImage:[btn backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.3 animations:^{self.alpha = 0;}];
    NSLog(@"Click\r\n");
    
}
@end

