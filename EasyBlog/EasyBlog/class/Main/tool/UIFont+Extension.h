//
//  UIFont+Extension.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/26.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
//根据传入的字符串 计算字符串的宽和高
+(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font maxW:(CGFloat)maxW;
+(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font;
@end
