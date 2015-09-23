//
//  AJTableView.h
//
//  Created by 郭奡劼 on 15/9/19.
//  Copyright © 2015年 郭奡劼. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@class AJTableView;
@protocol AJTableViewDelegate <NSObject>

-(UITableViewCell *)AJTableView:(AJTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)AJTableView:(AJTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat;
-(void)AJTableView:(AJTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)AJTableView:(AJTableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(void)AJTableViewBeginRefresh;
-(void)AJTableViewLoadMoreData;

@end


@interface AJTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) BOOL refresh;//是否添加下拉刷新
@property (assign, nonatomic) BOOL loadmore;//是否添加上拉加载
@property (assign, nonatomic) BOOL separator;//是否自带分割线
@property (weak, nonatomic) id<AJTableViewDelegate>ajDelegate;
-(void)addNoDataViewWithImage:(UIImage *)image andAlertString:(NSString *)alertStr;
@end
