//
//  ViewController.m
//  01-代码实现自动布局
//
//  Created by liser on 16/8/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *blueView = [[UIView alloc]init];
    //不要将AutoresizingMask转为Autolayout约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.backgroundColor = [UIColor blueColor];
    //blueView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:blueView];
    
    //不要将AutoresizingMask转为Autolayout约束
    UIView *redView = [[UIView alloc]init];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    //blueView.frame = CGRectMake(100,  100, 100, 100);
    [self.view addSubview:redView];
    
    /**蓝色控件的约束*/
    
    //添加高度约束：40
    NSLayoutConstraint *HeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [blueView addConstraint:HeightConstraint];
    
    //添加左边约束:blueView的左边距离父控件的左边有10的间距
    NSLayoutConstraint *LeftConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    
    [self.view addConstraint:LeftConstraint];
    
    //添加右边约束:blueView的右边距离父控件的右边有10的间距
    NSLayoutConstraint *RightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    
    [self.view addConstraint:RightConstraint];
    
    
    //添加顶部约束，blueView的顶部距离父控件的顶部有10的间距
    NSLayoutConstraint *TopConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:TopConstraint];
    
    
    
    
    /**红色约束*/
    //添加高度约束：和蓝色等高
    NSLayoutConstraint *HeightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:HeightConstraint2];
    
    
    //添加左边约束:redView的左边距离和父控件的中线相等
    NSLayoutConstraint *LeftConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:LeftConstraint2];
    
    
    //添加顶部约束，redView的顶部距离blueView的底部有20的间距
    NSLayoutConstraint *TopConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:TopConstraint2];
    
    //添加右边约束:redView的右边距离blueView的右边间距为0
    NSLayoutConstraint *RightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:RightConstraint2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 宽度高度为100，粘着父控件的右下角
 */
-(void)test{
    UIView *blueView = [[UIView alloc]init];
    
    //不要将AutoresizingMask转为Autolayout约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    blueView.backgroundColor = [UIColor blueColor];
    
    blueView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:blueView];
    
    //添加宽度约束
    NSLayoutConstraint *WidthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:300];
    [blueView addConstraint:WidthConstraint];
    
    
    //添加高度约束
    NSLayoutConstraint *HeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [blueView addConstraint:HeightConstraint];
    
    
    //添加右边约束:blueView的右边距离父控件的右边有10的间距
    NSLayoutConstraint *RightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    [self.view addConstraint:RightConstraint];
    
    
    //添加底部约束，blueView的底部距离父控件的底部有10的间距
    NSLayoutConstraint *buttomConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.view addConstraint:buttomConstraint];

}


/**
 设置宽度，高度为父控件的一半，位置在父控件中垂直、水平居中
 */
-(void)test2{
    UIView *blueView = [[UIView alloc]init];
    
    //不要将AutoresizingMask转为Autolayout约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    blueView.backgroundColor = [UIColor blueColor];
    
    blueView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:blueView];
    
    
    //添加宽度约束：父控件的一半
    NSLayoutConstraint *WidthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:WidthConstraint];
    
    
    //添加高度约束：父控件的一半
    NSLayoutConstraint *HeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.view addConstraint:HeightConstraint];
    
    
    //水平居中
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:centerXConstraint];
    
    //垂直居中
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerYConstraint];
}

@end
