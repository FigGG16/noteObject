//
//  FXNoteDetailViewController.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/8.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXNoteDetailViewController.h"
#import "FXBriefPersonalView.h"
#import "FXNoteTextView.h"
#import "FXArticles.h"

#import "Marklight.h"
#import "EasyBlog-Swift.h"
#import <JavaScriptCore/JavaScriptCore.h>


#define kBriefViewHeight    100
#define kBriefViewY    60

@interface FXNoteDetailViewController ()

@property(nonatomic,strong)FXBriefPersonalView *briefview;
@property(nonatomic,strong)FXNoteTextView *noteTextView;
@property(nonatomic,strong)JSContext *jsContext;
@property(nonatomic,strong)JSValue *marked;
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation FXNoteDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //注入js
    [self markdownJs];
    //初始化导航栏
    [self setNavgation];
    //加载文章
    [self.view addSubview:self.webView];


}

//注入js
-(void)markdownJs
{
    self.jsContext=[[JSContext alloc] init];
    //错误回调
    [self.jsContext setExceptionHandler:^(JSContext *context, JSValue *exception){
        NSLog(@"%@", exception.toString);
    }];
    
    //markdown -> html  js参考 https://github.com/showdownjs/showdown
    static NSString *showdownJs;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        showdownJs = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"showdown" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];

    });
    //加载js
    [self.jsContext evaluateScript:showdownJs];
    
    //注入function  markdown -> html，使用时，可以通过 convert('xxx'); 调用
    NSString *jsFunction = @"\
            function convert(md) { \
                return (new showdown.Converter()).makeHtml(md);\
            }";
    [self.jsContext evaluateScript:jsFunction];
//     [self.jsContext evaluateScript:@"hljs.initHighlightingOnLoad()"];
}

//html转成string
- (NSString *)htmlString
{
    //markdown -> html
    JSValue *jsFunctionValue = self.jsContext[@"convert"];
    JSValue *htmlValue = [jsFunctionValue callWithArguments:@[self.article.body] ];

    //加载css样式
    static NSString *css;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        css = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"markdown" ofType:@"css"] encoding:NSUTF8StringEncoding error:nil];
    });
    
    return [NSString stringWithFormat:@"\
            <html>\
            <head>\
            <title>%@</title>\
            <style>%@</style>\
            <script>hljs.initHighlightingOnLoad()</script>\
            </head>\
            <body>\
            %@\
            </body>\
            </html>\
            ", self.article.title, css, htmlValue.toString];
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
    self.navigationItem.title=_article.title;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSDictionary *dict=@{@"user":@"NoteDetail"};
    //发布通知
    [[NSNotificationCenter defaultCenter] postNotificationName:BACK_TABLEVIEW_NOTIFICATION object:self userInfo:dict];
}
-(FXBriefPersonalView *)briefview
{
    if(!_briefview)
    {
        _briefview =[[FXBriefPersonalView alloc] initWithFrame:CGRectMake(0, kBriefViewY, kScreen_Width, 0)];
        _briefview.backgroundColor=[UIColor blueColor];
        

    }
    return _briefview;
}

-(UIWebView *)webView
{
    if(!_webView){
        //实例化
        _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.briefview.frame), kScreen_Width, kScreen_Height-CGRectGetMaxY(self.briefview.frame))];
        //禁止弹簧
        _webView.scrollView.bounces=NO;
        //加载静态html
        [_webView loadHTMLString:[self htmlString] baseURL:nil];
        
        
    }
    return _webView;
}


@end
