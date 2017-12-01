//
//  FXHomeCustomHeadView.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"FXHomeViewController.h"

@protocol FXHomeCustomHeadViewDelegate<NSObject>

//导航到python分类
-(void)segueShowPythonCate:(NSArray*)cateArticleFrameArray;
//导航到Ios分类
-(void)segueShowIosCate:(NSArray*)cateArticleFrameArray;
//更多分类
-(void)segueShowMoreCate;

@end

@interface FXHomeCustomHeadView : UIView

@property(nonatomic,copy)NSArray *articleArrayFrame;

//声明协议属性
@property(strong,nonatomic)id<FXHomeCustomHeadViewDelegate> SegueDelegate;

//分隔栏高度
@property (assign, nonatomic) CGFloat bothSpace;

//按钮容器
@property (strong, nonatomic)UIView * containerOfbutton;
@end
