//
//  FXCateTableViewController.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/9.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXCateTableViewController.h"
#import "FXArticles.h"
#import "FXArticlesTableViewCellFrame.h"
#import "FXArticlesTableViewCell.h"


@interface FXCateTableViewController ()<FXHomeTableViewDelegate>

@end

@implementation FXCateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
         [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self setNavgation];

}


//设置导航栏样式
-(void)setNavgation
{
    //自定义颜色
    UIColor *customColor=[UIColor colorWithRed:82/255.0 green:175/255.0 blue:102/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = customColor;
    //设置标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //标题
}

#pragma mark - Table view data source

#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //存在的问题  3<行数&&行数<18  出现cell留白
    //    return self.articleArray.count;
    
    
    return self.cateArticleFrameArray.count;
    
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

#pragma mark - 组高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}


#pragma mark - handleButton每行的高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FXArticlesTableViewCellFrame *article=self.cateArticleFrameArray[indexPath.row];
    return article.cellHeight;
    
}

#pragma mark - 点击跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FXArticlesTableViewCellFrame *articlesFrame=self.cateArticleFrameArray[indexPath.row];
    
    //添加监听器
//    [self addObserverToNotification];
    
    [self.segueDelegate segueShowDetail:articlesFrame.articles];
    //    NSLog(@"选择第%ld行",indexPath.row);
}
#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FXArticlesTableViewCell *cell=[FXArticlesTableViewCell cellWithTableView:tableView];
    cell.articleFrame=self.cateArticleFrameArray[indexPath.row];
    
    //    NSLog(@"title--->%@",cell.articleFrame.articles.title);
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
