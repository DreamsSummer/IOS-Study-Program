//
//  ViewController.m
//  UI进阶-控制器的创建-07控制器View的创建
//
//  Created by liser on 16/8/22.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//加载控制器的view
//loadView的作用：自定义控制器的view
//loadView的调用时刻：第一次使用控制器的view的时候调用，一定不要这样写，多此一举

//注意：这个方法中没有自定义view，就不能获取控制器的view

//一旦重写了这个方法，就不要调用[super loadView]
//如果重写了这个方法，就不会去加载storyboard描述的控制器的view
-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
