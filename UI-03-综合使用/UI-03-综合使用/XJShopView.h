//
//  XJShopView.h
//  UI-03-综合使用
//
//  Created by liser on 16/7/15.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Shop;

@interface XJShopView : UIView

@property (nonatomic, strong) Shop *shop ;


+(instancetype)shopView;

@end
