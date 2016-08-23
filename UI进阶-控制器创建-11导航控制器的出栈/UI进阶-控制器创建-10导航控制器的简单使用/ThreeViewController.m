//
//  ThreeViewController.m
//  UI进阶-控制器创建-10导航控制器的简单使用
//
//  Created by liser on 16/8/23.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

//返回到上一个控制器
- (IBAction)backtopre:(id)sender {
    
    //pop控制器不是马上把控制器销毁，而是等待动画完成后销毁
    [self.navigationController popViewControllerAnimated:YES];
}


//返回到根控制器
- (IBAction)backtoroot:(id)sender {
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //这个方法只能返回到栈里面的控制器
    [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
