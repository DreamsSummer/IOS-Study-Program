//
//  XJProvinces.m
//  UI进阶-03-键盘处理
//
//  Created by liser on 16/8/21.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJProvinces.h"

@implementation XJProvinces


+(instancetype)ProvinceWithDict:(NSDictionary *)dict{
    
    XJProvinces *province = [[XJProvinces alloc]init];
    //kvc
    [province setValuesForKeysWithDictionary:dict];
    return province;
}
@end
