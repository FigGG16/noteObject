//
//  FXArticlesTableViewCell.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/12.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FXArticlesTableViewCellFrame;

@interface FXArticlesTableViewCell : UITableViewCell
////图片
//@property(strong,nonatomic)UIImageView *imageViewFX;
//
////标题
//@property(strong,nonatomic)UILabel *titleLabelFX;
//
////内容详情
//@property(strong,nonatomic)UILabel *detailTextFX;
//
////点赞
//@property(strong,nonatomic)UILabel *starFX;
//
////评论
//@property(strong,nonatomic)UILabel *commentFX;
//
////浏览数量
//@property(strong,nonatomic)UILabel *viewsFX;
//
////浏览数量
//@property(strong,nonatomic)UILabel *dateFX;


//------------------------
@property(nonatomic,strong)FXArticlesTableViewCellFrame *articleFrame;
//原创微博的整体
@property(nonatomic,strong)UIView *originalView;
//标题
@property(nonatomic,strong)UILabel *titleLabel;
//内容详情
@property(nonatomic,strong)UILabel *bodyLabel;
//创建时间
@property(nonatomic,strong)UILabel *created_timeLabel;
//浏览数量
@property(nonatomic,strong)UILabel *viewsLabel;
//点赞
@property(nonatomic,strong)UILabel *likesLabel;
//文章分类
@property(nonatomic,strong)UILabel *categoryLabel;
//图片
@property(nonatomic,strong)UIImageView *articl_imgView;

//parms单元格重用
+(instancetype )cellWithTableView:(UITableView *)tableView;

@end
