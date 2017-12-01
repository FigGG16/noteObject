//
//  FXArticle.h
//  EasyBlog
//
//  Created by KingGG on 2017/11/12.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXArticles : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *body;
@property(nonatomic,copy)NSString *created_time;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,assign)NSInteger views;
@property(nonatomic,assign)NSInteger likes;
@property(nonatomic,assign)BOOL topped;
@property(nonatomic,assign) NSInteger category;
@property(nonatomic,copy)NSString *articl_img;
@end
