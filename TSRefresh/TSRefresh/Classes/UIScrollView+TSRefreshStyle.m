//
//  UIScrollView+TSRefreshStyle.m
//  TSRefresh
//
//  Created by 小铭 on 2018/8/21.
//  Copyright © 2018年 caiqr. All rights reserved.
//

#import "UIScrollView+TSRefreshStyle.h"
#import "MJRefresh.h"

@implementation UIScrollView (TSRefreshStyle)

#pragma mark - TSCustomKey
static const NSString * TSRefreshPullDownNameKey = @"TSRefreshPullDownNameKey";
static const NSString * TSReleaseToRefreshTextNameKey = @"TSReleaseToRefreshTextNameKey";
static const NSString * TSRefreshingTextNameKey = @"TSRefreshingTextNameKey";
static const NSString * TSRefreshTextFontNameKey = @"TSRefreshTextFontNameKey";
static const NSString * TSRefreshTextColorNameKey = @"TSRefreshTextColorNameKey";

static const NSString * TSRefreshStatusTextHiddenStatusNameKey = @"TSRefreshStatusTextHiddenStatusNameKey";
static const NSString * TSRefreshTimeTextHiddenStatusNameKey = @"TSRefreshTimeTextHiddenStatusNameKey";
static const NSString * TSRefreshPullImageNameKey = @"TSRefreshPullImageNameKey";
//footer
static const NSString * TSPullNormalTextNameKey = @"TSPullNormalTextNameKey";
static const NSString * TSPullNoMoreDataTextNameKey = @"TSPullNoMoreDataTextNameKey";
static const NSString * TSPullLoaddingTextNameKey = @"TSPullLoaddingTextNameKey";
static const NSString * TSPullReleaseLoadMoreNameKey = @"TSPullReleaseLoadMoreNameKey";
static const NSString * TSPullLoadTextColorNameKey = @"TSPullLoadTextColorNameKey";
static const NSString * TSPullLoadTextFontNameKey = @"TSPullLoadTextFontNameKey";
static const NSString * TSPullImageNameKey = @"TSPullImageNameKey";

/**
 是不是下拉刷新中

 @return <#return value description#>
 */
- (BOOL)ts_headerIsRefreshing {
    if (!self.mj_header) {
        return NO;
    }
    return self.mj_header.isRefreshing;
}

/**
 上拉加载 是不是下拉刷新中

 @return <#return value description#>
 */
- (BOOL)ts_footerIsRefreshing {
    if (!self.mj_footer) {
        return NO;
    }
    return self.mj_footer.isRefreshing;
}

