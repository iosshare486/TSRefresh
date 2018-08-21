//
//  UIScrollView+TSRefresh.m
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "UIScrollView+TSRefresh.h"

@implementation UIScrollView (TSRefresh)


/**
 添加下拉刷新
 
 @param refreshBlock <#refreshBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addRefreshAction:(void (^)(void))refreshBlock {
    
    self.mj_header = [[MJRefreshNormalHeader alloc] init];
    self.mj_header.refreshingBlock = refreshBlock;
    
    return self;
}

/**
 添加下拉刷新
 
 @param refreshBlock <#refreshBlock description#>
 @param headerView <#headerView description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addRefreshAction:(void (^)(void))refreshBlock headerView:(MJRefreshHeader *)headerView {
    
    self.mj_header = headerView;
    self.mj_header.refreshingBlock = refreshBlock;
    
    return self;
}


/**
 添加加载更多
 
 @param loadMoreBlock <#loadMoreBlock description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addLoadMoreAction:(void (^)(void))loadMoreBlock {
    
    self.mj_footer = [[MJRefreshBackNormalFooter alloc] init];
    self.mj_footer.refreshingBlock = loadMoreBlock;
    return self;
}

/**
 添加加载更多 自定义View
 
 @param loadMoreBlock <#loadMoreBlock description#>
 @param footer <#footer description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_addLoadMoreAction:(void (^)(void))loadMoreBlock loadMoreFooter:(MJRefreshFooter *)footer {
    
    self.mj_footer = footer;
    self.mj_footer.refreshingBlock = loadMoreBlock;
    
    return self;
}

/**
 是否显示加载更多
 
 @param isShow <#isShow description#>
 */
- (void)ts_isShowLoadMore:(BOOL)isShow {
    if (self.mj_footer != nil) {
        self.mj_footer.hidden = !isShow;
    }
}

/**
 开始下拉
 */
- (void)ts_triggerRefreshing {
    if (self.mj_header != nil) {
        [self.mj_header beginRefreshing];
    }
}

/**
 停止下拉和加载更多
 
 @param isNoMore 是否是无数据
 */
- (void)ts_endRefreshingAndLoading:(BOOL)isNoMore {
    if (self.mj_header != nil) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer != nil) {
        if (isNoMore) {
            [self.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.mj_footer endRefreshing];
        }
    }
}

@end
