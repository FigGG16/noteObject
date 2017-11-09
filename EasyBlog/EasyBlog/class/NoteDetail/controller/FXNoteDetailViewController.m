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

@interface FXNoteDetailViewController ()

@property(nonatomic,strong)FXBriefPersonalView *briefview;
@property(nonatomic,strong)FXNoteTextView *noteTextView;

@end

@implementation FXNoteDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    [self.view addSubview:self.briefview];
    [self.view addSubview:self.noteTextView];
}

-(void)clickBackBtn
{
    
    [self.navigationController popViewControllerAnimated:YES];
   
//    [self dismissViewControllerAnimated:TRUE completion:^{
//        NSLog(@"关闭模态视图成功");
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(FXBriefPersonalView *)briefview
{
    if(!_briefview)
    {
        _briefview =[[FXBriefPersonalView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 150)];
        
        _briefview.backgroundColor=[UIColor blueColor];
        
        UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeContactAdd];
        backBtn.frame=CGRectMake(150, 100, 50, 50);
        
        [backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self.briefview addSubview:backBtn];
    }
    return _briefview;
}

-(FXNoteTextView *)noteTextView
{
    if(!_noteTextView){
        
        _noteTextView=[[FXNoteTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.briefview.frame), kScreen_Width, 500)];
        
        _noteTextView.noteContent=@"English students are forced\
        English students are forced to learn too much too soon\
        English students are forced to learn too much too soon\
        to learn too much too soon";
        
    }
    return _noteTextView;
    
}


@end
