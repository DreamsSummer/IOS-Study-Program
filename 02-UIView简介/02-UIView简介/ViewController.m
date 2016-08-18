//
//  ViewController.m
//  02-UIView简介
//
//  Created by xiaomage on 15/5/25.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

// 控制器的view加载完毕时调用
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@", self.label.superview);
//    NSLog(@"%@", self.view.subviews);
    
//    self.view.frame.origin.x == 100;
//    self.view.frame.origin.y == 90;
//    self.view.frame.size.width;
//    self.view.frame.size.height;
    
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
}

- (IBAction)btnClick {
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = [UIColor orangeColor];
    tempView.frame = CGRectMake(275, 567, 100, 100);
    [self.view addSubview:tempView];
    
//    UISwitch *s = [[UISwitch alloc] init];
//    UIStepper *stepper = [[UIStepper alloc] init];
//    [self.view addSubview:stepper];
//    [self.view addSubview:s];
//
//    UISlider *slider = [[UISlider alloc] init];
//    [self.view insertSubview:slider belowSubview:s];
//    [self.view insertSubview:slider aboveSubview:stepper];
//
//    NSLog(@"before --- %@", self.view.subviews);
//
//
//    NSLog(@"after --- %@", self.view.subviews);
    
//    [self.label removeFromSuperview];
//    
//    [[self.view viewWithTag:99] removeFromSuperview];
}

@end
