//
//  TSCustomFooterNormalView.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/8/20.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit

class TSCustomFooterNormalView: TSRefreshHeader {
    
}

extension TSCustomFooterNormalView : TSRefreshHeaderProtocol {
    
    func tsToPullingState() {
        self.backgroundColor = .red
    }
}



class TSCustomHooterNormalView: TSRefreshHeader {
    
}

extension TSCustomHooterNormalView : TSRefreshHeaderProtocol {
    
    func tsToPullingState() {
        self.backgroundColor = .red
    }
}
