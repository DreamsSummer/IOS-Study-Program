//
//  AppDelegate.m
//  UI进阶-09-UITableBar的简单使用
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置窗口的根控制器
    UITabBarController *tabBarvc = [[UITabBarController alloc]init];
    
    self.window.rootViewController = tabBarvc;
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
//    vc.tabBarItem.title = @"vc1";
    
    
    //设置按钮上面的内容
    vc.tabBarItem.title = @"消息";
    vc.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
    vc.tabBarItem.badgeValue = @"20";
    
    //添加子控制器
    [tabBarvc addChildViewController:vc];
    
    
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor greenColor];
//    vc1.tabBarItem.title = @"vc2";
    
    //设置按钮上面的内容
    vc1.tabBarItem.title = @"联系人";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    
    //添加子控制器
    [tabBarvc addChildViewController:vc1];
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
