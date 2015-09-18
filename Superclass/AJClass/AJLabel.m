//
//  AJLabel.m
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJLabel.h"

@implementation AJLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setProperty];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setProperty];
    }
    return self;
}

-(void)setProperty{
    self.layer.masksToBounds = YES;
    self.font = [UIFont fontWithName:systemFont size:15];
}

-(void)setAJFont:(CGFloat)AJFont{
    _AJFont = AJFont;
    self.font = [UIFont fontWithName:systemFont size:AJFont];
}
@end
