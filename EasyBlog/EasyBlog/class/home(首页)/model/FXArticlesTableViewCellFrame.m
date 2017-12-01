//
//  FXArticlesTableViewCellFrame.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/25.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXArticlesTableViewCellFrame.h"
#import "FXArticles.h"


#define cellMargin 15
@implementation FXArticlesTableViewCellFrame



//重写status的set方法，接受微博数据
-(void)setArticles:(FXArticles *)articles
{
    _articles=articles;
    
    //头像的frame
    CGFloat iconX=cellMargin;
    CGFloat iconY=cellMargin;
    CGFloat iconWH=80;
    
    //图片
    _articl_imgViewFrame=CGRectMake(iconX, iconY, iconWH, iconWH);
    
    
    //文章标题
    CGFloat titleX=CGRectGetMaxX(_articl_imgViewFrame)+cellMargin;
    CGFloat titleY=iconX;
    CGSize titleSize=[UIFont sizeWithText:_articles.title Font:cellNameFont];
    //    self.nameLabelF=CGRectMake(nameX, nameY, nameSize.width,nameSize.height);
    //以上写法都一样
    _titleLabelFrame =(CGRect){{titleX,titleY+5},titleSize};
    
    
    CGFloat created_timeX=titleX;
    CGFloat created_timeY=CGRectGetMaxY(_titleLabelFrame)+cellMargin;
    CGSize created_timeSize=[UIFont sizeWithText:_articles.created_time Font:cellTimeFont];
    _created_timeLabelFrame=(CGRect){{created_timeX,created_timeY},created_timeSize};
    
    

    //文章内容
    CGFloat bodyX=iconX;
    CGFloat bodyY=MAX(CGRectGetMaxY(_articl_imgViewFrame), CGRectGetMaxY(_created_timeLabelFrame)+cellMargin);
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    CGFloat bodyMaxW=cellW-2*cellMargin;
    
    CGSize bodySize=[UIFont sizeWithText:[articles.body substringToIndex:50] Font:cellTimeFont maxW:bodyMaxW];
    _bodyLabelFrame=(CGRect){{bodyX,bodyY},bodySize};
    
    
    
    
    
    //cell的高
    _cellHeight=CGRectGetMaxY(_bodyLabelFrame) +cellMargin;
    

}

@end
