//
//  UIScrollView+TSRefreshStyle.h
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (TSRefreshStyle)

/**
 配置上拉加载和下拉刷新
 */
- (void)configCustom;

/**
 是否是刷新中

 @return <#return value description#>
 */
- (BOOL)ts_headerIsRefreshing;

- (void)ts_headerRefreshing:(BOOL)isRefreshing;

/**
 下拉默认文字

 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullDownToRefreshText:(NSString *)text;

/**
 下拉松手时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseToRefreshText:(NSString *)text;

/**
 刷新时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingText:(NSString *)text;

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingTextFontAndColor:(UIFont *)font color:(UIColor *)color;

/**
 隐藏时间
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingStatusTextAndTimeStatusText:(BOOL)hiddenStatus hiddenTime:(BOOL)hiddenTime;

/**
 修改下拉刷新剪头图片
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingImage:(UIImage *)image;

//MARK: - 自定义 footer 文字

/**
 设置下拉刷新默认状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullUpToRefreshText:(NSString *)text;

/**
 下拉刷新时状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loaddingText:(NSString *)text;


/**
 无数据文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_noMoreDataText:(NSString *)text;

/**
 释放将刷新文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseLoadMoreText:(NSString *)text;

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadTextFontAndColor:(UIFont *)font color:(UIColor *)color;

/**
 <#Description#>
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadingImage:(UIImage *)image;

@end
