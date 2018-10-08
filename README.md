# 下拉刷新使用说明

## 提供功能：添加自定义下拉刷新和上拉加载

## 使用方法
### 1.添加默认刷新与加载
<pre>
	let scrollView = UIScrollView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
	添加默认下拉刷新
	scrollView.ts_addRefreshAction {
            [weak self] in
            print("excute refreshBlock")
        }
   	添加默认上拉加载 
	scrollView.ts_addLoadMoreAcion {
            [weak self] in
            print("excute loadMoreBlock")
        }
</pre>

### 2.添加全局配置刷新与加载
<pre>
	在Delegate内配置TSRefreshConfig的相关属性后，添加方法如下：
	添加全局配置下拉刷新
	scrollView.ts_addSharedRefreshAction({
   		刷新触发         
   })
   添加全局配置上拉加载
	scrollView.ts_addSharedLoadMoreAction({
		加载触发
   })
</pre>

### 3.停止刷新与加载、隐藏刷新与加载

<pre>
	停止下拉刷新和停止上拉加载
	scrollView.ts_endRefreshingAndLoading(false)
   	是否显示上拉加载
	scrollView.ts_isShowLoadMore(isShow: false)
	是否显示下拉刷新
	scrollView.ts_isShowRefresh(true)
</pre>

## API说明
### 1.默认下拉刷新和加载样式配置API
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

### 2.全局配置API 
<pre>
TSRefreshConfig全局配置API
/** headerView */
TSRefreshConfig.shared().headerView

/** footerView */ 
TSRefreshConfig.shared().footerView

// 下拉刷新
/** 默认文字 */
TSRefreshConfig.shared().pullDownToRefreshText
/** 将要释放文字 */
TSRefreshConfig.shared().releaseToRefreshText
/** 刷新中文字 */
TSRefreshConfig.shared().refreshingText
/** 状态字体 */
TSRefreshConfig.shared().refreshingTextFont
/** 状态字体颜色 */
TSRefreshConfig.shared().refreshingTextColor
/** 是否隐藏状态文字 */
 TSRefreshConfig.shared().hiddenRefreshingStatusText
/** 是否隐藏刷新时间文字 */
TSRefreshConfig.shared().hiddenLastTimeText
/** 替换箭头图片 */
 TSRefreshConfig.shared().refreshingImage
//上拉加载
/** 默认文字 */
TSRefreshConfig.shared().pullUpToRefreshText
/** 刷新中文字 */
TSRefreshConfig.shared().loaddingText
/** 无数据文字 */
TSRefreshConfig.shared().noMoreDataText
/** 将要释放文字 */
TSRefreshConfig.shared().releaseLoadMoreText
/** 状态文字字体 */
TSRefreshConfig.shared().loadTextFont
/** 状态文字颜色 */
TSRefreshConfig.shared().loadTextColor
/** 箭头图片 */
TSRefreshConfig.shared().loadingImage
</pre>

## 自定义下拉刷新和上拉加载
### 1.自定义Headerview
<pre>
	//header配置
	class TSTestNormalHeaderView: MJRefreshStateHeader {
    override func placeSubviews() {
        super.placeSubviews()
        //页面布局
    }
    override var state: MJRefreshState {
        didSet {
            //不同状态的控制代码
        }
    }
    override func prepare() {
        super.prepare()
        //准备工作
        //根据需要隐藏MJ的View和创建自己的View
        //根据需要设置View的高度
        self.mj_h = 100
    }
}
</pre>
### 2.自定义Footerview
<pre>
	//footer配置
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
        //根据需要隐藏MJ的View和创建自己的View
        //根据需要设置View的高度
    }
    
    //页面布局
    override func placeSubviews() {
        super.placeSubviews()
    }   
}
</pre>
## Pod
pod 'TSRefresh'
