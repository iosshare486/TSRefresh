//
//  ViewController.swift
//  TSRefresh
//
//  Created by 小铭 on 2018/6/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

import UIKit


class ViewController:UIViewController{
    var scrollView:UIScrollView?
    var refreshHeader:YoukuRefreshHeader?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        setUpScrollView()
        let refreshHeaders = YoukuRefreshHeader()
        self.scrollView?.ts_addRefreshHeaderView(refreshHeader: refreshHeaders, refreshBlock: { [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        })
        self.scrollView?.ts_addLoadMoreFooterView(loadMoreFooter: <#T##GTMLoadMoreFooter?#>, loadMoreBlock: <#T##() -> Void#>)
        
//        self.scrollView?.ts_addRefreshHeaderView {
//            [weak self] in
//            print("excute refreshBlock")
//            self?.refresh()
//        }
//
//        self.scrollView?.ts_addLoadMoreFooterView {
//            [weak self] in
//            print("excute loadMoreBlock")
//            self?.loadMore()
//        }
//
//        // text
//        self.scrollView?.ts_pullDownToRefreshText("亲，试试下拉会刷新的")
//            .ts_releaseToRefreshText("亲，松开试试")
//            .ts_refreshSuccessText("亲，成功了")
//            .ts_refreshFailureText("亲，无果")
//            .ts_refreshingText("亲，正在努力刷新")
//
//
//        self.scrollView?.ts_footerTextColor(.yellow).ts_pullUpToRefreshText("哈哈哈").ts_noMoreDataText("nnnnn").ts_releaseLoadMoreText("撒手试试").ts_loaddingText("正在刷新")
//        // color
//        self.scrollView?.ts_headerTextColor(.red)
//        // icon
//        self.scrollView?.ts_headerIdleImage(UIImage.init(named: "youku_refreshing"))
//        self.scrollView?.ts_headerSucImage(UIImage.init(named: "youku_refreshing"))
//        self.scrollView?.ts_headerFailImage(UIImage.init(named: "youku_refreshing"))
//        self.scrollView?.ts_headerSucImage(UIImage.init(named: "youku_refreshing"))
//        self.scrollView?.ts_isShowLoadMore(isShow: false)
    }
    
    
    // MARK: Test
    func refresh() {
        perform(#selector(endRefresing), with: nil, afterDelay: 3)
    }
    
    @objc func endRefresing() {
        self.scrollView?.ts_endRefreshing(isSuccess: true)
    }
    
    func loadMore() {
        perform(#selector(endLoadMore), with: nil, afterDelay: 3)
    }
    
    @objc func endLoadMore() {
        self.scrollView?.ts_endLoadMore(isNoMoreData: true)
    }
    
    func setUpScrollView(){
        self.scrollView = UIScrollView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
        self.scrollView?.backgroundColor = UIColor.lightGray
        self.scrollView?.center = self.view.center
        self.scrollView?.contentSize = CGSize(width: 300,height: 600)
        self.view.addSubview(self.scrollView!)
    }
}
