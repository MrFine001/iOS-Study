//
//  AnswerScrollView.m
//  StudyDrive
//
//  Created by FineRui on 2016/12/1.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "Tools.h"

#define SIZE self.frame.size
@interface AnswerScrollView() <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
}
@end
@implementation AnswerScrollView
{
    UIScrollView * _scrollView;
    UITableView * _leftTableView;
    UITableView * _mainTableView;
    UITableView * _rightTableView;
    NSArray * _dataArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if(self) {
        _dataArray = [[NSArray alloc]initWithArray:array];
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate = self;
        _leftTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _mainTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _rightTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        if(_dataArray.count>1) {
            _scrollView.contentSize = CGSizeMake(SIZE.width*2, 0);
        }
        
        [self creatView];
    }
    return self;
}

-(void)creatView{
    _leftTableView.frame = CGRectMake(0, 0, SIZE.width, SIZE.height);
    _mainTableView.frame = CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
    _rightTableView.frame = CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_mainTableView];
    [_scrollView addSubview:_rightTableView];
    
    [self addSubview:_scrollView];
    NSLog(@"creatScrollView\r\n");
}

#pragma mark - tableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableview:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    AnswerModel *model  = [self getTheFitModel:tableView];
    CGFloat hight;
    
    if([model.mtype intValue]==1) {
        NSString *str = [[Tools getAnswerWithString:model.mquestion]objectAtIndex:0];
        UIFont *font = [UIFont systemFontOfSize:16];
        hight = [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    } else {
        NSString *str = model.mquestion;
        UIFont *font = [UIFont systemFontOfSize:16];
        hight = [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    
    if(hight<80){
        hight = 80;
    }
    
    return hight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    AnswerModel *model  = [self getTheFitModel:tableView];
    
    NSString *str = [NSString stringWithFormat:@"答案解析：%@",model.mdesc];
    UIFont *font = [UIFont systemFontOfSize:16];
    
    return [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    AnswerModel *model  = [self getTheFitModel:tableView];
    CGFloat hight;
    NSString *str = [NSString stringWithFormat:@"答案解析：%@",model.mdesc];
    UIFont *font = [UIFont systemFontOfSize:16];
    hight = [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
 
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, 100)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, hight-20)];
    label.text = str;
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    label.textColor = [UIColor greenColor];
    [view addSubview:label];
    
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    AnswerModel *model  = [self getTheFitModel:tableView];
    CGFloat hight;
    NSString *str;
    
    if([model.mtype intValue]==1) {
        str = [[Tools getAnswerWithString:model.mquestion]objectAtIndex:0];
        UIFont *font = [UIFont systemFontOfSize:16];
        hight = [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    } else {
        str = model.mquestion;
        UIFont *font = [UIFont systemFontOfSize:16];
        hight = [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, 100)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, hight-20)];
    label.text = [NSString stringWithFormat:@"@%d.%@", [self getQuestionNumber:tableView andCurrentPage:_currentPage], str];
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    [view addSubview:label];
    
    NSLog(@"viewForheader\r\n");
    return view;
}
-(int)getQuestionNumber:(UITableView *)tableView andCurrentPage:(int) page{
    if(tableView==_leftTableView && page==0) {
        return 1;
    } else if(tableView==_leftTableView && page>0) {
        return page;
    } else if(tableView==_mainTableView && page>0 && page<_dataArray.count-1) {
        return page+1;
    //why return page?
    } else if(tableView==_mainTableView && page==_dataArray.count-1) {
        return page;
    } else if(tableView==_mainTableView && page==0) {
        return 2;
    } else if(tableView==_rightTableView && page<_dataArray.count-1) {
        return page+2;
    } else if(tableView==_rightTableView && page==_dataArray.count-1) {
        return page+1;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"AnswerTableViewCell";
    AnswerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AnswerTableViewCell" owner:self options:nil]lastObject];
        cell.numberLabel.layer.masksToBounds = YES;
        cell.numberLabel.layer.cornerRadius = 10;
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"%c", (char)('A'+ indexPath.row)];
    
    AnswerModel *model = [self getTheFitModel:tableView];
    
    if([model.mtype intValue]==1) {
        cell.answerLabel.text = [[Tools getAnswerWithString:model.mquestion]objectAtIndex:indexPath.row+1];
    }
    
    return cell;
}

-(AnswerModel *)getTheFitModel:(UITableView *)tableView{
    AnswerModel *model;
    
    if(tableView==_leftTableView && _currentPage==0) {
        model = _dataArray[_currentPage];
    } else if(tableView==_leftTableView && _currentPage>0) {
        model = _dataArray[_currentPage-1];
    }  else if(tableView==_mainTableView && _currentPage==0) {
        model = _dataArray[_currentPage+1];
    }else if(tableView==_mainTableView && _currentPage==_dataArray.count-1) {
        model = _dataArray[_currentPage-1];
    } else if(tableView==_mainTableView && _currentPage>0 && _currentPage<_dataArray.count-1) {
        model = _dataArray[_currentPage];
    } else if(tableView==_rightTableView && _currentPage==_dataArray.count-1) {
        model = _dataArray[_currentPage];
    } else if(tableView==_rightTableView && _currentPage<_dataArray.count-1) {
        model = _dataArray[_currentPage+1];
    }
    
    return model;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint currentOffset = scrollView.contentOffset;
    int page = (int)currentOffset.x/SIZE.width;
    
    if(page<_dataArray.count-1 && page>0) {
        _scrollView.contentSize = CGSizeMake(currentOffset.x+SIZE.width*2, 0);
        _mainTableView.frame = CGRectMake(currentOffset.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame = CGRectMake(currentOffset.x-SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTableView.frame = CGRectMake(currentOffset.x+SIZE.width, 0, SIZE.width, SIZE.height);
    }
    
    _currentPage = page;
    [self reloadData];
}

-(void)reloadData {
    [_leftTableView reloadData];
    [_mainTableView reloadData];
    [_rightTableView reloadData];
}
@end
