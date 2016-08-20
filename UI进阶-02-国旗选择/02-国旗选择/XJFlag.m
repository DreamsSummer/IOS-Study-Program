//
//  XJFlag.m
//  02-国旗选择
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJFlag.h"

@implementation XJFlag

+(instancetype)flagWithDict:(NSDictionary *)dict{
    XJFlag *flag = [[self alloc]init];
    
    //KVC
    [flag setValuesForKeysWithDictionary:dict];
    
    return flag;
}

@end
