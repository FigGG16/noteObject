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
@interface FXHomeViewController ()

@property (strong, nonatomic) FXHomeCustomHeadView *heafView;
@property (strong, nonatomic) FXHomeTableView *tableView;

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
    
    [self.view addSubview:self.tableView];
    
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










@end
