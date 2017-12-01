//
//  FXArticlesTableViewCellFrame.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/25.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FXArticles;
@interface FXArticlesTableViewCellFrame : NSObject

@property(nonatomic,strong)FXArticles *articles;

//原创微博的整体
@property(nonatomic,assign)CGRect originalViewF;
//标题
@property(nonatomic,assign)CGRect titleLabelFrame;
//内容详情
@property(nonatomic,assign)CGRect bodyLabelFrame;
//创建时间
@property(nonatomic,assign)CGRect created_timeLabelFrame;
//浏览数量
@property(nonatomic,assign)CGRect viewsLabelFrame;
//点赞
@property(nonatomic,assign)CGRect likesLabelFrame;
//文章分类
@property(nonatomic,assign)CGRect  categoryLabelFrame;
//图片
@property(nonatomic,assign)CGRect articl_imgViewFrame;
//原创微博的整体
@property(nonatomic,assign)CGRect originalViewFrame;
//单元格的高度
@property(nonatomic,assign)CGFloat cellHeight;
@end
