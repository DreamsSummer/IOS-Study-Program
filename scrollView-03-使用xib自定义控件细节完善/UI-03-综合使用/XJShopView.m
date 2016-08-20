//
//  XJShopView.m
//  UI-03-综合使用
//
//  Created by liser on 16/7/17.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJShopView.h"
#import "Shop.h"

@interface XJShopView()

/**图标*/
@property (nonatomic,weak) IBOutlet UIImageView *iconName;


/**名字*/
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;

@end

@implementation XJShopView

-(void)setShop:(Shop *)shop{
    _shop = shop;
    
//    UIImageView *iconName = [self viewWithTag:10];
//    UIImageView *iconName = [self.subviews lastObject];
    self.iconName.image = [UIImage imageNamed:shop.icon];
    
    
//    UILabel *nameLabel = [self viewWithTag:20];
//    UILabel *nameLabel = [self.subviews firstObject];
    self.nameLabel.text = shop.name;
    
}

//+(NSString *)xibName{
//    return NSStringFromClass(self);
//}


+(instancetype)shopView{
    return [[[NSBundle mainBundle] loadNibNamed:@"XJShopView" owner:nil options:nil]lastObject];
}
@end
