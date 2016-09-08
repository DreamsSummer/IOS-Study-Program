//
//  ViewController.m
//  UI进阶-核心动画11-UIView和核心动画的区别
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
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//核心动画和UIView的区别
//核心动画一切都是假象，并不会改变图层的真实的属性值，如果以后做动画的时候不需要与用户交互，通常使用核心动画，核心动画一班用到转场
//UIView动画必须通过修改属性的真实值才有效果

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"position";
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(170, 400)];
    
    anim.delegate = self;
    
    //取消反弹
    //注意：取消反弹必须添加到图层添加动画之前
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [_redView.layer addAnimation:anim forKey:nil];
    
}


//动画完成的时候调用这个方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"%@",NSStringFromCGPoint(_redView.layer.position));
}

@end
