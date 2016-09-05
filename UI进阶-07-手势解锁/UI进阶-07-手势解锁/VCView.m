//
//  VCView.m
//  UI进阶-07-手势解锁
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "VCView.h"

@implementation VCView


-(void)drawRect:(CGRect)rect{
    //绘制图片
    
    
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    
    [image drawInRect:rect];
}

@end
