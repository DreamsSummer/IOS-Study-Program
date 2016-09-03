//
//  ProgressView.m
//  UI进阶-04-重绘（下载进度）
//
//  Created by liser on 16/9/2.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView


-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    
//    [self drawRect:self.bounds];
    
    //重绘：系统会自己创建一个与View相关联的上下文，然后再调用drawRect方法
    [self setNeedsDisplay];
}


//drawRect不能手动调用,因为图形上下文是自己创建不了的，只能由系统创建，并传递给我们
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //创建贝瑟尔路径
    CGFloat radius = rect.size.height * 0.5 - 2 ;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius-2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    
    path.lineWidth = 3;
    
    [path stroke];
}


@end
