//
//  ViewController.m
//  UI进阶-控制器的创建-02控制器View的生命周期
//
//  Created by liser on 16/8/23.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//控制器的view加载完成的时候调用
- (void)viewDidLoad {
    
    //super -> UIViewController
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //什么时候需要调用[super viewDidLoad];
    //假设viewController有一个子类Subvc
    
    NSLog(@"%s",__func__);
    
}

//控制器的view即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

-(void)viewDidLayoutSubviews{
    NSLog(@"%s",__func__);
}


-(void)viewWillLayoutSubviews{
    NSLog(@"%s",__func__);
}


//当控制器的view旋转的时候调用
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSLog(@"%s,%@",__func__,NSStringFromCGSize(size));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
