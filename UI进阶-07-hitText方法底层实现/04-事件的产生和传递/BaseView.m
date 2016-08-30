//
//  BaseView.m
//  04-事件的产生和传递
//
//  Created by xiaomage on 15/6/16.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@---touchesBegan",[self class]);
}


//所有的视图类都是继承BaseView
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"%s",__func__);
//    return [super hitTest:point withEvent:event];
    
    //1.判断当前控件能否接收事件
    //一下这些情况下都表示当前控件不可以接收事件
//    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01)
    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01)
        return nil;
    
    
    //2.判断点是否在当前控件上
    if([self pointInside:point withEvent:event] == NO){
        return nil;
    }
    
    //3.从后往前遍历自己的子控件
    NSInteger count = [self.subviews count];
    
    for (NSInteger i = count - 1; i >= 0; i--) {
        UIView *childView = self.subviews[i];
        
        //把当前控件上的坐标系转换成子控件上的坐标系
        CGPoint childP = [self convertPoint:point toView:childView];
        
        UIView *rightView = [childView hitTest:childP withEvent:event];
        
        if(rightView){
            return rightView;
        }
    }
    //循环结束，如果没有比当前控件更合适的View
    return self;
}

@end
