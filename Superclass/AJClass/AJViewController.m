//
//  AJViewController.m
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJViewController.h"

@interface AJViewController ()

@end

@implementation AJViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];

}

#pragma mark - 添加Alert
//添加没有button的Alert
-(void)addNoBtnAlertWithTitle:(NSString *)title{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1];

}

//添加没有button的Alert, 自定义显示时间
-(void)addNoBtnAlertWithTitle:(NSString *)title andDisplayTime:(CGFloat)time{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:time];
}

//Alert消失
-(void)dismissAlert:(UIAlertView *)alert{
    [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
}

#pragma mark - NavigationController
//添加单个右边按钮
-(void)addSingleNavRightBtnWithImageName:(NSString *)imageName andFrame:(CGRect )frame{
    
    AJButton *rightBtn = [AJButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightBtn.frame = frame;
    [rightBtn addTarget:self action:@selector(didTapNavRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barButton;
}

//点击单个右边按钮
-(void)didTapNavRightBtn:(AJButton *)sender{
    NSLog(@"还没写点击方法哦, 方法名是:\"didTapNavRightBtn:\"");
}
@end
