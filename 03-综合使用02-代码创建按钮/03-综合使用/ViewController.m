//
//  ViewController.m
//  03-综合使用
//
//  Created by xiaomage on 15/5/25.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addButtonWithImage:@"add" highImage:@"add_highlighted" disableImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) tag:10 action:@selector(add)];
    [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disableImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) tag:20 action:@selector(remove)];
}

#pragma mark 添加按钮
- (void)addButtonWithImage:(NSString *)image highImage:(NSString *)highImage disableImage:(NSString *)disableImage frame:(CGRect)frame tag:(NSInteger)tag action:(SEL)action
{
    // 创建按钮
    UIButton *btn = [[UIButton alloc] init];
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    // 设置位置和尺寸
    btn.frame = frame;
    // 监听按钮点击
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    // 绑定tag标记
    btn.tag = tag;
    // 添加按钮
    [self.view addSubview:btn];
}

#pragma mark 添加
- (void)add
{
    // 添加图片
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"danjianbao"];
    iconView.frame = CGRectMake(0, 0, 50, 50);
    [self.shopsView addSubview:iconView];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.text = @"单肩包";
    label.frame = CGRectMake(0, 50, 50, 20);
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [self.shopsView addSubview:label];
}

#pragma mark 删除
- (void)remove
{
    NSLog(@"删除。。。。");
}

- (void)click:(UIButton *)btn
{
    if (btn.tag == 10) {
        NSLog(@"添加");
    } else {
        NSLog(@"删除");
    }
}

@end
