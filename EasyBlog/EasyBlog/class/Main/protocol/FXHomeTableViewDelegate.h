//
//  FXHomeTableViewDelegate.h
//  EasyBlog
//
//  Created by KingGG on 2017/12/1.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXArticles.h"

@protocol FXHomeTableViewDelegate <NSObject>
-(void)segueShowDetail:(FXArticles*) article;
@end
