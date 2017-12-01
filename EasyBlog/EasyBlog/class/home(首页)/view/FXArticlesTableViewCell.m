//
//  FXArticlesTableViewCell.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/12.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXArticlesTableViewCell.h"
#import "FXArticlesTableViewCellFrame.h"
#import "FXArticles.h"
#import "UIImageView+WebCache.h"
#import "MMMarkdown.h"

@implementation FXArticlesTableViewCell

#define KcellImageH  80
#define kcellTittleH  40
#define kcellItemH 30
#define kcellItemW 100
#define kcellDateH 40
#define kcellDateW 150
#define kcellLeftAndRightSpace 15


+(instancetype )cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"FX";
    
    //创建方法，并实现封装
    FXArticlesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {   //不能让系统创建UITableViewCellStyleSubtitle 方法，要进行拦截
        //重写这个方法
        cell=[[FXArticlesTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

////标题
//@property(nonatomic,strong)UILabel *titleLabel;
////内容详情
//@property(nonatomic,strong)UILabel *bodyLabel;
////创建时间
//@property(nonatomic,strong)UILabel *created_timeLabel;
////浏览数量
//@property(nonatomic,strong)UILabel *viewsLabel;
////点赞
//@property(nonatomic,strong)UILabel *likesLabel;
////文章分类
//@property(nonatomic,assign)UILabel * categoryLabel;
////图片
//@property(nonatomic,copy)UIImageView *articl_imgLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        //原创微博的整体
        _originalView=[[UIView alloc] init];
        [self.contentView addSubview:_originalView];
        
        //标题
        _titleLabel=[[UILabel alloc] init];
        [_originalView addSubview:_titleLabel];
        
        //内容详情
        _bodyLabel=[[UILabel alloc] init];
        [_originalView addSubview:_bodyLabel];
        _bodyLabel.numberOfLines=0;
        //创建时间
        _created_timeLabel=[[UILabel alloc] init];
        [_originalView addSubview:_created_timeLabel];
        
        //浏览量
        _viewsLabel=[[UILabel alloc] init];;
        [_originalView addSubview:_viewsLabel];
        
        //点赞数
        _likesLabel=[[UILabel alloc] init];
        [_originalView addSubview:_likesLabel];
        
        //分类
        _categoryLabel=[[UILabel alloc] init];
        [_originalView addSubview:_categoryLabel];
        
        //图片
        _articl_imgView=[[UIImageView alloc] init];
        [_originalView addSubview:_articl_imgView];
        
    }
    return self;
}

-(void)setArticleFrame:(FXArticlesTableViewCellFrame *)articleFrame
{
    _articleFrame=articleFrame;

    
    FXArticles *article=_articleFrame.articles;
    
    //cell的高
    self.height= _articleFrame.cellHeight;
    
    //图片img
    _articl_imgView.frame=_articleFrame.articl_imgViewFrame;
    
    //加载网络图片
    [_articl_imgView sd_setImageWithURL:[NSURL URLWithString:article.articl_img] placeholderImage:[UIImage imageNamed:@"avatar_default"]];
    
    //文章标题
    _titleLabel.frame=_articleFrame.titleLabelFrame;
    _titleLabel.text=article.title;
    [_titleLabel setFont:cellNameFont];
    
    
    //创建时间
    _created_timeLabel.frame=_articleFrame.created_timeLabelFrame;
    _created_timeLabel.text=[_articleFrame.articles.created_time substringToIndex:10];
    [_created_timeLabel setFont:cellTimeFont];
    
    
    //markdown处理
    //    markdown处理
    NSError  *error;
    NSString *markdown   = [articleFrame.articles.body substringToIndex:50];
    NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
    
    //
    NSAttributedString * attributedString =
    [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                          documentAttributes:nil error:nil];
    
    //文本内容
    
    _bodyLabel.frame=_articleFrame.bodyLabelFrame;
    _bodyLabel.attributedText =attributedString;
        [_created_timeLabel setFont:cellTimeFont];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
