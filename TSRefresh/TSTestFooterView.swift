//
//  TSTestFooterView.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/9/29.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit


class TSTestFooterView: MJRefreshBackStateFooter {

    //状态改变
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                break
            default:
                break
            }
        }
    }
    //准备工作
    override func prepare() {
        super.prepare()
        
    }
    
    //页面布局
    override func placeSubviews() {
        super.placeSubviews()
        
    }
    
}
