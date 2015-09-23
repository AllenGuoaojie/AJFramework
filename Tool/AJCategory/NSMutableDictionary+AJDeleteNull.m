//
//  NSMutableDictionary+AJDeleteNull.m
//
//  Created by 郭奡劼 on 15/9/23.
//  Copyright © 2015年 郭奡劼. All rights reserved.
//

#import "NSMutableDictionary+AJDeleteNull.h"

@implementation NSMutableDictionary (AJDeleteNull)

-(NSMutableDictionary *)deleteNull{
    
    if (self) {
        
        for (NSString *key in self) {
            
            if(self[key] == nil || [self[key] isEqual:[NSNull null]]){
                
                [self setObject:@"" forKey:key];
                
            }
            
        }
        
    }
    
    return self;
}

@end
