//
//  AJViewController.h
//
//  Created by 郭奡劼 on 15/9/15.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJViewController : UIViewController
//添加没有按钮的Alert
-(void)addNoBtnAlertWithTitle:(NSString *)title;
//添加没有按钮的Alert，自定义显示时间
-(void)addNoBtnAlertWithTitle:(NSString *)title andDisplayTime:(CGFloat)time;

//添加单一的导航栏右键
-(void)addSingleNavRightBtnWithImageName:(NSString *)imageName andFrame:(CGRect )frame;
//点击导航栏右键
-(void)didTapNavRightBtn:(AJButton *)sender;
@end
