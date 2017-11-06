//
//  FXHomeTableView.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FXHomeCustomHeadView;
@interface FXHomeTableView : UITableView

//顶部View
@property (strong, nonatomic) FXHomeCustomHeadView *headView;

//顶部详情label
@property(strong,nonatomic)UILabel *labelForHideTopScreen;

@end
