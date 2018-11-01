//
//  CJGradientProgressView.m
//  CommonProject
//
//  Created by 仁和Mac on 2017/5/28.
//  Copyright © 2017年 zhucj. All rights reserved.
//

#import "CJGradientProgressView.h"

static NSString *const kAnimationKey = @"com.kAnimationKey.cn";

@interface CJGradientProgressLayer : CALayer

@end

@implementation CJGradientProgressLayer

-(void)setCornerRadius:(CGFloat)cornerRadius {
    [super setCornerRadius:cornerRadius];
    CALayer *layer     = self.sublayers.firstObject;
    layer.cornerRadius = cornerRadius;
}

@end

@interface CJGradientProgressView () {
    CFTimeInterval _timeOffset;
}

@property(nonatomic,weak, readwrite) CALayer *gradientLayer;

@property(nonatomic, assign, readwrite) BOOL animating;


@end

@implementation CJGradientProgressView

+(Class)layerClass {
    return [CJGradientProgressLayer class];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self didInitializal];
    return self;
}

-(void)didInitializal {
    self.backgroundColor = [UIColor clearColor];
    
    _startColor = [UIColor colorWithRed:208/255.f green:208/255.f blue:208/255.f alpha:1.0];
    _endColor   = [UIColor greenColor];
    _progress   = 0.5f;
}

-(void)didSetupSubLayer {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors     = @[(id)(_startColor.CGColor) ,
                                 (id)(_endColor.CGColor)];
    gradientLayer.locations  = @[ @0 , @1];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint   = CGPointMake(1, 0.5);
    [self.layer addSublayer:gradientLayer];
    _gradientLayer = gradientLayer;
    
    self.layer.cornerRadius = CGRectGetHeight(self.frame) / 3.f;
}

-(void)didMoveToSuperview {
    [self didSetupSubLayer];

    [super didMoveToSuperview];
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _gradientLayer.frame = (CGRect){{0 , 0},{CGRectGetWidth(self.frame) * _progress , CGRectGetHeight(self.frame)}};

}

-(void)setProgress:(CGFloat)progress {
    _progress  = progress;
    if (progress > 1.f) return;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}



@end
