//
//  AJTool.m
//  EastTimeOA
//
//  Created by 郭奡劼 on 15/9/16.
//  Copyright (c) 2015年 郭奡劼. All rights reserved.
//

#import "AJTool.h"

@implementation AJTool
+ (NSString *)md5_base64:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    if(cStr == nil){
        return nil;
    }
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

#pragma mark 获得硬件版本
+ (NSString*)getDevice{
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"])   return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"])   return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"])   return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"])   return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"])   return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"])   return @"iPhone 4 (CDMA)";
    
    if ([platform isEqualToString:@"iPhone4,1"])   return @"iPhones 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"])   return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"])   return @"iPhone 5 (GSM+CDMA)";
    
    if ([platform isEqualToString:@"iPhone5,3"])   return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"])   return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"])   return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"])   return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"])   return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone7,2"])   return @"iPhone 6+";
    
    return platform;
}

#pragma mark 获得系统版本号
+(NSString *)getIOSVersion{
    
    return [[UIDevice currentDevice] systemVersion];
    
}

#pragma mark 获得APP版本号
+ (NSMutableString *)getAppVersion{
    
    NSMutableString *appVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]mutableCopy];
    
    return appVersion;
    
}

#pragma mark - 当前时间戳
+ (NSString *)getNowTimestamp{
    
    NSDate *today = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[today timeIntervalSince1970]];  //转化为UNIX时间戳
    
    return timeSp;
    
}

#pragma mark Dic转Json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
@end
