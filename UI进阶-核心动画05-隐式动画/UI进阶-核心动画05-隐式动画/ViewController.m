//
//  ViewController.m
//  UI进阶-核心动画05-隐式动画
//
//  Created by liser on 16/9/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property(nonatomic,weak)CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    
    layer.position = CGPointMake(200, 200);
    
    
    //修改锚点
    layer.anchorPoint = CGPointZero;
    
    layer.bounds = CGRectMake(0, 0, 150, 150);
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //旋转
    _layer.transform = CATransform3DMakeRotation(arc4random_uniform(360)+1 / 180.0 * M_PI, 0, 0, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
