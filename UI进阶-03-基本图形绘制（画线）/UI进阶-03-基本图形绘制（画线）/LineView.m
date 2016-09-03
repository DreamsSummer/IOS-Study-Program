//
//  LineView.m
//  UI进阶-03-基本图形绘制（画线）
//
//  Created by liser on 16/9/1.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "LineView.h"

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



//绘图的步骤
//1.获取上下文
//2.创建路径（描述路径）
//3.把路径添加到上下文
//4.将上下文渲染到View上

//通常在这个方法里面绘制图形
//为什么要在drawRect方法里面绘图：只有在这个方法里面才能获取到跟View向关联的图形上下文
//什么时候调用:当这个View要显示的时候才会调用drawRect绘制图形
//rect是当前View的bounds
- (void)drawRect:(CGRect)rect {
    //UIKit已经封装了一些绘图的功能
    
    //贝瑟尔路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起点
    [path moveToPoint:CGPointMake(50, 50)];
    
    [path addLineToPoint:CGPointMake(200, 200)];
    
    //渲染
    [path stroke];

}

//加载玩xib的时候调用这个方法
//注意：绘图只能在drawRect方法里面写，因为别的方法中不能获取上下文
-(void)awakeFromNib{
    
}

-(void)drawLine2{
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //描述路径
    
    //设置起点
    CGContextMoveToPoint(ctx, 50, 50);
    
    CGContextAddLineToPoint(ctx, 200, 200);
    
    //渲染上下文
    CGContextStrokePath(ctx);
}


-(void)drawLine1{
    //1.获取图形上下文
    //CGContextRef Ref:引用 目前使用到的类型和函数 一般都是CG开头
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.描述路径
    //2.1 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //2.2设置起点
    //CGMutablePathRef  _Nullable path 给哪个路径设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    
    //2.3添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    //4.渲染上下文到View的图层上
    //描边绘制这个路径
    CGContextStrokePath(ctx);
}


@end
