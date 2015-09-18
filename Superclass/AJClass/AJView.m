//
//  AJView.m
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJView.h"

@implementation AJView

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

-(void)addNoBtnAlertWithTitle:(NSString *)title{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1];
    
}

-(void)addNoBtnAlertWithTitle:(NSString *)title andDisplayTime:(CGFloat)time{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:time];
    
}

-(void)dismissAlert:(UIAlertView *)alert{
    [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
}
@end
