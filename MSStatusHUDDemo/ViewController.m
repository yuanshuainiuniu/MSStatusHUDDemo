//
//  ViewController.m
//  MSStatusHUDDemo
//
//  Created by niuniu on 15/8/14.
//  Copyright (c) 2015年 niuniu. All rights reserved.
//

#import "ViewController.h"
#import "MSStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"添加了log----");
}
- (IBAction)top:(id)sender {
    [MSStatusBarHUD showNewMessage:@"我从上边进来" from:Top];
}
- (IBAction)left:(id)sender {
    [MSStatusBarHUD showNewMessage:@"我从右边进来不能吧没几何画板还好进来不能吧没几何画板还好进来不能吧没几何画板还好吧就不回家几何画板保护环境" from:left];
}
- (IBAction)right:(id)sender {
    [MSStatusBarHUD showNewMessage:@"我从上边进来" from:right];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
