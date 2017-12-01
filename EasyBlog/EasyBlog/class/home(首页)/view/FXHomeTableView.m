//
//  FXHomeTableView.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeTableView.h"
#import "FXHomeCustomHeadView.h"
#import "FXHomeTextView.h"
#import "FXArticles.h"
#import "FXArticlesTableViewCellFrame.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

#import "FXArticlesTableViewCell.h"

@interface FXHomeTableView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)NSArray *articleArrayFrame;
@end

@implementation FXHomeTableView


-(void)setHeadView:(FXHomeCustomHeadView *)headView
{
    _headView=headView;
    
    self.dataSource = self;
    self.delegate = self;
    
    //去掉滚动条
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.headView.height, 0, 0, 0);
    
    //不计算内边距
//    self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
   
    //指定tableView
    
    self.tableHeaderView= _headView;
    
    //清楚背景颜色
    self.backgroundColor=[UIColor clearColor];
    
    _isTop=NO;
    
    [self setUpUserArticle];
   //转模型方法
//    _articleArray=[FXArticle mj_objectWithKeyValues:]

}


-(NSArray *)articleArrayFrame{
    
    if(!_articleArrayFrame)
    {
        _articleArrayFrame=[NSArray array];
    }
    return _articleArrayFrame;
}
//请求用户文章数据
-(void)setUpUserArticle
{
    //创建一个管理对象
    AFHTTPSessionManager *man=[AFHTTPSessionManager manager];
    
    //发送get请求
    [man GET:@"http://www.huangfeixiang.com/api/?format=json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *articleArratTemp=[FXArticles mj_objectArrayWithKeyValuesArray:responseObject];
        

        //临时frame
        NSMutableArray *tempArray=[NSMutableArray array];
        
        for(FXArticles *article in articleArratTemp)
        {
            //升级版frame
            FXArticlesTableViewCellFrame *articleFrame=[[FXArticlesTableViewCellFrame alloc] init];
            
            articleFrame.articles=article;
            
            [tempArray addObject:articleFrame];
       
        }
        
        self.articleArrayFrame=tempArray;
        //把模型传给headView的button
        _headView.articleArrayFrame=self.articleArrayFrame;
        
        [self reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败%@",error);
    }];
    
}



#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  //存在的问题  3<行数&&行数<18  出现cell留白
//    return self.articleArray.count;
    
    
    return self.articleArrayFrame.count;

}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

#pragma mark - 组高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
#pragma mark - 标题名
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"Python笔记";
    }
    else if(section==1)
    {
        return @"第二top";
    }
    return nil;
}

#pragma mark - handleButton每行的高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FXArticlesTableViewCellFrame *article=self.articleArrayFrame[indexPath.row];
    return article.cellHeight;

}
#pragma mark - 每组标题custom View
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 5)];
        label.backgroundColor=[UIColor lightGrayColor];
        label.text=@"微博笔记";
    label.font=[UIFont systemFontOfSize:11];
        return label;

}

#pragma mark - 点击跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    FXArticlesTableViewCellFrame *articlesFrame=self.articleArrayFrame[indexPath.row];
    
    //添加监听器
    [self addObserverToNotification];
    
    [self.segueDelegate segueShowDetail:articlesFrame.articles];
//    NSLog(@"选择第%ld行",indexPath.row);
}
#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FXArticlesTableViewCell *cell=[FXArticlesTableViewCell cellWithTableView:tableView];
    cell.articleFrame=self.articleArrayFrame[indexPath.row];
    
//    NSLog(@"title--->%@",cell.articleFrame.articles.title);
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
    self.bounces= offsetY<=0? NO:YES;


    //判断是否显示详情页
    if(offsetY > showMinValueOfStuteBar-kLabelHideTopScreenHeigth)
    {

        [self.superview addSubview:self.labelForHideTopScreen];
        _labelForHideTopScreen.alpha=((offsetY - (showMinValueOfStuteBar-kLabelHideTopScreenHeigth)))*(1.0/kLabelHideTopScreenHeigth);
    }else
    {
       [[self.superview viewWithTag:6666] removeFromSuperview];
    }
    
    
    //   多重判断// 减弱页面乱跳

    CGFloat maxY=(kHeadView_Height-kLabelHideTopScreenHeigth);
    if(offsetY>maxY-300&&_isTop==NO)
    {
        [self setContentOffset:CGPointMake(0, maxY)  animated:NO];
        _isTop=YES;
    }
    if(offsetY<110&&_isTop==YES)
    {
        [UIView animateWithDuration:1.0 animations:^{
            [self setContentOffset:CGPointMake(0, 0)  animated:YES];
        }];
        _isTop=NO;
    }
    
}

#pragma mark - 拖拽结束调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    //分隔栏偏移量Y
    CGFloat maxY=(kHeadView_Height-kLabelHideTopScreenHeigth);
    
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
            NSLog(@"setContentOffsetmMaxY--->=%lf",maxY);
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

//添加监听器方法
-(void )addObserverToNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backTableView:) name:BACK_TABLEVIEW_NOTIFICATION object:nil];
}
//监听通知方法
-(void)backTableView:(NSDictionary *)dict
{
    NSLog(@"调用通知？");
//    self.labelForHideTopScreen.hidden=NO;
    
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
        UIColor *customColor=[UIColor colorWithRed:82/255.0 green:175/255.0 blue:102/255.0 alpha:1];
        
        label.backgroundColor=customColor;
        label.textColor=[UIColor whiteColor];
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
