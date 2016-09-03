//
//  PieView.m
//  UI进阶-05-画饼图
//
//  Created by liser on 16/9/2.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "PieView.h"

@implementation PieView


-(NSArray *)arrRandom{
    int total = 100;
    
    int temp = 0 ;
    
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0 ; i < arc4random_uniform(10)+1 ; i++ ){
        temp = arc4random_uniform(total)+1;
        [array addObject:@(temp)];
        
        if(total == temp)
            break;
        total -= temp;
        
        
    }
    
    if(total){
        [array addObject:@(total)];
    }
    return array;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *arr = [self arrRandom];
    
    CGFloat radius = rect.size.height * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    
    for (int i = 0; i < arr.count; i++) {
        
        startA = endA;
        angle = [arr[i] doubleValue]  / 100.0 * M_PI * 2;
        endA = startA + angle;
        
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        
        [path addLineToPoint:center];
        
        [[self colorrandom] set];
        
        [path fill];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}

-(UIColor *)colorrandom{
    
    //0~255
    //OC:0~1
    
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


-(void)draw:(CGRect)rect{
    
    CGFloat radius = rect.size.height * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    //第一个扇形
    angle = 25 / 100.0  * M_PI  * 2;
    endA  = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius-3 startAngle:startA endAngle:endA clockwise:YES];
    
    //添加一根线到圆心
    [path addLineToPoint:center];
    
    //直接用set表示描边和填充通用
    [[UIColor redColor] set];
    
    [path fill];
    
    [path stroke];
    
    
    //第二个扇形
    startA = endA;
    angle = 25 / 100.0  * M_PI  * 2;
    endA  = startA + angle;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius-3 startAngle:startA endAngle:endA clockwise:YES];
    
    //添加一根线到圆心
    [path2 addLineToPoint:center];
    
    //直接用set表示描边和填充通用
    [[UIColor greenColor] set];
    
    [path2 fill];
    
    [path2 stroke];
    
    
    //第三个扇形
    startA = endA;
    angle = 50 / 100.0  * M_PI  * 2;
    endA  = startA + angle;
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center radius:radius-3 startAngle:startA endAngle:endA clockwise:YES];
    
    //添加一根线到圆心
    [path3 addLineToPoint:center];
    
    //直接用set表示描边和填充通用
    [[UIColor blueColor] set];
    
    [path3 fill];
    
    [path3 stroke];

}

@end
