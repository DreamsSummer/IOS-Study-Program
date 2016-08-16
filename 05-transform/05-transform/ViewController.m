//
//  ViewController.m
//  05-transform
//
//  Created by liser on 16/8/15.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIView *tempView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *tempView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    tempView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:tempView];
    
    self.tempView = tempView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//  transform:形变属性：能完成的功能：平移，缩放，旋转
    
    [UIView animateWithDuration:1.0 animations:^{
        self.tempView.transform = CGAffineTransformRotate(self.tempView.transform, M_PI_4);
    }];
    
//    //平移
//    self.tempView.transform = CGAffineTransformMakeTranslation(100, 100);
//    [UIView animateWithDuration:2.0 animations:^{
////        //缩放
////        self.tempView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        //旋转 π
////        self.tempView.transform = CGAffineTransformMakeRotation(M_PI_2);
//        
//        //叠加
//        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
//        
//        CGAffineTransform scaleRotation = CGAffineTransformScale(transform, 0.5, 0.5);
//        
//        self.tempView.transform = CGAffineTransformTranslate(scaleRotation, 100, 100);
//    }];

}

@end
