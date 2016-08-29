//
//  TwoViewController.m
//  UI进阶-01-Modal的简单使用
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

//点击退出Modal的时候调用
- (IBAction)dismiss:(id)sender {
    //modal出谁，谁就有权利dismiss
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [UIView animateWithDuration:0.25 animations:^{
        //清空形变
        self.view.transform =CGAffineTransformMakeTranslation(0, self.view.frame.size.height);
    }];
    
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
