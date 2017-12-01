//
//  FXHomeTableView.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXHomeViewController.h"
#import "FXArticles.h"

//委托FXHomeViewController进行页面跳转协议
@protocol FXHomeTableViewDelegate<NSObject>

-(void)segueShowDetail:(FXArticles*) article;

@end

@class FXHomeCustomHeadView;

@interface FXHomeTableView : UITableView


@property (strong,nonatomic)id<FXHomeTableViewDelegate> segueDelegate;

//顶部View
@property (strong, nonatomic) FXHomeCustomHeadView *headView;

//顶部详情label
@property(strong,nonatomic)UILabel *labelForHideTopScreen;

//分隔栏是否到达顶部
@property(nonatomic,assign)BOOL isTop;
@end
