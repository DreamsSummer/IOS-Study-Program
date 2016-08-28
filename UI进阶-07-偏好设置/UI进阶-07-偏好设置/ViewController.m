//
//  ViewController.m
//  UI进阶-07-偏好设置
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//偏好设置存储
//1.好处:1.不需要关心文件名
//2.快速的做键值对存储

//底层：就是封装了一个字典
- (IBAction)save:(id)sender {
    
    //只要是偏好设置，就需要先拿到NSUserDefaults，使用它做操作
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:@"xj" forKey:@"account"];
    [userDefaults setObject:@"123" forKey:@"password"];
    [userDefaults setBool:YES forKey:@"remberPwd"];
    
    
    //在IOS7之前,默认不会马上根硬盘同步
    //所以在IOS7之前要做一次同步
    [userDefaults synchronize];
    
}


- (IBAction)read:(id)sender {
    
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:@"remberPwd"];
    
    NSLog(@"%@",password);
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
