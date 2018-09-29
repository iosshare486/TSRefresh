//
//  TSRefreshConfig.h
//  TSRefresh
//
//  Created by 小铭 on 2018/9/29.
//  Copyright © 2018年 caiqr. All rights reserved.
//  下拉刷新和上拉加载 单例配置

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TSRefreshConfig : NSObject

+ (TSRefreshConfig *)shared;

/**
 headerView
 */
@property (nonatomic, strong) NSString *headerViewClass;

/**
 footerView
 */
@property (nonatomic, strong) NSString *footerViewClass;

// 下拉刷新
/**
 默认文字
 */
@property (nonatomic, strong) NSString *pullDownToRefreshText;
/**
 将要释放文字
 */
@property (nonatomic, strong) NSString *releaseToRefreshText;
/**
 刷新中文字
 */
@property (nonatomic, strong) NSString *refreshingText;

/**
 状态字体
 */
@property (nonatomic, strong) UIFont *refreshingTextFont;

/**
 状态字体颜色
 */
@property (nonatomic, strong) UIColor *refreshingTextColor;

/**
 是否隐藏状态文字
 */
@property (nonatomic, readwrite) BOOL hiddenRefreshingStatusText;

/**
 是否隐藏刷新时间文字
 */
@property (nonatomic, readwrite) BOOL hiddenLastTimeText;

/**
 替换箭头图片
 */
@property (nonatomic, strong) UIImage *refreshingImage;

//上拉加载

/**
 默认文字
 */
@property (nonatomic, strong) NSString *pullUpToRefreshText;

/**
 刷新中文字
 */
@property (nonatomic, strong) NSString *loaddingText;

/**
 无数据文字
 */
@property (nonatomic, strong) NSString *noMoreDataText;

/**
 将要释放文字
 */
@property (nonatomic, strong) NSString *releaseLoadMoreText;

/**
 状态文字字体
 */
@property (nonatomic, strong) UIFont *loadTextFont;

/**
 状态文字颜色
 */
@property (nonatomic, strong) UIColor *loadTextColor;

/**
 箭头图片
 */
@property (nonatomic, strong) UIImage *loadingImage;

@end
