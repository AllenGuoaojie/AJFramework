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


//添加顶部筛选按钮
//参数说明：nameArr(姓名数组), frame(view的frame), btnCount(直接展示多少个按钮, 多余的按钮在屏幕外, 通过滚动展示), colorDic(分别是btn的backgroundcolor, normalTitleColor, selectedTitleColor)
-(AJScrollView *)addTopSelectBtnViewWithBtnName:(NSArray *)nameArr andViewFrame:(CGRect )frame andShowButtonCount:(NSInteger)btnCount andBtnColors:(NSDictionary *)colorDic;
//点击选择按钮
-(void)didTapTopSelectBtn:(AJButton *)sender;
@end
