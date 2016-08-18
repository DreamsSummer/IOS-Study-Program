//
//  XJShopView.m
//  UI-03-综合使用
//
//  Created by liser on 16/7/15.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJShopView.h"
#import "Shop.h"

@interface XJShopView()

@property (nonatomic, strong)UIImageView *iconView;

@property (nonatomic, strong)UILabel *namelabel ;

@end

@implementation XJShopView

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

+(instancetype)shopView{
    return [[self alloc]init];
}

-(UIImageView *)iconView{
    if(_iconView == nil){
        UIImageView *iconView = [[UIImageView alloc]init];
        
        iconView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:iconView];
        
        _iconView = iconView;
    }
    return _iconView;
}

-(UILabel *)namelabel{
    if(_namelabel == nil){
        UILabel *nameLabel = [[UILabel alloc]init];
        
        nameLabel.font = [UIFont systemFontOfSize:11];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor redColor];
        
        [self addSubview:nameLabel];
        
        _namelabel = nameLabel;
    }
    return _namelabel;
}


/**
这个方法专门用来布局子控件，一般在这里设置子控件的frame
当控件本身的尺寸发生改变的时候，系统会自动调用这个方法
*/
-(void)layoutSubviews{
    
//    一定要调用super的layoutSubviews
    [super layoutSubviews];
    
    CGFloat shopW = self.frame.size.width;
    CGFloat shopH = self.frame.size.height;
    
    self.iconView.frame = CGRectMake(0, 0, shopW, shopW);
    self.namelabel.frame = CGRectMake(0, shopW, shopW, shopH-shopW);
}

-(void)setShop:(Shop *)shop{
    
//    NSLog(@"---------");
    _shop = shop;
    
    self.namelabel.text = shop.name;
    self.iconView.image = [UIImage imageNamed:shop.icon];
}

@end
