//
//  TSLoadMoreAutoFooter.m
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "TSLoadMoreAutoFooter.h"
#import "TSLoadMoreProtocol.h"
@interface TSLoadMoreAutoFooter()<TSLoadMoreProtocol>

@property (nonatomic, weak) id <TSLoadMoreProtocol> delegate;

@end

@implementation TSLoadMoreAutoFooter

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
        if ([self.delegate respondsToSelector:@selector(tsToNormalState)]) {
            [self.delegate tsToNormalState];
        }
    } else if (state == MJRefreshStateRefreshing) {
        if ([self.delegate respondsToSelector:@selector(tsToRefreshingState)]) {
            [self.delegate tsToRefreshingState];
        }
    } else if (state == MJRefreshStatePulling) {
        if ([self.delegate respondsToSelector:@selector(tsToPulling)]) {
            [self.delegate tsToPulling];
        }
    } else if (state == MJRefreshStateNoMoreData) {
        if ([self.delegate respondsToSelector:@selector(tsToNoMoreDataState)]) {
            [self.delegate tsToNoMoreDataState];
        }
    }
}

- (void)prepare {
    [super prepare];
    
    if ([self.delegate respondsToSelector:@selector(tsContentHeight)]) {
        self.mj_h = [self.delegate tsContentHeight];
    }
}

@end
