//
//  OneViewController.m
//  UI进阶-控制器创建-10导航控制器的简单使用
//
//  Created by liser on 16/8/23.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击按钮，跳转到第二个控制器
- (IBAction)jumpTwo:(id)sender {
    UIViewController *vc = [[UIViewController alloc]init];
    
    vc.view.backgroundColor = [UIColor yellowColor];
    
    //跳转
    //如果导航控制器调用push,就会把vc添加为导航控制器的子控制器
    [self.navigationController pushViewController:vc animated:YES];
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
