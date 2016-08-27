//
//  XJAddViewController.h
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/25.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XJContantTableViewController;
@class XJAddViewController,XJContant;


//理由block传值，需要把什么传递出去，就把什么作为参数传递出去，block通常不需要返回值
typedef void(^XJAddViewControllerBlock)(XJContant *contact);

@protocol XJAddViewControllerDelegate <NSObject>


@optional
-(void)AddViewController:(XJAddViewController *)addVC didClickAddBtnWithContact:(XJContant *)contact;

@end



@interface XJAddViewController : UIViewController

@property(nonatomic,weak)id<XJAddViewControllerDelegate> delegate;

//@property(nonatomic,strong)XJContantTableViewController *contantVC;

@property(nonatomic,strong)XJAddViewControllerBlock block;

@end
