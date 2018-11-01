//
//  ViewController.m
//  WKWebViewProgressDemo
//
//  Created by 仁和Mac on 2018/11/1.
//  Copyright © 2018年 AbelZ. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)gotoWebView:(UIButton *)sender {
    
    SecondViewController *secondV  = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondV animated:YES];
}

@end
