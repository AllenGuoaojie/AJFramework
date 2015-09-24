//
//  AJButton.m
//
//  Created by 郭奡劼 on 15/9/16.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJButton.h"

@implementation AJButton

-(void)setAJFont:(CGFloat)AJFont{
    _AJFont = AJFont;
    self.titleLabel.font = [UIFont fontWithName:systemFont size:AJFont];
}


@end
