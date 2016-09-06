//
//  ViewController.m
//  UI进阶-核心动画07-VABasicAnimation基本用法
//
//  Created by liser on 16/9/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    //描述一下修改那个属性产生动画
//    anim.keyPath = @"position";
    
    //缩放
    //只能是layer的属性
    anim.keyPath = @"transform.scale";
    
    //设置动画的值
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    
    //设置缩放的值
    anim.toValue = @0.5;
    
    //设置动画的执行次数
    anim.repeatCount = MAXFLOAT;
    
    
    //取消动画反弹，以下两句缺一不可
    //设置当动画完成之后不要移除动画
    anim.removedOnCompletion = NO;
    
    //当动画完成之后保持最新的效果
    anim.fillMode = kCAFillModeForwards;
    
    [_imageView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
