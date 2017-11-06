//
//  FXHomeButtom.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeButton.h"

@implementation FXHomeButton

/**
 添加按钮
 
 @param buttonType 类型
 @param frame 按钮frame
 @param title 标题
 @param titleColor 标题颜色
 @param font 字体大小
 @param textAlignment 文本位置
 @param image 图片
 @param imageViewContentMode 图片位置
 @param handler block点击触发
 @return UIButton
 */
+ (instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment  image:(UIImage *)image imageViewContentMode:(UIViewContentMode)imageViewContentMode handler:(tapHandler)handler{
    
    //button的类型
    FXHomeButton *button = [super buttonWithType:buttonType];
    //button的frame
    button.frame = frame;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    //button的点击事件
    button.handler = handler;
    [button addTarget:button action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    button.backgroundColor=[UIColor whiteColor];
    
    
    return button;
}


#pragma mark - handleButton
- (void)handleButton:(UIButton *)sender{
    if (self.handler) {
        self.handler(sender);
    }
}

#pragma mark - 调整内部ImageView的frame --
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageX = ( contentRect.size.width- KimageWith)/2;
    CGFloat imageY = ( contentRect.size.height-KimageWith)/2;
    CGFloat imageWidth = KimageWith;
    CGFloat imageHeight = KimageWith;
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark - 调整内部UIlable的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    //底部图片高度
    CGFloat btnButtonH=(contentRect.size.height+KimageWith)/2;
    
    
    //title的高度
    CGFloat titleH=contentRect.size.height-btnButtonH;
    
    
    //文字的高度差值
    CGFloat fontsize= [@"计算文字高度" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:KsizeOfButtonTitle+2]}].height;
    
    
    
    //确定titleLabel的中心位置
    CGFloat lastValue=btnButtonH+((titleH-fontsize)/2);
    
    
    
    CGFloat titleX = 0;
    CGFloat titleY = lastValue;
    CGFloat titleHeight =KsizeOfButtonTitle;
    
    CGFloat titleWidth = contentRect.size.width;
    
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}


@end
