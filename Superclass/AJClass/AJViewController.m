//
//  AJViewController.m
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJViewController.h"
#import "AJSuperclass.h"
#import "FeHourGlass.h"


#warning 为了ETOA特地import的类
#import "AJLoginVC.h"

@interface AJViewController ()<UIAlertViewDelegate>
{
    AJButton *selectedBtn;
    AJView *loadingView;
}
@end

@implementation AJViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //默认背景为白色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //默认title为类名
    self.title =  [NSString stringWithUTF8String:object_getClassName(self)];

    //iOS7以上解决scrollview顶部空白问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //创建loadingView
    loadingView = [[AJView alloc]init];
    
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
    
}

#pragma mark - 添加顶部筛选按钮
-(AJScrollView *)addTopSelectBtnViewWithBtnName:(NSArray *)nameArr andViewFrame:(CGRect )frame andShowButtonCount:(NSInteger) btnCount andSampleBtn:(AJButton *)sampleBtn{
    
    AJScrollView *topSelectBtnView = [[AJScrollView alloc]initWithFrame:frame];
    topSelectBtnView.showsHorizontalScrollIndicator = NO;
    topSelectBtnView.showsVerticalScrollIndicator = NO;
    topSelectBtnView.scrollsToTop = NO;
    topSelectBtnView.backgroundColor = sampleBtn.backgroundColor;
    
    for (int i = 0; i < nameArr.count; i++) {
        
        AJButton *selectBtn = [AJButton new];
        
        selectBtn.tag = i;
        
        selectBtn.frame = CGRectMake(i * (IPONEWIDTH/btnCount), 0, IPONEWIDTH/btnCount, frame.size.height);
        
        selectBtn.backgroundColor = sampleBtn.backgroundColor;
        
        selectBtn.titleLabel.font = [UIFont fontWithName:systemFont size:12];
        
        UIColor *nomalColor = [sampleBtn titleColorForState:UIControlStateNormal];
                
        UIColor *selectColor = [sampleBtn titleColorForState:UIControlStateSelected];
        
        [selectBtn setTitleColor:nomalColor forState:UIControlStateNormal];
        
        [selectBtn setTitleColor:selectColor forState:UIControlStateSelected];
        
        [selectBtn setTitle:nameArr[i] forState:UIControlStateNormal];
        
        [selectBtn addTarget:self action:@selector(didTapTopSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [topSelectBtnView addSubview:selectBtn];
        
        topSelectBtnView.contentSize = CGSizeMake(CGRectGetMaxX(selectBtn.frame), -64);
        
        switch (i) {
            case 0:
                selectBtn.selected = YES;
                selectedBtn = selectBtn;
                break;
            default:
                break;
        }
        
        AJView *line = [[AJView alloc]initWithFrame:CGRectMake(selectBtn.frame.size.width - .5f, 7.5, .5f, selectBtn.frame.size.height - 15)];
        line.backgroundColor = lineColor;
        [selectBtn addSubview:line];
    }

    return topSelectBtnView;
}

//点击顶部筛选按钮
-(void)didTapTopSelectBtn:(AJButton *)sender{
    selectedBtn.selected = NO;
    sender.selected = YES;
    selectedBtn = sender;
}

#pragma mark - 将UIWindow的RootViewController设置为指定ViewController
-(void)setWindowRootViewController:(AJViewController *)controller{
    AJAccount *account = [AccountTool sharedAccountTool].account;
    account.isLogin = @"N";
    [[AccountTool sharedAccountTool]saveAccount:account];
    self.view.window.rootViewController = controller;
}

#pragma mark - 添加loading页
-(void)addLoadingPageWithFrame:(CGRect )frame{
    loadingView.frame = frame;
    [self.view addSubview:loadingView];
    
    FeHourGlass *hourGlass = [[FeHourGlass alloc] initWithView:loadingView];
    [loadingView addSubview:hourGlass];
    
    [hourGlass showWhileExecutingBlock:^{  } completion:^{  }];
    
    [self.view sendSubviewToBack:loadingView];
}

#pragma mark 隐藏loading页
-(void)hideLoadingView{
    loadingView.hidden = YES;
}

#pragma mark - 为了ETOA特地封装的方法
#warning 为了ETOA特地封装的方法
-(void)TokenPastDue{
    UIAlertView *pastDueAlert = [[UIAlertView alloc]initWithTitle:@"Token已过期，请重新登录" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    pastDueAlert.tag = 100086;
    [pastDueAlert show];
}

-(void)otherUserLogin{
    UIAlertView *otherUserLoginAlert = [[UIAlertView alloc]initWithTitle:@"账号已在别处登录，请重新登陆" message:@"如非自己登陆，请联系后台修改密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
    otherUserLoginAlert.tag = 100086;
    [otherUserLoginAlert show];
}

#pragma mark alertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (alertView.tag) {
        case 100086:{
            
            switch (buttonIndex) {
                case 0:
                    [self setWindowRootViewController:[AJLoginVC new]];
                    break;
            }
            
            break;
        }
        default:
            break;
    }
}
@end
