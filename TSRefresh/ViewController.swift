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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        setUpScrollView()
        
        
//        let refreshHeaders = YoukuRefreshHeader()
//        self.scrollView?.ts_addRefreshAction(refreshHeader: refreshHeaders, refreshBlock: { [weak self] in
//            print("excute refreshBlock")
//            self?.refresh()
//        })
//        self.scrollView?.ts_addLoadMoreFooterView(loadMoreFooter: <#T##GTMLoadMoreFooter?#>, loadMoreBlock: <#T##() -> Void#>)
        
//        self.scrollView?.ts_addRefreshHeaderView {
//            [weak self] in
//            print("excute refreshBlock")
//            self?.refresh()
//        }
//        self.scrollView?.ts_addRefreshAction {
//
//        }
//
        
        self.scrollView?.ts_refreshingTextFontAndColor(UIFont.systemFont(ofSize: 20), color: .red)
        
        self.scrollView?.ts_refreshingText("正在刷洗哦")
        self.scrollView?.ts_loaddingText("lalalalalall").ts_noMoreDataText("meiyoule").ts_loadTextFontAndColor(UIFont.systemFont(ofSize: 25), color: .yellow).ts_releaseLoadMoreText("hahahah")
        self.scrollView?.ts_addRefreshAction({
            self.refresh()
        }).ts_addLoadMoreAction({
            self.loadMore()
        })
        self.scrollView?.ts_addRefreshAction(<#T##refreshBlock: (() -> Void)!##(() -> Void)!##() -> Void#>, headerView: <#T##MJRefreshHeader!#>)
        self.scrollView?.ts_pullDown(toRefreshText: "123")
//        self.scrollView?.ts_addRefreshAction { [weak self] in
//            self?.refresh()
//            }.ts_refreshingImage(UIImage.init(named: "xiala")).ts_releaseLoadMoreText("hahaahhahah").ts_loadTextFontAndColor(UIFont.systemFont(ofSize: 16), UIColor.yellow).ts_noMoreDataText("这里没有数据了 还刷")
//        self.scrollView?.ts_triggerRefreshing()
        
        
//        self.scrollView?.ts_addRefreshAction {
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
//        self.scrollView?.ts_headerIdleImage(#imageLiteral(resourceName: "xiala"))
//        self.scrollView?.ts_headerSucImage(#imageLiteral(resourceName: "success.png"))
//        self.scrollView?.ts_headerPullingIndicatorImage(UIImageView(image: #imageLiteral(resourceName: "songkai")))
        
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
        self.scrollView?.ts_endRefreshingAndLoading(false)
    }
    
    func loadMore() {
        perform(#selector(endLoadMore), with: nil, afterDelay: 3)
    }
    
    @objc func endLoadMore() {
        self.scrollView?.ts_endRefreshingAndLoading(true)
    }
    
    func setUpScrollView(){
        self.scrollView = UIScrollView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
        self.scrollView?.backgroundColor = UIColor.blue
        self.scrollView?.center = self.view.center
        self.scrollView?.contentSize = CGSize(width: 300,height: 600)
        self.view.addSubview(self.scrollView!)
    }
}
