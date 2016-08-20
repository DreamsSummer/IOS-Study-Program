//
//  XJShopView.h
//  UI-03-综合使用
//
//  Created by liser on 16/7/17.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shop;

@interface XJShopView : UIView

@property (nonatomic, strong)Shop *shop ;

//+(NSString *)xibName;

+(instancetype)shopView;


//接口：提供给外界的方法、属性等方法


@end
