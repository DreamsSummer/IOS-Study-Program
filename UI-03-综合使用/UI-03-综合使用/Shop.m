//
//  Shop.m
//  UI-03-综合使用
//
//  Created by liser on 16/7/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "Shop.h"

@implementation Shop


-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if(self = [super init]){
    _name = dict[@"name"];
    _icon = dict[@"icon"];
    }
    return self;
}


+(instancetype)shopWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}



@end
