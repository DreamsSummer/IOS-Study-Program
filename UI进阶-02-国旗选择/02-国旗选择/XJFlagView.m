//
//  XJFlagView.m
//  02-国旗选择
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJFlagView.h"
#import "XJFlag.h"

@interface XJFlagView ()
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation XJFlagView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)setFlag:(XJFlag *)flag{
    _flag = flag;
    
    //给子控件赋值
    _Label.text = flag.name;
    _imageView.image = [UIImage imageNamed:flag.icon];
}

@end
