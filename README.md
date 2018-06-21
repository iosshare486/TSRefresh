# 下拉刷新使用说明

## 集成方法
<pre>
	let scrollView = UIScrollView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
	添加下拉刷新
	scrollView?.ts_addRefreshHeaderView {
            [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        }
   	添加上拉加载 
	scrollView?.ts_addLoadMoreFooterView {
            [weak self] in
            print("excute loadMoreBlock")
            self?.loadMore()
        }
   	停止下拉刷新
	scrollView?.ts_endRefreshing(isSuccess: true)
    
    停止上拉加载
	scrollView?.ts_endLoadMore(isNoMoreData: true)
   	是否显示上拉加载
	scrollView?.ts_isShowLoadMore(isShow: false)
</pre>

## 额外配置

<pre>
	// header配置
	scrollView?.ts_pullDownToRefreshText("亲，试试下拉会刷新的") 未到达刷新点提示文案
            .ts_releaseToRefreshText("亲，松开试试") 超过刷新点提示文案
            .ts_refreshSuccessText("亲，成功了")刷新成功文案
            .ts_refreshFailureText("亲，无果")刷新失败文案
            .ts_refreshingText("亲，正在努力刷新")正在刷新文案
        // color
        self.scrollView?.ts_headerTextColor(.red)文字颜色
        // icon
        self.scrollView?.ts_headerIdleImage(UIImage.init(named: "youku_refreshing")) 未到达刷新点展位图片
        self.scrollView?.ts_headerSucImage(UIImage.init(named: "youku_refreshing")) 刷新成功图片
        self.scrollView?.ts_headerFailImage(UIImage.init(named: "youku_refreshing")) 刷新失败图片
        
    //footer配置
    self.scrollView?.ts_footerTextColor(.yellow). 文字颜色
    ts_pullUpToRefreshText("哈哈哈").		未到达刷新点提示文案
    ts_loaddingText("正在刷新").			正在刷新文案
    ts_noMoreDataText("没有数据啦").		无数据展示文字
    ts_releaseLoadMoreText("撒手试试")	超过刷新点提示文案
    
    self.scrollView?.ts_footerIdleImage(UIImage.init(named: "youku_refreshing"))   未到达刷新点展位图片
</pre>

## Pod
pod 'TSRefresh'