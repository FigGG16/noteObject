//
//  FXHomeCustomHeadView.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeCustomHeadView.h"
#import "FXHomeButton.h"
#import "FXHomeTableView.h"
#import "FXArticles.h"
#import "FXArticlesTableViewCellFrame.h"
@implementation FXHomeCustomHeadView

/*
 category_id 3 OC
             2 swift
             1 python
 */

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if(hitView == self){
        return nil;
    }
    return hitView;
    
}

/**
 控件尺寸
 @param bothSpace 间隔
 */
- (void)setBothSpace:(CGFloat)bothSpace
{
    _bothSpace=bothSpace;
    
    //设置透明
//    self.backgroundColor = [UIColor yellowColor];
    
    //button容器的偏移量
    CGFloat containerOfbuttonY=kHeadView_Height-kContainerOfbutton;
    
    //UIview容器
    UIView *containerOfbutton=[[UILabel alloc] initWithFrame:CGRectMake(0, containerOfbuttonY, self.frame.size.width,kContainerOfbutton)];
    
    //开启用户交互
    containerOfbutton.userInteractionEnabled=YES;
    //容器的背景颜色
    containerOfbutton.backgroundColor=[UIColor lightGrayColor];
    //强应用容器
    _containerOfbutton=containerOfbutton;
    
    //btn的宽高
    CGFloat buttonW=(containerOfbutton.frame.size.width-(kSpaceInTheMiddleOfButtom*2))/3;
    CGFloat buttonH=(containerOfbutton.frame.size.height-kSpaceInTheMiddleOfButtom-_bothSpace)/2;
    
    
    //空值button
    FXHomeButton *buttonNone = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(0,0,buttonW, buttonH) title:@"None" titleColor:[UIColor blackColor] titleFont:KsizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_none"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        
    }];
    [containerOfbutton addSubview:buttonNone];
    
    //我的计划
    FXHomeButton *buttonPlan = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(buttonNone.frame.size.width+kSpaceInTheMiddleOfButtom,0,buttonW, buttonH) title:@"我的计划" titleColor:[UIColor  blackColor] titleFont:KSizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_plan"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        
        NSLog(@"------2");
    }];
    [containerOfbutton addSubview:buttonPlan];
    
    //我的书写
    FXHomeButton *buttonWrite = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake((buttonNone.frame.size.width+kSpaceInTheMiddleOfButtom)*2, 0,buttonW, buttonH) title:@"随笔写写" titleColor:[UIColor  blackColor] titleFont:KSizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_write"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        
        NSLog(@"------3");
    }];
    [containerOfbutton addSubview:buttonWrite];
    
    
    //ios分类
    FXHomeButton *buttonIos = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(0, CGRectGetMaxY(buttonNone.frame)+kSpaceInTheMiddleOfButtom,buttonW, buttonH) title:@"IOS笔记" titleColor:[UIColor  blackColor] titleFont:KsizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_ios_note"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        

       
        
        [self.SegueDelegate segueShowIosCate:[self  getArticleArrayWithCate:3]];
        
        NSLog(@"------4");
    }];
    [containerOfbutton addSubview:buttonIos];
    
    //python分类
    FXHomeButton *buttonPython = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(buttonNone.frame.size.width+kSpaceInTheMiddleOfButtom, CGRectGetMaxY(buttonNone.frame)+kSpaceInTheMiddleOfButtom,buttonW, buttonH) title:@"Pytho笔记" titleColor:[UIColor  blackColor] titleFont:KsizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_python_note"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        
        [self.SegueDelegate segueShowPythonCate:[self getArticleArrayWithCate:1]];
        
    }];
    [containerOfbutton addSubview:buttonPython];
    
    //更多分类
    FXHomeButton *buttonMore = [FXHomeButton buttonWithType:UIButtonTypeCustom frame:CGRectMake((buttonNone.frame.size.width+kSpaceInTheMiddleOfButtom)*2, CGRectGetMaxY(buttonNone.frame)+kSpaceInTheMiddleOfButtom,buttonW, buttonH) title:@"More.." titleColor:[UIColor  blackColor] titleFont:KsizeOfButtonTitle textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"button_more_note"] imageViewContentMode:UIViewContentModeScaleAspectFit handler:^(UIButton *sender) {
        
        [self.SegueDelegate segueShowMoreCate];
        
    }];
    [containerOfbutton addSubview:buttonMore];
    
    
    [self addSubview:containerOfbutton];
}

-(NSMutableArray *)getArticleArrayWithCate:(NSInteger)cateId
{
    //取出符合分类的文章
    NSMutableArray *cateArticleArray=[NSMutableArray array];
    for(FXArticlesTableViewCellFrame *articleFrame in self.articleArrayFrame)
    {
        
        FXArticles *article=articleFrame.articles;
        
        if(article.category ==cateId)
        {
            [cateArticleArray addObject:articleFrame];
        }
    }
    
    return cateArticleArray;
    
}

@end
