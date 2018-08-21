//
//  TSRefreshHeader.h
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@protocol TSRefreshHeaderProtocol <NSObject>
@optional

- (void)tsToNormalState;
- (void)tsToRefreshingState;
- (void)tsToPullingState;

- (void)tsToWillRefreshState;
- (void)tsChangePullingPercent:(CGFloat)percent;
- (CGFloat)tsContentHeight;

//    /// 状态变成.idle
//    @objc optional func tsToNormalState()
//    /// 状态变成.refreshing
//    @objc optional func tsToRefreshingState()
//    /// 状态变成.pulling
//    @objc optional func tsToPullingState()
//    /// 状态变成.willRefresh
//    @objc optional func tsToWillRefreshState()
//    /// 下拉高度／触发高度 值改变
//    @objc optional func tsChangePullingPercent(percent: CGFloat)
//
//    /// 控件的高度
//    ///
//    /// - Returns: 控件的高度
//    @objc optional func tsContentHeight() -> CGFloat
@end

@interface TSRefreshHeader : MJRefreshStateHeader

@end
