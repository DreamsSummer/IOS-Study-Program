//
//  ViewController.m
//  01-切换文字颜色-第一个iOS程序
//
//  Created by xiaomage on 15/5/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#pragma mark 类扩展:可以扩充属性和方法声明
@interface ViewController()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

#pragma mark 监听红色按钮点击
- (IBAction)redClick
{
    // 改变文字颜色
    self.label.textColor = [UIColor redColor];
    // 改变文字
    self.label.text = @"我是红色文字";
    // 设置字体
    self.label.font = [UIFont systemFontOfSize:20];
}

#pragma mark 监听绿色按钮点击
- (IBAction)greenClick
{
    // 改变文字颜色
    self.label.textColor = [UIColor greenColor];
    // 改变文字
    self.label.text = @"我是绿色文字";
    // 设置字体
    self.label.font = [UIFont systemFontOfSize:30];
}

#pragma mark 监听蓝色按钮点击
- (IBAction)blueClick
{
    // 改变文字颜色
    self.label.textColor = [UIColor blueColor];
    // 改变文字
    self.label.text = @"我是蓝色文字";
    // 设置字体
    self.label.font = [UIFont systemFontOfSize:40];
}

@end
