//
//  AJTableView.m
//
//  Created by 郭奡劼 on 15/9/19.
//  Copyright © 2015年 郭奡劼. All rights reserved.
//

#import "AJTableView.h"

@implementation AJTableView
{
    @private
    AJView *noDataView;
}

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
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    noDataView = [AJView new];
    [self addSubview:noDataView];
}


#pragma mark - set方法
-(void)setRefresh:(BOOL)refresh{
    _refresh = refresh;
    
    if (refresh) {
        
        self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
        self.header.automaticallyChangeAlpha = YES;

    }

}

-(void)setLoadmore:(BOOL)loadmore{
    _loadmore = loadmore;
    
    if (loadmore) {
        
        self.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    }
}

-(void)setSeparator:(BOOL)separator{
    _separator = separator;
    
    if (!separator) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
}

#pragma mark
-(void)addNoDataViewWithImage:(UIImage *)image andAlertString:(NSString *)alertStr{
    noDataView.frame =CGRectMake(0, 0, IPONEWIDTH, IPONEHEIGHT);
    [noDataView removeAllSubviews];

    AJImageView *imgView = [[AJImageView alloc]initWithFrame:CGRectMake((IPONEWIDTH - image.size.width)/2, 100, image.size.width, image.size.height)];
    imgView.image = image;
    [noDataView addSubview:imgView];
    
    AJLabel *alertLabel = [[AJLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame) + 10, IPONEWIDTH, 20)];
    alertLabel.AJFont = 13;
    alertLabel.textAlignment = NSTextAlignmentCenter;
    alertLabel.text = alertStr;
    alertLabel.textColor = kColor(62, 74, 92, 1);
    [noDataView addSubview:alertLabel];
}

#pragma mark 下拉刷新和上拉加载
-(void)refreshData{
    if ([_ajDelegate respondsToSelector:@selector(AJTableViewBeginRefresh)]) {
        [_ajDelegate AJTableViewBeginRefresh];
    }
}

-(void)loadMoreData{
    if ([_ajDelegate respondsToSelector:@selector(AJTableViewLoadMoreData)]) {
        [_ajDelegate AJTableViewLoadMoreData];
    }
}

#pragma mark - tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([_ajDelegate AJTableView:self numberOfRowsInSection:section]) {
        noDataView.hidden = YES;
    }else{
        noDataView.hidden = NO;
    }
    
    return [_ajDelegate AJTableView:self numberOfRowsInSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_ajDelegate AJTableView:self cellForRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_ajDelegate AJTableView:self heightForRowAtIndexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_ajDelegate AJTableView:self didSelectRowAtIndexPath:indexPath];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if ([_ajDelegate respondsToSelector:@selector(AJTableViewWillBeginDecelerating)]) {
        [_ajDelegate AJTableViewWillBeginDecelerating];
    }
}
@end
