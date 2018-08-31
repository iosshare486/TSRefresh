//
//  TSRefreshHeader.m
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "TSRefreshHeader.h"

@interface TSRefreshHeader()<TSRefreshHeaderProtocol>

@property (nonatomic, weak) id <TSRefreshHeaderProtocol> delegate;

@end


@implementation TSRefreshHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
    }
    return self;
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState
    
    if (state == MJRefreshStateIdle) {
        if (oldState != MJRefreshStateRefreshing) {
            if ([self.delegate respondsToSelector:@selector(tsToNormalState)]) {
                [self.delegate tsToNormalState];
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(tsToRefreshingState)]) {
                [self.delegate tsToRefreshingState];
            }
        }
    } else if (state == MJRefreshStateRefreshing) {
        if ([self.delegate respondsToSelector:@selector(tsToRefreshingState)]) {
            [self.delegate tsToRefreshingState];
        }
    } else if (state == MJRefreshStatePulling) {
        if ([self.delegate respondsToSelector:@selector(tsToPullingState)]) {
            [self.delegate tsToPullingState];
        }
    } else if (state == MJRefreshStateWillRefresh) {
        if ([self.delegate respondsToSelector:@selector(tsToWillRefreshState)]) {
            [self.delegate tsToWillRefreshState];
        }
    }
}

- (void)prepare {
    [super prepare];
    
    if ([self.delegate respondsToSelector:@selector(tsContentHeight)]) {
        self.mj_h = [self.delegate tsContentHeight];
    }
}

- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    if ([self.delegate respondsToSelector:@selector(tsChangePullingPercent:)]) {
        [self.delegate tsChangePullingPercent:pullingPercent];
    }
}

@end


