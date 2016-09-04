//
//  drawView.m
//  UI进阶-11-图形上下文状态栈
//
//  Created by liser on 16/9/2.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "drawView.h"

@implementation drawView



//如果以后用贝瑟尔绘制图形，如果用[path stroke],上下文的状态由贝瑟尔路径的状态决定
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    //描述路径
    //第一根线
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(10, 125)];
    
    [path addLineToPoint:CGPointMake(240, 125)];
    
//    path.lineWidth = 5;
//    
//    path.lineCapStyle = kCGLineCapRound;
    
    
    //把路径添加到上下文
    //.CGPath 可以将UIKit的路径转换成CoreGraphics的路径
    CGContextAddPath(ctx, path.CGPath);
    
    //设置上下文状态
    CGContextSetLineWidth(ctx, 5);
    
    [[UIColor redColor]set];
    
    
    
//    [path stroke];
    //渲染上下文
    CGContextStrokePath(ctx);
    
    
    //第二根线
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 moveToPoint:CGPointMake(125 , 10)];
    
    [path2 addLineToPoint:CGPointMake(125, 240)];
    
    [path2 stroke];
    
}


@end
