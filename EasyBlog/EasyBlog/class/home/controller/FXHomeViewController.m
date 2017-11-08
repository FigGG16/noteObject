//
//  FXHomeViewController.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/6.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXHomeViewController.h"
#import "FXHomeBackgroundView.h"
#import "FXHomeTableView.h"
#import "FXHomeCustomHeadView.h"
#import "FXHomeTextView.h"
#import "UIBarButtonItem+Extension.h"
@interface FXHomeViewController ()

@property (strong, nonatomic) FXHomeCustomHeadView *heafView;
@property (strong, nonatomic) FXHomeTableView *tableView;
@property (strong, nonatomic) FXHomeTextView *textView;
@end

@implementation FXHomeViewController

-(void)loadView
{
    FXHomeBackgroundView *backgroundView=[[FXHomeBackgroundView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backgroundView.backgroundColor=[UIColor redColor];
    self.view=backgroundView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    

    //set按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_set" selectImage:@"navigationbar_set_highlighted" action:@selector(clickRightBtn)];
    
    

    [self.view addSubview:self.textView];
    [self.view addSubview:self.tableView];
}

-(void)clickRightBtn{
    NSLog(@"Log---->in");
    
}

-(FXHomeTableView *)tableView
{
    if(!_tableView){
        //实例化tableView
        _tableView = [[FXHomeTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        
        _tableView.headView = self.heafView;
    }
    return _tableView;
}

-(FXHomeCustomHeadView *)heafView
{
    if(!_heafView){
        
        //实例化tableViewHeadView
        _heafView= [[FXHomeCustomHeadView alloc]initWithFrame:CGRectMake(0,0, kScreen_Width, kHeadView_Height)];
        _heafView.bothSpace=kBothSpace;
    }
    return _heafView;
}

-(FXHomeTextView *)textView
{
    if(!_textView){
        
        //高度=tableHeatherView的高度 - button容器的高度
        _textView = [[FXHomeTextView alloc ] initWithFrame:CGRectMake(0, 0, kScreen_Width, kHeadView_Height-kContainerOfbutton+50)];
        _textView.backgroundColor=[UIColor lightGrayColor];
    }
    return _textView;
    
}








@end
