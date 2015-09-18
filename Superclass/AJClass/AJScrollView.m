//
//  AJScrollView.m
//  EastTimeOA
//
//  Created by 郭奡劼 on 15/9/17.
//  Copyright © 2015年 郭奡劼. All rights reserved.
//

#import "AJScrollView.h"

@implementation AJScrollView

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
    self.backgroundColor = [UIColor whiteColor];
}

@end
