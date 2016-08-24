//
//  ViewController.m
//  UI进阶-私人通讯录-01设置导航条的内容
//
//  Created by liser on 16/8/23.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




//  viewDidLoad在控制器的view加载完成的时候调用，通常情况下这个方法只会掉用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //设置导航条的内容
    
    
    //设置中间的文字标题
//    self.navigationController.navigationItem.title = @"首页";
//    self.navigationItem.title = @"首页";
    
    
//    设置中间的view
//    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    self.title = @"首页";
    
//    设置导航条左边按钮
//    在IOS7之后默认会把导航条上面的按钮渲染成蓝色
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左边按钮" style:0 target:self action:@selector(btnClick)];
    
    
    //设置导航条右边的按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    
    //通过代码告诉苹果不要渲染图片
    UIImage *image = [UIImage imageNamed:@"navigationbar_friendsearch"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    
    //导航条上面的内容位置不能由开发者决定，开发者只能控制尺寸
    
//    btn.frame = CGRectMake(2000, 3000, 30, 30);
    
    //控件的尺寸由图片决定
    //仅仅是设置尺寸
    [btn sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
}


/*
 
 只要以后看到Item，一般都是苹果提供的模型。
 UIBarButtonItem:控制导航条上面按钮的内容
 UINavigationItem：控制导航条的内容
*/


-(void)btnClick{
    NSLog(@"btnClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
