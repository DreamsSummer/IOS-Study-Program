//
//  DrawView.m
//  UI进阶-13-图形上下文矩阵操作
//
//  Created by liser on 16/9/2.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


//什么叫做矩阵操作?
//缩放、平移、旋转

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //获取上下文
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    
    //画椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    
    [[UIColor redColor]set];
    
    
    //上下文的矩阵操作
    //矩阵操作注意点:矩阵操作必须要在添加路径之前
    
    // 平移
    CGContextTranslateCTM(ctx, 100, 50);
    
    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    
    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    
    //把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //4.渲染上下文
    CGContextFillPath(ctx);
}


@end
