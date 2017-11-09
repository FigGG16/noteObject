//
//  FXHomeTableView.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeTableView.h"
#import "FXHomeCustomHeadView.h"


@interface FXHomeTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FXHomeTableView

-(void)setHeadView:(FXHomeCustomHeadView *)headView
{
    _headView=headView;
    
    self.dataSource = self;
    self.delegate = self;
    
    //去掉滚动条
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.headView.height, 0, 0, 0);
    //指定tableView
    self.tableHeaderView= _headView;
    
    //清楚背景颜色
    self.backgroundColor=[UIColor clearColor];
}

#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 3;
    }
    else
    {
        return 10;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001F;
}

#pragma mark - 组高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return 0;
    }
    
    return 100;
}
#pragma mark - 标题名
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"高度";
    }
    else
    {
        return @"第二";
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return nil;
    }
    else
    {
        return @"第二top";
    }
    
}



#pragma mark - 组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


#pragma mark - handleButton每行的高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
#pragma mark - 每组标题custom View
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return nil;
        
    }else
    {
        UIView *blackView=[[UIView alloc] init];
        blackView.backgroundColor=[UIColor lightGrayColor];
        return blackView;
    }
}
#pragma mark -点击cell进行页面跳转

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_labelForHideTopScreen)
    {
        _labelForHideTopScreen.hidden=YES;
    }
    
    [self.segueDelegate segueShowDetail];
//    NSLog(@"选择第%ld行",indexPath.row);
}

#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseFirstTableViewCell = @"reuseFirstTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseFirstTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseFirstTableViewCell];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor orangeColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"FirstTableView:第%ld行", (long)indexPath.row];
    return cell;
}

#pragma mark - firstTableView的代理方法scrollViewDidScroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    //详情页高度
    CGFloat showMinValueOfStuteBar=CGRectGetMinY(self.headView.containerOfbutton.frame)-kLabelHideTopScreenHeigth;
    //scrollView偏移量
    CGFloat offsetY=scrollView.contentOffset.y;
    
    //静止底部的弹簧效果
    self.bounces= offsetY<=300? NO:YES;
  
    
    NSLog(@"TopLabelY==%lf",offsetY);
    //获取主窗口
    UIWindow *window=[[UIApplication sharedApplication] keyWindow];
    
    //判断是否显示详情页
    if(offsetY > showMinValueOfStuteBar-kLabelHideTopScreenHeigth)
    {
        [window addSubview:self.labelForHideTopScreen];
        _labelForHideTopScreen.alpha=((offsetY - (showMinValueOfStuteBar-kLabelHideTopScreenHeigth)))*(1.0/kLabelHideTopScreenHeigth);
    }else
    {
        [[window viewWithTag:6666] removeFromSuperview];
    }
    

    
}

#pragma mark - 拖拽结束调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //分隔栏偏移量Y
    CGFloat maxY=(_headView.height-kLabelHideTopScreenHeigth-_headView.bothSpace);
    CGFloat topMaxY=maxY+110; //上限回弹
    CGFloat toTopMinValue=10;
    //
    CGFloat toBottomInTheMinimumRange=maxY-20;
    //分隔栏是否到达顶部
    static BOOL isTop=NO;
    //offsetY
    CGFloat offsetY=scrollView.contentOffset.y;
    
    //根据拖拉确定tableView位置
    if((isTop==NO&&offsetY<=maxY&&offsetY>toTopMinValue) || ( toBottomInTheMinimumRange<offsetY &&offsetY<=topMaxY) )
    {
        [UIView animateWithDuration:0.5 animations:^{
            [self setContentOffset:CGPointMake(0, maxY)  animated:NO];
        }];
        isTop=YES;
    }else if( (isTop==YES&& offsetY<toBottomInTheMinimumRange) )
    {
        [UIView animateWithDuration:0.5 animations:^{
            [self setContentOffset:CGPointMake(0, 0)  animated:YES];
        }];
        isTop=NO;
    }
}


/**
 详情页label
 
 @return  UIlabel
 */
-(UILabel *)labelForHideTopScreen
{
    if(!_labelForHideTopScreen)
    {
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, kLabelHideTopScreenHeigth)];
        //文本居中
        [label setTextAlignment:NSTextAlignmentCenter];
        label.text=@"每周精选";
        label.tag=6666;
        label.backgroundColor=[UIColor  yellowColor];
        
        _labelForHideTopScreen=label;
    }
    return _labelForHideTopScreen;
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if(hitView == self){
        return nil;
    }
    return hitView;
    
}



@end
