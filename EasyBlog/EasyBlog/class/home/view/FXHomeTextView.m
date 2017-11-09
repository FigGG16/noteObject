//
//  FXHomeTextView.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/7.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeTextView.h"



@implementation FXHomeTextView


-(void)setShowEnglishText:(NSString *)showEnglishText
{
    _showEnglishText=showEnglishText;
    UILabel *showEnglishLabel=[[UILabel alloc] init];
    //背景色
    showEnglishLabel.backgroundColor=[UIColor blueColor];
    //文本赋值
    showEnglishLabel.text=[NSString stringWithFormat:@"每日一句:\n　　%@",_showEnglishText];
    //字体大小
    showEnglishLabel.font = [UIFont systemFontOfSize:kMaxSizeWithEnglishFont];
    
    // 根据字体得到label的内容的尺寸（只会计算单行字体高度）
    CGSize size = [showEnglishLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:showEnglishLabel.font,NSFontAttributeName,nil]];
    
    // 根据label的内容的宽度最终确定宽带
    CGFloat labelContentWith = size.width;
    if(labelContentWith >= kMaxWidthWithEnglishLabel)
    {
        labelContentWith = kMaxWidthWithEnglishLabel;
    }
    //允许多行
     showEnglishLabel.numberOfLines=0;
    //字体颜色
     showEnglishLabel.textColor=[UIColor whiteColor];
    //根据文本内容，宽度，字体大小且自动换行计算高度
     CGSize lblSize = [showEnglishLabel.text boundingRectWithSize:CGSizeMake(labelContentWith, MAXFLOAT ) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kMaxSizeWithEnglishFont]} context:nil].size;
    
    //确定label尺寸位置
    showEnglishLabel.frame=CGRectMake((kScreen_Width-labelContentWith)/2 ,kEnglishLabelY, labelContentWith, lblSize.height);

    [self addSubview:showEnglishLabel];
    
    //实例化btn
    UIButton *translateButton=[[UIButton alloc] init];
    
    //动态设置btton的大小
    translateButton.frame=CGRectMake(self.centerX-(kTranslateButtonWith/2), CGRectGetMaxY(showEnglishLabel.frame)+50, kTranslateButtonWith, kTranslateButtonHeight);

    //设置字符
    [translateButton setTitle:@"翻译中文" forState:UIControlStateNormal];
    //背景颜色
    translateButton.backgroundColor=[UIColor blueColor];
    [self addSubview:translateButton];
    _translateButtom=translateButton;
}

@end
