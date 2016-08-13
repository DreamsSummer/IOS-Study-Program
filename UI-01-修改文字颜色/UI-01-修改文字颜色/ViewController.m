//
//  ViewController.m
//  UI-01-修改文字颜色
//
//  Created by liser on 16/7/11.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)IBOutlet UILabel* label;
@end

@implementation ViewController

-(IBAction)redclick{
    
    //设置颜色
    self.label.textColor = [UIColor redColor];
    
    //设置文本
    self.label.text = @"我是红色文字";
    
    //设置字体大小
    self.label.font = [UIFont systemFontOfSize:30];
}

-(IBAction)blueclick{
    self.label.textColor = [UIColor blueColor];
    self.label.text = @"我是蓝色文字";
    self.label.font = [UIFont systemFontOfSize:20];
}

-(IBAction)greenclick{
    self.label.textColor = [UIColor greenColor];
    self.label.text = @"我是绿色文字";
    self.label.font = [UIFont systemFontOfSize:40];
}

@end
