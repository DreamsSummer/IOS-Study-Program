//
//  ViewController.m
//  UI进阶-核心动画02-音量振动条
//
//  Created by liser on 16/9/6.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //CAReplicatorLayer复制图层，可以把复制图层里面的所有子层复制
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = _drawView.bounds;
    
    [_drawView.layer addSublayer:repL];
    
    CALayer *layer = [CALayer layer];
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(15, _drawView.bounds.size.height);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [repL addSublayer:layer];
    
    [_drawView.layer addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0.1;
    
    anim.duration = 0.5;
    anim.repeatCount = MAXFLOAT;
    
    //设置动画反转
    anim.autoreverses = YES;
    
    [layer addAnimation:anim forKey:nil];
    
    repL.instanceCount = 3;
    
    repL.instanceTransform = CATransform3DMakeTranslation(30, 0, 0);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
