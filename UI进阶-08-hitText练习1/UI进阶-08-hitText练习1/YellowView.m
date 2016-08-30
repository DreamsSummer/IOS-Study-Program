//
//  YellowView.m
//  UI进阶-08-hitText练习1
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "YellowView.h"

@interface YellowView ()

@property(nonatomic,weak)IBOutlet UIButton *btn;

@end


@implementation YellowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    //判断当前点在不在按钮上
    
    
    return nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
