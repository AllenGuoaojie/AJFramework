//
//  AJViewController.h
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJViewController : UIViewController
{
    AFHTTPRequestOperationManager *afnManager;//方便VC获取当前afnManager
}

//添加没有按钮的Alert
-(void)addNoBtnAlertWithTitle:(NSString *)title;
//添加没有按钮的Alert，自定义显示时间
-(void)addNoBtnAlertWithTitle:(NSString *)title andDisplayTime:(CGFloat)time;


//添加单一的导航栏右键
-(void)addSingleNavRightBtnWithImageName:(NSString *)imageName andFrame:(CGRect )frame;
//点击导航栏右键
-(void)didTapNavRightBtn:(AJButton *)sender;


//添加顶部筛选按钮
//参数说明：nameArr(姓名数组), frame(view的frame), btnCount(直接展示多少个按钮, 多余的按钮在屏幕外, 通过滚动展示), sampleBtn(需要提供一个sampleBtn，创建的btn将从sampleBtn中获取backgroundColor、nomalTitleColor、selectTitleColor)
-(AJScrollView *)addTopSelectBtnViewWithBtnName:(NSArray *)nameArr andViewFrame:(CGRect )frame andShowButtonCount:(NSInteger) btnCount andSampleBtn:(AJButton *)sampleBtn;
//点击选择按钮
-(void)didTapTopSelectBtn:(AJButton *)sender;


//将UIWindow的RootViewController设置为指定ViewController
-(void)setWindowRootViewController:(AJViewController *)controller;


//添加加载页
-(void)addLoadingPageWithFrame:(CGRect )frame;
//添加加载页可选背景色
-(void)addLoadingPageWithFrame:(CGRect )frame andBackgroundColor:(UIColor *)color;
//隐藏加载页
-(void)hideLoadingView;

#warning 为了ETOA特地封装的方法
-(void)TokenPastDue;
-(void)otherUserLogin;
@end
