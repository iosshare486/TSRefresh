//
//  TSRefresh.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/6/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

extension UIScrollView {
    /// 添加下拉刷新
    ///
    /// - Parameters:
    ///   - refreshHeader: 下拉刷新动效View必须继承TSRefreshHeader并且要实现TSRefreshHeaderProtocol，不传值的时候默认使用 DefaultGTMRefreshHeader
    ///   - refreshBlock: 刷新数据Block
    @discardableResult
    final public func ts_addRefreshAction(refreshHeader: MJRefreshHeader? = MJRefreshNormalHeader(), refreshBlock:@escaping () -> Void) -> UIScrollView {
        self.mj_header = refreshHeader
        refreshHeader?.refreshingBlock = refreshBlock
        return self
    }
    
     
    
    /// 添加上拉加载
    ///
    /// - Parameters:
    ///   - loadMoreFooter: 上拉加载动效View必须继承GTMLoadMoreFooter，不传值的时候默认使用 DefaultGTMLoadMoreFooter
    ///   - refreshBlock: 加载更多数据Block
    @discardableResult
    final public func ts_addLoadMoreAction(loadMoreFooter: MJRefreshFooter? = MJRefreshBackNormalFooter(), loadMoreBlock:@escaping () -> Void) -> UIScrollView {
        self.mj_footer = loadMoreFooter
        loadMoreFooter?.refreshingBlock = loadMoreBlock
        return self
    }
    
    /// 隐藏和显示上拉加载View
    final public func ts_isShowLoadMore(isShow: Bool) {
        if self.mj_footer != nil {
            self.mj_footer.isHidden = !isShow
        }
    }
    
    /// 开始下拉刷新
    final public func ts_triggerRefreshing(){
        if self.mj_header != nil {
            self.mj_header.beginRefreshing()
        }
    }
    
    /// 停止刷新，包括上拉刷新和下拉刷新
    final public func ts_endRefreshingAndLoading(_ isNoMore : Bool) {
        if self.mj_header != nil {
            self.mj_header.endRefreshing()
        }
        if self.mj_footer != nil {
            if isNoMore {
                self.mj_footer.endRefreshingWithNoMoreData()
            } else {
                self.mj_footer.endRefreshing()
            }
        }
    }
}

