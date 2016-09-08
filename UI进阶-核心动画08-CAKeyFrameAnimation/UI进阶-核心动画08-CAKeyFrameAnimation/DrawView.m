//
//  DrawView.m
//  UI进阶-核心动画08-CAKeyFrameAnimation
//
//  Created by liser on 16/9/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "DrawView.h"

@interface DrawView()
@property(nonatomic,strong)UIBezierPath *path;
@end

@implementation DrawView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //touch
    UITouch *touch = [touches anyObject];
    
    //获取手指的触摸点
    CGPoint curP = [touch locationInView:self];
    
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    _path = path;
    
    //设置起点
    [path moveToPoint:curP];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //touch
    UITouch *touch = [touches anyObject];
    
    //添加核心动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //    anim.keyPath = @"transform.rotation";
    
    anim.keyPath = @"position";
    
    //获取手指的触摸点
    CGPoint curP = [touch locationInView:self];
    
    [_path addLineToPoint:curP];
    
    [self setNeedsDisplay];
    
    
    anim.path = _path.CGPath;
    
    anim.duration = 1;
    
    anim.repeatCount = MAXFLOAT;
    
    
    
    [[[self.subviews firstObject] layer] addAnimation:anim forKey:nil];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //给imageView添加核心动画
    
}


-(void)drawRect:(CGRect)rect{
    [_path stroke];
}
@end