- (void)setNormalText:(NSString *)normalText
{
    if (normalText != self.normalText) {
        // 删除旧的，添加新的
        if (self.mj_header != nil) {
            [(MJRefreshStateHeader *)self.mj_header setTitle:normalText forState:MJRefreshStateIdle];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshPullDownNameKey,
                                 normalText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)normalText
{
    return objc_getAssociatedObject(self, &TSRefreshPullDownNameKey);
}
/**
 下拉松手时文字
 */

- (void)setReleaseToRefreshText:(NSString *)releaseToRefreshText
{
    if (releaseToRefreshText != self.releaseToRefreshText) {
        // 删除旧的，添加新的
        if (self.mj_header != nil) {
            [(MJRefreshStateHeader *)self.mj_header setTitle:releaseToRefreshText forState:MJRefreshStatePulling];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSReleaseToRefreshTextNameKey,
                                 releaseToRefreshText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)releaseToRefreshText
{
    return objc_getAssociatedObject(self, &TSReleaseToRefreshTextNameKey);
}

/**
    刷新时文字
 */

- (void)setRefreshingText:(NSString *)refreshingText
{
    if (refreshingText != self.refreshingText) {
        // 删除旧的，添加新的
        if (self.mj_header != nil) {
            [(MJRefreshStateHeader *)self.mj_header setTitle:refreshingText forState:MJRefreshStateRefreshing];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshingTextNameKey,
                                 refreshingText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)refreshingText
{
    return objc_getAssociatedObject(self, &TSRefreshingTextNameKey);
}

/**
 刷新时文字字体
 */

- (void)setRefreshTextFont:(UIFont *)refreshTextFont
{
    if (refreshTextFont != self.refreshTextFont) {
        // 删除旧的，添加新的

        if (self.mj_header != nil) {
            ((MJRefreshStateHeader *)self.mj_header).stateLabel.font = refreshTextFont;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshTextFontNameKey,
                                 refreshTextFont, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIFont *)refreshTextFont
{
    return objc_getAssociatedObject(self, &TSRefreshTextFontNameKey);
}

/**
 刷新文字颜色
 */

- (void)setRefreshTextColor:(UIColor *)refreshTextColor
{
    if (refreshTextColor != self.refreshTextColor) {
        if (self.mj_header != nil) {
            ((MJRefreshStateHeader *)self.mj_header).stateLabel.textColor = refreshTextColor;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshTextColorNameKey,
                                 refreshTextColor, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIColor *)refreshTextColor
{
    return objc_getAssociatedObject(self, &TSRefreshTextColorNameKey);
}

/** 隐藏刷新状态文字 */
- (void)setRefreshStatusTextHiddenStatus:(BOOL )refreshStatusTextHiddenStatus
{
    if (refreshStatusTextHiddenStatus != self.refreshStatusTextHiddenStatus) {

        if (self.mj_header != nil) {
            ((MJRefreshStateHeader *)self.mj_header).stateLabel.hidden = refreshStatusTextHiddenStatus;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshStatusTextHiddenStatusNameKey,
                                 @(refreshStatusTextHiddenStatus), OBJC_ASSOCIATION_RETAIN);
    }
}
- (BOOL)refreshStatusTextHiddenStatus
{
    return objc_getAssociatedObject(self, &TSRefreshStatusTextHiddenStatusNameKey);
}

/** 隐藏刷新时间文字 */
- (void)setRefreshTimeTextHiddenStatus:(BOOL )refreshTimeTextHiddenStatus
{
    if (refreshTimeTextHiddenStatus != self.refreshTimeTextHiddenStatus) {
        // 删除旧的，添加新的
        if (self.mj_header != nil) {
            ((MJRefreshStateHeader *)self.mj_header).lastUpdatedTimeLabel.hidden = refreshTimeTextHiddenStatus;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshTimeTextHiddenStatusNameKey,
                                 @(refreshTimeTextHiddenStatus), OBJC_ASSOCIATION_RETAIN);
    }
}
- (BOOL)refreshTimeTextHiddenStatus
{
    return objc_getAssociatedObject(self, &TSRefreshTimeTextHiddenStatusNameKey);
}

- (void)setRefreshPullImage:(UIImage *)refreshPullImage
{
    if (refreshPullImage != self.refreshPullImage) {
        // 删除旧的，添加新的
        if (self.mj_header != nil) {
            ((MJRefreshNormalHeader *)self.mj_header).arrowView.image = refreshPullImage;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSRefreshPullImageNameKey,
                                 refreshPullImage, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIImage *)refreshPullImage
{
    return objc_getAssociatedObject(self, &TSRefreshPullImageNameKey);
}

- (void)configCustom {
    if (self.normalText) {
        [(MJRefreshStateHeader *)self.mj_header setTitle:self.normalText forState:MJRefreshStateIdle];
    }
    if (self.releaseToRefreshText) {
        [(MJRefreshStateHeader *)self.mj_header setTitle:self.releaseToRefreshText forState:MJRefreshStatePulling];
    }
    if (self.refreshingText) {
        [(MJRefreshStateHeader *)self.mj_header setTitle:self.refreshingText forState:MJRefreshStateRefreshing];
    }
    if (self.refreshTextFont) {
        ((MJRefreshStateHeader *)self.mj_header).stateLabel.font = self.refreshTextFont;
    }
    if (self.refreshTextColor) {
        ((MJRefreshStateHeader *)self.mj_header).stateLabel.textColor = self.refreshTextColor;
    }
    if (self.refreshStatusTextHiddenStatus) {
        ((MJRefreshStateHeader *)self.mj_header).stateLabel.hidden = self.refreshStatusTextHiddenStatus;
    }
    if (self.refreshTimeTextHiddenStatus) {
        ((MJRefreshStateHeader *)self.mj_header).lastUpdatedTimeLabel.hidden = self.refreshTimeTextHiddenStatus;
    }
    if (self.refreshPullImage) {
        ((MJRefreshNormalHeader *)self.mj_header).arrowView.image = self.refreshPullImage;
    }
    //footer
    if (self.pullNormalText) {
        [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:self.pullNormalText forState:MJRefreshStateIdle];
    }
    if (self.pullNoMoreDataText) {
        [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:self.pullNoMoreDataText forState:MJRefreshStateNoMoreData];
    }
    if (self.pullLoaddingText) {
        [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:self.pullLoaddingText forState:MJRefreshStateRefreshing];
    }
    if (self.pullReleaseLoadMore) {
        [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:self.pullReleaseLoadMore forState:MJRefreshStatePulling];
    }
    if (self.pullLoadTextColor) {
        ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.textColor = self.pullLoadTextColor;
    }
    if (self.pullLoadTextFont) {
        ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.font = self.pullLoadTextFont;
    }
    if (self.pullImageName) {
        ((MJRefreshBackNormalFooter *)self.mj_footer).arrowView.image = self.pullImageName;
    }
    
}

/**
 下拉默认文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullDownToRefreshText:(NSString *)text {
    self.normalText = text;
    return self;
}

/**
 下拉松手时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseToRefreshText:(NSString *)text {
    self.releaseToRefreshText = text;
    return self;
}

/**
 刷新时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingText:(NSString *)text {
    self.refreshingText = text;
    return self;
}

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingTextFontAndColor:(UIFont *)font color:(UIColor *)color  {
    self.refreshTextFont = font;
    self.refreshTextColor = color;
    return self;
}

/**
 隐藏时间
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingStatusTextAndTimeStatusText:(BOOL)hiddenStatus hiddenTime:(BOOL)hiddenTime {
    self.refreshTimeTextHiddenStatus = hiddenTime;
    self.refreshStatusTextHiddenStatus = hiddenStatus;
    return self;
}

/**
 修改下拉刷新剪头图片
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingImage:(UIImage *)image {
    self.refreshPullImage = image;
    return self;
}

//MARK: - 自定义 footer 文字


- (void)setPullNormalText:(NSString *)pullNormalText
{
    if (pullNormalText != self.pullNormalText) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:pullNormalText forState:MJRefreshStateIdle];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullNormalTextNameKey,
                                 pullNormalText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)pullNormalText
{
    return objc_getAssociatedObject(self, &TSPullNormalTextNameKey);
}


- (void)setPullNoMoreDataText:(NSString *)pullNoMoreDataText
{
    if (pullNoMoreDataText != self.pullNoMoreDataText) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:pullNoMoreDataText forState:MJRefreshStateNoMoreData];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullNoMoreDataTextNameKey,
                                 pullNoMoreDataText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)pullNoMoreDataText
{
    return objc_getAssociatedObject(self, &TSPullNoMoreDataTextNameKey);
}

- (void)setPullLoaddingText:(NSString *)pullLoaddingText
{
    if (pullLoaddingText != self.pullLoaddingText) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:pullLoaddingText forState:MJRefreshStateRefreshing];
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullLoaddingTextNameKey,
                                 pullLoaddingText, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)pullLoaddingText
{
    return objc_getAssociatedObject(self, &TSPullLoaddingTextNameKey);
}

- (void)setPullReleaseLoadMore:(NSString *)pullReleaseLoadMore
{
    if (pullReleaseLoadMore != self.pullReleaseLoadMore) {
        // 删除旧的，添加新的
            [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:pullReleaseLoadMore forState:MJRefreshStatePulling];
        if (self.mj_footer != nil) {
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullReleaseLoadMoreNameKey,
                                 pullReleaseLoadMore, OBJC_ASSOCIATION_RETAIN);
    }
}
- (NSString *)pullReleaseLoadMore
{
    return objc_getAssociatedObject(self, &TSPullReleaseLoadMoreNameKey);
}

- (void)setPullLoadTextColor:(UIColor *)pullLoadTextColor
{
    if (pullLoadTextColor != self.pullLoadTextColor) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.textColor = pullLoadTextColor;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullLoadTextColorNameKey,
                                 pullLoadTextColor, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIColor *)pullLoadTextColor
{
    return objc_getAssociatedObject(self, &TSPullLoadTextColorNameKey);
}

- (void)setPullLoadTextFont:(UIFont *)pullLoadTextFont
{
    if (pullLoadTextFont != self.pullLoadTextFont) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.font = pullLoadTextFont;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullLoadTextFontNameKey,
                                 pullLoadTextFont, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIFont *)pullLoadTextFont
{
    return objc_getAssociatedObject(self, &TSPullLoadTextFontNameKey);
}

- (void)setPullImageName:(UIImage *)pullImageName
{
    if (pullImageName != self.pullImageName) {
        // 删除旧的，添加新的
        if (self.mj_footer != nil) {
            ((MJRefreshBackNormalFooter *)self.mj_footer).arrowView.image = pullImageName;
        }
        // 存储新的
        objc_setAssociatedObject(self, &TSPullImageNameKey,
                                 pullImageName, OBJC_ASSOCIATION_RETAIN);
    }
}
- (UIImage *)pullImageName
{
    return objc_getAssociatedObject(self, &TSPullImageNameKey);
}


/**
 设置下拉刷新默认状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullUpToRefreshText:(NSString *)text {
    self.pullNormalText = text;
    return self;
}

/**
 下拉刷新时状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loaddingText:(NSString *)text {
    self.pullLoaddingText = text;
    return self;
}


/**
 无数据文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_noMoreDataText:(NSString *)text {
    self.pullNoMoreDataText = text;
    return self;
}

/**
 释放将刷新文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseLoadMoreText:(NSString *)text {
    self.pullReleaseLoadMore = text;
    return self;
}

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadTextFontAndColor:(UIFont *)font color:(UIColor *)color {
    self.pullLoadTextColor = color;
    self.pullLoadTextFont = font;
    return self;
}

/**
 <#Description#>
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadingImage:(UIImage *)image {
    if ([self.mj_footer isKindOfClass: [MJRefreshBackNormalFooter class]]) {
        self.pullImageName = image;
    } 
    return self;
}

@end
