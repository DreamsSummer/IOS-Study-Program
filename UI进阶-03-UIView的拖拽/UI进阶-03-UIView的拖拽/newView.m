//
//  newView.m
//  UI进阶-03-UIView的拖拽
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "newView.h"

@implementation newView

//当手指开始触摸View的时候调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

//当手指离开View的时候调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

//当手指在view上离开的时候调用
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    
    //获取当前点
    CGPoint currentP = [touch locationInView:self];
    
    //获取上一个点
    CGPoint preP = [touch previousLocationInView:self];
    
    //获取X轴的偏移量
    CGFloat offSexX =currentP.x - preP.x;
    CGFloat offSexY = currentP.y - preP.y;
    
    
    //修改View的位置(frame,center,transform)
    self.transform = CGAffineTransformTranslate(self.transform, offSexX, offSexY);
}

//当手指的行为被打断的时候被调用(电话打入)
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
