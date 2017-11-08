//
//  FXNavigationController.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/7.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXNavigationController.h"
#import "FXHomeViewController.h"
@interface FXNavigationController ()

@end

@implementation FXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/**
 导航Item的抽取
 @param image 图片
 @param selImage 选中图片
 @param action 点击事件
 @return   UIBarButtonItem
 */

-(UIBarButtonItem *)addItemImage:(NSString *)image selectImage:(NSString *)selImage action:(SEL)action
{
    UIButton *Btn =[[UIButton alloc] init];
    //设置普通按钮
    [Btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //设置按钮尺寸
    Btn.frame=CGRectMake(2, 2, 40, 40);
    //设置高亮按钮
    [Btn setImage:[UIImage imageNamed:selImage] forState:UIControlStateHighlighted];
    //自定义UIBarButtonItem按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithCustomView:Btn];
    //添加点击事件
    [Btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return item;

}

@end
