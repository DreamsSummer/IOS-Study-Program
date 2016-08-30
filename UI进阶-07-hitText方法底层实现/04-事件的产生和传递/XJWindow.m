//
//  XJWindow.m
//  04-事件的产生和传递
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "XJWindow.h"

@implementation XJWindow


//什么时候调用：当事件传递给控件的时候，就会调用这个方法，去寻找最合适的view
//事件传递的时候调用
//作用：寻找最合适的View
//point:当前的触摸点，这个点的坐标系就是方法调用者
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    
//    NSLog(@"%s",__func__);
//    
//    //调用系统的做法寻找最合适的View
//    return [super hitTest:point withEvent:event];
//}

//作用:当前这个点在不在方法调用者上 
//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    
//}

@end
