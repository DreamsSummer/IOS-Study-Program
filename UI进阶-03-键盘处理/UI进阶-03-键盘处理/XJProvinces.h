//
//  XJProvinces.h
//  UI进阶-03-键盘处理
//
//  Created by liser on 16/8/21.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJProvinces : NSObject

@property(nonatomic,strong)NSArray *cities;

@property(nonatomic,strong)NSString *name;

+(instancetype)ProvinceWithDict:(NSDictionary *)dict;
@end
