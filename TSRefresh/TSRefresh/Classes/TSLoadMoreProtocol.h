//
//  TSLoadMoreProtocol.h
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSLoadMoreProtocol <NSObject>

@optional
- (void)tsToNormalState;
- (void)tsToNoMoreDataState;
- (void)tsToPulling;

- (void)tsToRefreshingState;
- (CGFloat)tsContentHeight;

///// 默认状态
//@objc optional func tsToNormalState()
///// 无数据状态
//@objc optional func tsToNoMoreDataState()
///// 将要松开状态
//@objc optional func tsToPulling()
///// 正在刷新状态
//@objc optional func tsToRefreshingState()
//
///// 控件的高度(自定义控件通过该方法设置自定义高度)
/////
///// - Returns: 控件的高度
//@objc optional func tsContentHeight() -> CGFloat


@end
