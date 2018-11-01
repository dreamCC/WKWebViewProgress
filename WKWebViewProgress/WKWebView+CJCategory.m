//
//  WKWebView+CJCategory.m
//  CJModule
//
//  Created by 仁和Mac on 2017/10/31.
//  Copyright © 2017年 zhucj. All rights reserved.
//

#import "WKWebView+CJCategory.h"
#import <objc/runtime.h>

@implementation WKWebView (CJCategory)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        SEL org_sel = @selector(layoutSubviews);
        SEL swz_sel = @selector(cj_layoutSubviews);
        Method org_method = class_getInstanceMethod(cls, org_sel);
        Method swz_method = class_getInstanceMethod(cls, swz_sel);
        IMP org_imp = method_getImplementation(org_method);
        IMP swz_imp = method_getImplementation(swz_method);
        BOOL isAdd = class_addMethod(cls, org_sel, swz_imp, method_getTypeEncoding(swz_method));
        if (isAdd) {
            class_replaceMethod(cls, swz_sel, org_imp, method_getTypeEncoding(org_method));
        }else {
            method_exchangeImplementations(org_method, swz_method);
        }
        
    });
}

-(void)cj_layoutSubviews {
    [self cj_layoutSubviews];
    if (self.gradientProgressView) {
        CGFloat gradientProgressViewH   = CGRectGetHeight(self.gradientProgressView.frame)?:4;
        self.gradientProgressView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), gradientProgressViewH);
    }
}

static char kObj_gradientProgressView;
-(void)setGradientProgressView:(CJGradientProgressView *)gradientProgressView {
    if (!gradientProgressView) return;
    if (self.gradientProgressView) {
        [self.gradientProgressView removeFromSuperview];
    }
    objc_setAssociatedObject(self, &kObj_gradientProgressView, gradientProgressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addSubview:gradientProgressView];
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

-(CJGradientProgressView *)gradientProgressView {
    return objc_getAssociatedObject(self, &kObj_gradientProgressView);
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat progressValue = [change[NSKeyValueChangeNewKey] floatValue];
        self.gradientProgressView.progress = progressValue;
        if (progressValue == 1.f) {
            [UIView animateWithDuration:0.8f animations:^{
                self.gradientProgressView.alpha = 0.f;
            } completion:^(BOOL finished) {
                [self.gradientProgressView removeFromSuperview];
                self.gradientProgressView = nil;
                [self removeObserver:self forKeyPath:@"estimatedProgress"];
            }];
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end


