//
//  AJTool.h
//
//  Created by 郭奡劼 on 15/9/16.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"

@interface AJTool : NSObject
//MD5
+ (NSString *)md5_base64:(NSString *)string;
//硬件型号
+ (NSString*)getDevice;
//iOS版本
+ (NSString *)getIOSVersion;
//App版本号
+ (NSMutableString *)getAppVersion;
//当前时间戳
+ (NSString *)getNowTimestamp;
//DIC转JSON
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
@end
