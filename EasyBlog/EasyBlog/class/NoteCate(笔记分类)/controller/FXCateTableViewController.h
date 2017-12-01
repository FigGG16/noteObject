//
//  FXCateTableViewController.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/9.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXHomeTableViewDelegate.h"
@interface FXCateTableViewController : UITableViewController

@property(nonatomic,copy)NSArray *cateArticleFrameArray;
@property (strong,nonatomic)id<FXHomeTableViewDelegate> segueDelegate;

@end
