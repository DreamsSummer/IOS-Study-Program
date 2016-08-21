//
//  ViewController.m
//  UI进阶-控制器创建-01UIApplication
//
//  Created by liser on 16/8/21.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    
    //URL：资源路径
    //URL的组成:协议头://域名+路径   协议头：http https file tel
    //打开网页,需要使用应用程序级别的方法
    //苹果可以根据协议头判断用哪个软件打开
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取UIApplication
    UIApplication *applicaiton = [UIApplication sharedApplication];
    
    //隐藏状态栏功能
//    [applicaiton setStatusBarHidden:YES];
    
    [applicaiton setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    

}


//在IOS7以后，状态栏默认由控制器决定
//隐藏状态栏
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}

-(void)application{
    //1.整个App中只有一个UIApplication对象
    
    UIApplication *application = [UIApplication sharedApplication];
    NSLog(@"%p",application);
    
    //2.UIApplication一般用来做一些应用级别的操作（app的提醒框，联网状态，打电话，打开网页，控制状态栏）
    application.applicationIconBadgeNumber = 10;
    
    //创建用户通知
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    //注册用户通知
    [application registerUserNotificationSettings:settings];
    
    
    //设置联网状态
    application.networkActivityIndicatorVisible = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
