//
//  AppDelegate.m
//  UI进阶-控制器创建-02UIAplicationDelegate
//
//  Created by liser on 16/8/21.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//学习代理方法：只需要知道方法什么时候调用，这个方法可以用来干嘛


//app启动完成后调用这个方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s",__func__);
    return YES;
}

//当app失去焦点的时候调用
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//app进入后台的时候调用
//通常用来app突然打断的时候在这个方法中保存需要用到的数据
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


//app进入前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"%s",__func__);
}

//当app获得焦点的时候调用,意味着app可以与用户进行交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//app被关闭的时候调用
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//app接收到内存警告的时候调用
//清空图片缓存
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"%s",__func__);
}

@end
