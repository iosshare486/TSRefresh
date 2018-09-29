//
//  TSRefreshConfig.m
//  TSRefresh
//
//  Created by 小铭 on 2018/9/29.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "TSRefreshConfig.h"

@implementation TSRefreshConfig

+ (TSRefreshConfig *)shared
{
    static TSRefreshConfig *sharedDateFormateInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedDateFormateInstance = [[self alloc] init];
    });
    return sharedDateFormateInstance;
}



@end
