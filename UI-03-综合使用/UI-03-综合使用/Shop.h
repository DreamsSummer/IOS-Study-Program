//
//  Shop.h
//  UI-03-综合使用
//
//  Created by liser on 16/7/14.
//  Copyright © 2016年 liser. All rights reserved.
//  存放商品数据的模型

#import <Foundation/Foundation.h>

@interface Shop : NSObject

/**商品名称*/
@property (nonatomic, strong)NSString *name;

/**图标*/
@property (nonatomic, strong)NSString *icon;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;
@end
