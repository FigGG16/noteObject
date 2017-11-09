//
//  FXNoteTextView.m
//  EasyBlog
//
//  Created by KingGG on 2017/11/8.
//  Copyright © 2017年 KingGG. All rights reserved.
//

#import "FXNoteTextView.h"

@implementation FXNoteTextView


-(void)setNoteContent:(NSString *)noteContent
{
    _noteContent=noteContent;
    
    self.text=_noteContent;
    
    
    
}

@end
