//
//  ViewController.m
//  UI进阶-01-Modal的简单使用
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIViewController *two;

@end

@implementation ViewController


//注意：以后想要把一个控制器的view添加到自己的控制器上面显示出来，一定要保证这个控制器不要被销毁
//保证控制器的view在，你的控制器也要在
//点击modal的时候调用
- (IBAction)Modal:(id)sender {
    
    UIViewController *vc = [[TwoViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
    
    //Modal一个控制器
    //谁modal控制器，谁也有权利dismiss
    //模仿Modal效果，Modal出来的控制器添加到窗口上面
    //开发经验:以后一个控件只要想显示到最前面，就添加到窗口上面
    
    //获取窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:vc.view];
    //让控制器的view向下平移一个控制器的高度
    vc.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
    
    [UIView animateWithDuration:0.25 animations:^{
        //清空形变
        vc.view.transform = CGAffineTransformIdentity;
    }];
    
    //强引用Modal出来的控制器
    self.two = vc;
    
    
//    [self presentViewController:vc animated:YES completion:nil];
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
