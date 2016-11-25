//
//  ViewController.m
//  StudyDrive
//
//  Created by FineRui on 2016/11/4.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "ViewController.h"
#import "selectView.h"
#import "FirstViewController.h"

@interface ViewController ()
{
    selectView *_selecView;
    __weak IBOutlet UIButton *selecBtn;
}
@end

@implementation ViewController
- (IBAction)click:(UIButton *)sender {
    switch (sender.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{_selecView.alpha=1;}];
            NSLog(@"select car change\r\n");
        }
        break;
        //科目一
        case 101:
        {
            [self.navigationController pushViewController:[FirstViewController alloc] animated:YES];
        }
        break;
        case 102:
        {
        }
        break;
        case 103:
        {
        }
        break;
        case 104:
        {
        }
        break;
        case 105:
        {
        }
        break;
        case 106:
        {
        }
        break;
        
        default:
        break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _selecView = [[selectView alloc] initWithFrame:self.view.frame andBtn:selecBtn];
    _selecView.alpha = 0;
    [self.view addSubview:_selecView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
