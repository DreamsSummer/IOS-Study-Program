//
//  XJEditViewController.h
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/26.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJContant.h"

//Block别名的命名一般以类名开头
//定义一个Block的类型别名
typedef void(^XJEditViewControllerBlock)();

@interface XJEditViewController : UIViewController


@property(nonatomic,strong)XJContant *contact;

@property(nonatomic,strong)XJEditViewControllerBlock block;
@end
