//
//  TSLoadMoreFooter.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/6/26.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

@objc public protocol TSLoadMoreProtocol {
    
    /// 默认状态
    @objc optional func tsToNormalState()
    /// 无数据状态
    @objc optional func tsToNoMoreDataState()
    /// 将要松开状态
    @objc optional func tsToPulling()
    /// 正在刷新状态
    @objc optional func tsToRefreshingState()
    
    /// 控件的高度(自定义控件通过该方法设置自定义高度)
    ///
    /// - Returns: 控件的高度
    @objc optional func tsContentHeight() -> CGFloat
}

open class TSLoadMoreBackFooter: MJRefreshBackNormalFooter {
    public var tsSubProtocol: TSLoadMoreProtocol? {
        get { return self as? TSLoadMoreProtocol }
    }
    override open var state: MJRefreshState {
        didSet {
            if state == .idle {
                self.tsSubProtocol?.tsToNormalState?()
            } else if state == .refreshing {
                self.tsSubProtocol?.tsToRefreshingState?()
            } else if state == .pulling {
                self.tsSubProtocol?.tsToPulling?()
            } else if state == .noMoreData {
                self.tsSubProtocol?.tsToNoMoreDataState?()
            }
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
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

open class TSLoadMoreAutoFooter: MJRefreshAutoNormalFooter {
    public var tsSubProtocol: TSLoadMoreProtocol? {
        get { return self as? TSLoadMoreProtocol }
    }
    override open var state: MJRefreshState {
        didSet {
            if state == .idle {
                self.tsSubProtocol?.tsToNormalState?()
            } else if state == .refreshing {
                self.tsSubProtocol?.tsToRefreshingState?()
            } else if state == .pulling {
                self.tsSubProtocol?.tsToPulling?()
            } else if state == .noMoreData {
                self.tsSubProtocol?.tsToNoMoreDataState?()
            }
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
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
