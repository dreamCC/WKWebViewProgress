//
//  CJGradientProgressView.h
//  CommonProject
//
//  Created by 仁和Mac on 2017/5/28.
//  Copyright © 2017年 zhucj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJGradientProgressView : UIControl

@property(nonatomic,weak, readonly) CALayer *gradientLayer;

/// 开始的颜色。 默认[UIColor grayColor]
@property(nonatomic, strong) UIColor *startColor;

/// 结束的颜色。默认[UIColor whiteColor]  颜色分布格式：A B A的形式
@property(nonatomic, strong) UIColor *endColor;

/// 进度。 默认0.5f
@property(nonatomic, assign) CGFloat progress;

@end

