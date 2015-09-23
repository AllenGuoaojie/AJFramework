//
//  AJView+Common.m
//
//  Created by 郭奡劼 on 15/9/21.
//  Copyright © 2015年 郭奡劼. All rights reserved.
//

#import "AJView+Common.h"

@implementation AJView (Common)
- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
@end
