//
//  ViewController.m
//  UI进阶-核心动画10-动画组
//
//  Created by liser on 16/9/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //什么是动画组?
    //如果以后想做一个动画，这个动画中同时包含平移，旋转，缩放，就使用动画组
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"tranform.scale";
    scale.toValue = @0.5;
    
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(M_PI_4);
    
    CABasicAnimation *position = [CABasicAnimation animation];
    position.keyPath = @"position";
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(200), arc4random_uniform(200))];
    
    group.animations = @[scale,rotation,position];
    
    [_redView.layer addAnimation:group forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
