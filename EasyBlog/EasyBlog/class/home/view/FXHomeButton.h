//
//  FXHomeButtom.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXHomeButton : UIButton

//定义block
typedef void(^tapHandler)(UIButton *sender);

@property (nonatomic,strong)tapHandler handler;

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
+ (instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment  image:(UIImage *)image imageViewContentMode:(UIViewContentMode)imageViewContentMode handler:(tapHandler)handler;


@end
