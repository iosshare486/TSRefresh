//
//  UIScrollView+TSRefresh.h
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
//#import <MJRefresh/MJRefresh.h>
@interface UIScrollView (TSRefresh)

/**
 添加下拉刷新

 @param refreshBlock <#refreshBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addRefreshAction:(void (^)(void))refreshBlock;

/**
 添加全局配置下拉刷新

 @param refreshBlock <#refreshBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addSharedRefreshAction:(void (^)(void))refreshBlock;

/**
 添加下拉刷新

 @param refreshBlock <#refreshBlock description#>
 @param headerView <#headerView description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addRefreshAction:(void (^)(void))refreshBlock headerView:(MJRefreshHeader *)headerView;


/**
 添加加载更多

 @param loadMoreBlock <#loadMoreBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addLoadMoreAction:(void (^)(void))loadMoreBlock;

/**
 添加全局加载更多
 
 @param loadMoreBlock <#loadMoreBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addSharedLoadMoreAction:(void (^)(void))loadMoreBlock;

/**
 添加加载更多 自定义View

 @param loadMoreBlock <#loadMoreBlock description#>
 @param footer <#footer description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addLoadMoreAction:(void (^)(void))loadMoreBlock loadMoreFooter:(MJRefreshFooter *)footer;

/**
 是否显示下拉刷新
 
 @param isShow <#isShow description#>
 */
- (void)ts_isShowRefresh:(BOOL)isShow;

/**
 是否显示加载更多

 @param isShow <#isShow description#>
 */
- (void)ts_isShowLoadMore:(BOOL)isShow;

/**
 开始下拉
 */
- (void)ts_triggerRefreshing;

/**
 停止下拉和加载更多

 @param isNoMore 是否是无数据
 */
- (void)ts_endRefreshingAndLoading:(BOOL)isNoMore;

@end
