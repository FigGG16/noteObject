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
#import "FXNoteDetailViewController.h"
#import "FXCateTableViewController.h"



@interface FXHomeViewController ()<FXHomeTableViewDelegate,FXHomeCustomHeadViewDelegate>



@property (strong, nonatomic) FXHomeCustomHeadView *headView;
@property (strong, nonatomic) FXHomeTableView *tableView;
@property (strong, nonatomic) FXHomeTextView *textView;

@property(strong,nonatomic)UIImageView *backImageView;
@end


@implementation FXHomeViewController



-(void)viewDidDisappear:(BOOL)animated
{


}

-(void)viewWillAppear:(BOOL)animated
{
    //隐藏导航栏
  [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


-(void)viewWillLayoutSubviews
{

}
//页面重新布局


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (size.width > size.height) { // 横屏
        // 横屏布局 balabala
        
        NSLog(@"横屏布局");
        NSLog(@"w =%f",size.width);
        NSLog(@"h =%f",size.height);
//        self.tableView.frame=CGRectMake(0, 0,size.width, size.height);
    
    } else {
        // 竖屏布局 balabala
        NSLog(@"竖屏布局");
    }
}


-(void)loadView
{
    FXHomeBackgroundView *backgroundView=[[FXHomeBackgroundView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIColor *customColor=[UIColor colorWithRed:82/255.0 green:175/255.0 blue:102/255.0 alpha:1];
    
    backgroundView.backgroundColor=customColor;
    self.view=backgroundView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    



   // 设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//   // 去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];


 
    //set按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem addItemTarget:self Image:@"navigationbar_set" selectImage:@"navigationbar_set_highlighted" action:@selector(clickRightBtn)];

    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.tableView];
}



-(void)clickRightBtn{
    NSLog(@"Log---->in");
    
}

-(UIImageView *)backImageView
{
    if(!_backImageView)
    {
        //实例化
        _backImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 20, kScreen_Width, kHeadView_Height-kContainerOfbutton)];
        //背景图片
        _backImageView.image=[UIImage imageNamed:@"catBackground"];
        
        _backImageView.contentMode= UIViewContentModeScaleToFill;
    }
    
    return _backImageView;
}



-(FXHomeTableView *)tableView
{
    if(!_tableView){
        //实例化tableView
        _tableView = [[FXHomeTableView alloc] initWithFrame:CGRectMake(0, 20, kScreen_Width, kScreen_Height) style: UITableViewStyleGrouped];
        //不计算内边距
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        _tableView.headView = self.headView;
        _tableView.segueDelegate=self;




    
    }
    return _tableView;
}

-(FXHomeCustomHeadView *)headView
{
    if(!_headView){
        //实例化tableViewHeadView
        _headView= [[FXHomeCustomHeadView alloc]initWithFrame:CGRectMake(0,0, kScreen_Width, kHeadView_Height)];
        
        _headView.bothSpace=kBothSpace;
        _headView.SegueDelegate=self;
    }
    return _headView;
}


-(FXHomeTextView *)textView
{
    if(!_textView){
        
        //高度=tableHeatherView的高度 - button容器的高度
        _textView = [[FXHomeTextView alloc ] initWithFrame:CGRectMake(0, 20, kScreen_Width, kHeadView_Height-kContainerOfbutton+50)];
        _textView.backgroundColor=[UIColor clearColor];
        _textView.showEnglishText=@"English students are forced\
        English students are forced to learn too much too soon\
        English students are forced to learn too much too soon\
        to learn too much too soon";
    }
    return _textView;
}

#pragma mark - tableview的代理方法，执行页面跳转
-(void)segueShowDetail:(FXArticles*) article
{
    
    NSLog(@"跳转前-->VC%@",self.navigationController);
    FXNoteDetailViewController *noteDetailVC=[[FXNoteDetailViewController alloc] init];
    noteDetailVC.article=article;

    
    
    [self.navigationController pushViewController:noteDetailVC animated:YES];

}

-(void)segueShowIosCate:(NSArray*)cateArticleFrameArray
{
    FXCateTableViewController *cateVC=[[FXCateTableViewController alloc] init];
    cateVC.navigationItem.title=@"IOS";
    //传递文章数组
    cateVC.cateArticleFrameArray=cateArticleFrameArray;
    //指定代理
    cateVC.segueDelegate=self;
    [self.navigationController pushViewController:cateVC animated:YES];
    NSLog(@"调用了Cate");
}
-(void)segueShowPythonCate:(NSArray*)cateArticleFrameArray
{
    FXCateTableViewController *cateVC=[[FXCateTableViewController alloc] init];
    cateVC.navigationItem.title=@"Python";
    //传递文章数组
    cateVC.cateArticleFrameArray=cateArticleFrameArray;
    //指定代理
    cateVC.segueDelegate=self;
    [self.navigationController pushViewController:cateVC animated:YES];
    

    
    NSLog(@"调用了Cate");
}

-(void)segueShowMoreCate
{
    FXCateTableViewController *cateVC=[[FXCateTableViewController alloc] init];
    cateVC.navigationItem.title=@"More";
    [self.navigationController pushViewController:cateVC animated:YES];
    NSLog(@"调用了Cate");
    
}



@end
