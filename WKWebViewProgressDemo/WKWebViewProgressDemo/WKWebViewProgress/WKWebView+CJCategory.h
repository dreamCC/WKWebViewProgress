//
//  WKWebView+CJCategory.h
//  CJModule
//
//  Created by 仁和Mac on 2017/10/31.
//  Copyright © 2017年 zhucj. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "CJGradientProgressView.h"

NS_ASSUME_NONNULL_BEGIN

@interface  WKWebView (CJCategory)

@property(nonatomic,strong,nullable) CJGradientProgressView *gradientProgressView;

@end


NS_ASSUME_NONNULL_END
