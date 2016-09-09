//
//  DrawView.m
//  UI进阶-核心动画07-粒子效果
//
//  Created by liser on 16/9/6.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "DrawView.h"


@interface DrawView ()

@property(nonatomic,strong)UIBezierPath *path;
@end



@implementation DrawView


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取一个touch对象
    UITouch *touch = [touches anyObject];
    
    
    //获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    
    //创建一个路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起点
    [path moveToPoint:curP];
    _path = path;
    
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取一个touch对象
    UITouch *touch = [touches anyObject];
    
    
    //获取当前触摸点
    CGPoint curP = [touch locationInView:self];
    
    //添加线到某个点
    [_path addLineToPoint:curP];
    
    //重绘
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    [_path stroke];
}

@end
