//
//  ViewController.m
//  UI进阶-控制器创建-09控制器View懒加载
//
//  Created by liser on 16/8/23.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//在viewDidLoad中打印控制器的尺寸不准确，通常在viewDidAppear
//如果控制器是窗口的根控制器，就不需要设置窗口的尺寸


//控制器的View加载完成的时候调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
