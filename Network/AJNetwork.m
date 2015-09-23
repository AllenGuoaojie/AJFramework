//
//  AJNetwork.m
//
//  Created by 郭奡劼 on 15/9/14.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJNetwork.h"

@implementation AJNetwork

+(void)getWithURL:(NSString *)url andParameters:(id)parameters success:(SuccessBlock)success fairlue:(FairlueBlock)fairlue{
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSLog(@"Error: %@",[error localizedDescription]);
        fairlue(error);
    }];
}

+(void)postWithURL:(NSString *)url andParameters:(NSDictionary *)parameters success:(SuccessBlock)success fairlue:(FairlueBlock)fairlue{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSLog(@"%@",[error localizedDescription]);
        fairlue(error);
    }];
}


+(AJImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image{
    AJImageView *imageView = [AJImageView new];
    [imageView sd_setImageWithURL:url placeholderImage:image];
    return imageView;
}

+(AJImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image andOptions:(SDWebImageOptions)options{
    AJImageView *imageView = [AJImageView new];
    [imageView sd_setImageWithURL:url placeholderImage:image options:options];
    return imageView;
}

+(AJImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image andOptions:(SDWebImageOptions)options success:(ImageSuccessBlock)success{
    AJImageView *imageView = [AJImageView new];
    [imageView sd_setImageWithURL:url placeholderImage:image options:options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        success(image, error, cacheType, imageURL);
    }];
    return imageView;
}
@end
