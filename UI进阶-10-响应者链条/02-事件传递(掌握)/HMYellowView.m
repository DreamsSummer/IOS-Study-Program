//
//  HMYellowView.m
//  02-事件传递(掌握)
//
//  Created by yz on 14-10-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMYellowView.h"

@implementation HMYellowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//TouchBegin默认做法:把事件传递给上一个响应者
//黄色的上一个响应者是蓝色，默认上一个响应者是父控件
//super是父类，不是父控件


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
