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

/**
 下拉默认文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullDownToRefreshText:(NSString *)text {
    [(MJRefreshStateHeader *)self.mj_header setTitle:text forState:MJRefreshStateIdle];
    return self;
}

/**
 下拉松手时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseToRefreshText:(NSString *)text {

    [(MJRefreshStateHeader *)self.mj_header setTitle:text forState:MJRefreshStatePulling];
    return self;
}

/**
 刷新时文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingText:(NSString *)text {
     [(MJRefreshStateHeader *)self.mj_header setTitle:text forState:MJRefreshStateRefreshing];
    return self;
}

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingTextFontAndColor:(UIFont *)font color:(UIColor *)color  {
    ((MJRefreshStateHeader *)self.mj_header).stateLabel.font = font;
    ((MJRefreshStateHeader *)self.mj_header).stateLabel.textColor = color;
    return self;
}

/**
 隐藏时间
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingStatusTextAndTimeStatusText:(BOOL)hiddenStatus hiddenTime:(BOOL)hiddenTime {
    ((MJRefreshStateHeader *)self.mj_header).stateLabel.hidden = hiddenStatus;
    ((MJRefreshStateHeader *)self.mj_header).lastUpdatedTimeLabel.hidden = hiddenTime;
    return self;
}

/**
 修改下拉刷新剪头图片
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_refreshingImage:(UIImage *)image {
     ((MJRefreshNormalHeader *)self.mj_header).arrowView.image = image;
    return self;
}

//MARK: - 自定义 footer 文字

/**
 设置下拉刷新默认状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_pullUpToRefreshText:(NSString *)text {
    [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:text forState:MJRefreshStateIdle];
    return self;
}

/**
 下拉刷新时状态文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loaddingText:(NSString *)text {
    [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:text forState:MJRefreshStateRefreshing];
    return self;
}


/**
 无数据文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_noMoreDataText:(NSString *)text {
    [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:text forState:MJRefreshStateNoMoreData];
    return self;
}

/**
 释放将刷新文字
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_releaseLoadMoreText:(NSString *)text {
    [(MJRefreshBackNormalFooter *)self.mj_footer setTitle:text forState:MJRefreshStatePulling];
    return self;
}

/**
 刷新文字字体和颜色
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadTextFontAndColor:(UIFont *)font color:(UIColor *)color {
    
    ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.font = font;
    ((MJRefreshBackNormalFooter *)self.mj_footer).stateLabel.textColor = color;
    
    return self;
}

/**
 <#Description#>
 
 @param text <#text description#>
 @return <#return value description#>
 */
- (UIScrollView *)ts_loadingImage:(UIImage *)image {
    if ([self.mj_footer isKindOfClass: [MJRefreshBackNormalFooter class]]) {
        ((MJRefreshBackNormalFooter *)self.mj_footer).arrowView.image = image;
    } 
    return self;
}

@end
