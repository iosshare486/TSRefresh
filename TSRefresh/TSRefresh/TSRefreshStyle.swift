//
//  TSRefreshStyle.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/6/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    // MARK: - 自定义 header 文字
    /// 下拉默认文字
    @discardableResult
    final public func ts_pullDownToRefreshText(_ text: String) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshStateHeader {
            header.setTitle(text, for: MJRefreshState.idle)
        }
        return self
    }
    /// 下拉松手时文字
    @discardableResult
    final public func ts_releaseToRefreshText(_ text: String) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshStateHeader {
            header.setTitle(text, for: MJRefreshState.pulling)
        }
        return self
    }
    
    /// 刷新时文字
    @discardableResult
    final public func ts_refreshingText(_ text: String) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshStateHeader {
            header.setTitle(text, for: MJRefreshState.refreshing)
        }
        return self
    }
    
    
    /// 刷新文字字体和颜色
    @discardableResult
    final public func ts_refreshingTextFontAndColor(_ font: UIFont?, _ color : UIColor?) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshStateHeader {
            if let textFont = font {
                header.stateLabel.font = textFont
            }
            
            if let textColor = color {
                header.stateLabel.textColor = textColor
            }
        }
        return self
    }
    
    /// 隐藏时间
    @discardableResult
    final public func ts_refreshingStatusTextAndTimeStatusText(_ hiddenStatus: Bool?, _ hiddenTime : Bool?) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshStateHeader {
            if let hStatusText = hiddenStatus {
                header.stateLabel.isHidden = hStatusText
            }
            
            if let hTimeText = hiddenTime {
                header.lastUpdatedTimeLabel.isHidden = hTimeText
            }
        }
        return self
    }
    
    /// 修改下拉刷新剪头图片
    ///
    /// - Parameter image: <#image description#>
    /// - Returns: <#return value description#>
    @discardableResult
    final public func ts_refreshingImage(_ image: UIImage?) -> UIScrollView {
        if let header = self.mj_header as? MJRefreshNormalHeader {
            if let arowwImage = image {
                header.arrowView.image = arowwImage
            }
        }
        return self
    }
    
    
    //MARK: - 自定义 footer 文字
    
    /// 设置下拉刷新默认状态文字
    ///
    /// - Parameter text: <#text description#>
    /// - Returns: <#return value description#>
    @discardableResult
    final public func ts_pullUpToRefreshText(_ text: String) -> UIScrollView {
        if let footer = self.mj_footer as? MJRefreshBackNormalFooter {
            footer.setTitle(text, for: MJRefreshState.idle)
        }
        return self
    }
    
    /// 下拉刷新时状态文字
    ///
    /// - Parameter text: <#text description#>
    /// - Returns: <#return value description#>
    @discardableResult
    final public func ts_loaddingText(_ text: String) -> UIScrollView {
        if let footer = self.mj_footer as? MJRefreshBackNormalFooter {
            footer.setTitle(text, for: MJRefreshState.refreshing)
        }
        return self
    }
    
    /// 无数据文字
    ///
    /// - Parameter text: <#text description#>
    /// - Returns: <#return value description#>
    @discardableResult
    final public func ts_noMoreDataText(_ text: String) -> UIScrollView {
        if let footer = self.mj_footer as? MJRefreshBackNormalFooter {
            footer.setTitle(text, for: MJRefreshState.noMoreData)
        }
        return self
    }
    
    /// 释放将刷新文字
    ///
    /// - Parameter text: <#text description#>
    /// - Returns: <#return value description#>
    @discardableResult
    final public func ts_releaseLoadMoreText(_ text: String) -> UIScrollView {
        if let footer = self.mj_footer as? MJRefreshBackNormalFooter {
            footer.setTitle(text, for: MJRefreshState.pulling)
        }
        return self
    }
    
    /// 刷新文字字体和颜色
    @discardableResult
    final public func ts_loadTextFontAndColor(_ font: UIFont?, _ color : UIColor?) -> UIScrollView {
        if let header = self.mj_footer as? MJRefreshBackNormalFooter {
            if let textFont = font {
                header.stateLabel.font = textFont
            }
            
            if let textColor = color {
                header.stateLabel.textColor = textColor
            }
        }
        return self
    }
    
    @discardableResult
    final public func ts_loadingImage(_ image: UIImage?) -> UIScrollView {
        if let header = self.mj_footer as? MJRefreshBackNormalFooter {
            if let arowwImage = image {
                header.arrowView.image = arowwImage
            }
        }
        return self
    }
}
