//
//  XJDeal.m
//  复习-自定义登高cell-storyboard
//
//  Created by liser on 16/8/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJDeal.h"

@implementation XJDeal


+(instancetype)dealWithDict:(NSDictionary *)dict{
    XJDeal *deal = [[self alloc]init];
    
//    deal.title = dict[@"title"];
    
    [deal setValuesForKeysWithDictionary:dict];
    
    return deal;
}
@end
