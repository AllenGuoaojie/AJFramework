//
//  AJNetwork.h
//
//  Created by 郭奡劼 on 15/9/14.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

/**
 *封装了AFNetworking和SDWebImage的常用方法
 */

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

//AFNetworking
typedef void (^SuccessBlock)(id JSON);
typedef void (^FairlueBlock)(NSError *error);

//SDWebImage
typedef void (^ImageSuccessBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);


@interface AJNetwork : NSObject

//封装了AFNetworking的GET方法
+(void)getWithURL:(NSString *)url andParameters:(id)parameters success:(SuccessBlock)success fairlue:(FairlueBlock)fairlue;

//封装了AFNetworking的POST方法
+(void)postWithURL:(NSString *)url andParameters:(id)parameters success:(SuccessBlock)success fairlue:(FairlueBlock)fairlue;


//封装了SDWebImage加载图片的方法
+(UIImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image;

//封装了SDWebImage加载图片的方法,带SDWebImageOptions
+(UIImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image andOptions:(SDWebImageOptions)options;

//封装了SDWebImage加载图片的方法,带SDWebImageOptions,带成功block
+(UIImageView *)setImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)image andOptions:(SDWebImageOptions)options success:(ImageSuccessBlock)success;

@end
