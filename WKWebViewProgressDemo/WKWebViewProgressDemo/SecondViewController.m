//
//  SecondViewController.m
//  WKWebViewProgressDemo
//
//  Created by 仁和Mac on 2018/11/1.
//  Copyright © 2018年 AbelZ. All rights reserved.
//

#import "SecondViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewProgress/WKWebView+CJCategory.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    CJGradientProgressView *progressView = [[CJGradientProgressView alloc] init];
    //progressView.startColor = [UIColor grayColor];
    //progressView.endColor   = [UIColor redColor];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)];
    webView.gradientProgressView = progressView;
    webView.allowsBackForwardNavigationGestures = YES;
    [webView loadRequest:req];
    [self.view addSubview:webView];
}

@end
