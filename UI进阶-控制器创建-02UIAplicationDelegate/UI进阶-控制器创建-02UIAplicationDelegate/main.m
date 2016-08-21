//
//  main.m
//  UI进阶-控制器创建-02UIAplicationDelegate
//
//  Created by liser on 16/8/21.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


//main函数是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        //字符串转类名
//        NSClassFromString(@"Application");
        
        //NSStringFromClass([AppDelegate class])将类名转换为字符串，1.防止输入错误
        
        //第三个参数：UIApplication
        //第四个参数：AppDelegate :必须要遵守UIApplicationDelegate协议
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

//调用UIApplicationMain

//UIApplicationMain底层实现
/*
1.根据第三个参数提供的类名创建UIApplication对象
2.创建UIApplicationDelegate对象，并且成为UIApplication对象的代理，app.delegate = delegate;
3.开启一个主运行循环，处理事件，保持程序一直运行
4.加载info.plist 并且判断有没有main.storyboard,如果指定，就会去加载
*/

