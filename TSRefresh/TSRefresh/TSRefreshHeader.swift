//
//  TSRefreshHeader.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/6/26.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

@objc public protocol TSRefreshHeaderProtocol {
    /// 状态变成.idle
    @objc optional func tsToNormalState()
    /// 状态变成.refreshing
    @objc optional func tsToRefreshingState()
    /// 状态变成.pulling
    @objc optional func tsToPullingState()
    /// 状态变成.willRefresh
    @objc optional func tsToWillRefreshState()
    /// 下拉高度／触发高度 值改变
    @objc optional func tsChangePullingPercent(percent: CGFloat)
    
    /// 控件的高度
    ///
    /// - Returns: 控件的高度
    @objc optional func tsContentHeight() -> CGFloat
}

open class TSRefreshHeader: MJRefreshStateHeader{
    
    public var tsSubProtocol: TSRefreshHeaderProtocol? {
        get { return self as? TSRefreshHeaderProtocol }
    }
    
    override open var state: MJRefreshState {
        didSet {
            if state == .idle {
                if oldValue == .refreshing {
                    
                } else {
                    self.tsSubProtocol?.tsToNormalState?()
                }
            } else if state == .refreshing {
                self.tsSubProtocol?.tsToRefreshingState?()
            } else if state == .pulling {
                self.tsSubProtocol?.tsToPullingState?()
            } else if state == .willRefresh {
                self.tsSubProtocol?.tsToWillRefreshState?()
            }
        }
    }
    
    override open var pullingPercent: CGFloat {
        didSet {
            self.tsSubProtocol?.tsChangePullingPercent?(percent: pullingPercent)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    open override func prepare() {
        super.prepare()
        if let contentHeight = self.tsSubProtocol?.tsContentHeight?() {
            self.mj_h = contentHeight
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
