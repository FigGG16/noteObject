//
//  UIFont+Extension.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/26.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

//根据传入的字符串 计算字符串的宽和高
+(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font maxW:(CGFloat)maxW
{
    //带属性的字符串
    NSMutableDictionary *atts =[NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = font;
    
    //计算时不会超过 maxW height  MAXFLOAT表示计算文本高度 不做任何要求
    CGSize MaxSize= CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:MaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}
+(CGSize)sizeWithText:(NSString *)text Font:(UIFont *)font{
    
    return [self sizeWithText:text Font:font maxW:MAXFLOAT];
}
@end
