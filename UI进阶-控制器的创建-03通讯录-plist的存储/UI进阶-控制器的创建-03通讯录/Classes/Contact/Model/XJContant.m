//
//  XJContant.m
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/26.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJContant.h"

@implementation XJContant

+(instancetype)contantWithName:(NSString *)name phone:(NSString *)phone{
    XJContant *c = [[self alloc]init];
    
    c.name = name;
    c.phone = phone;
    
    return c;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    //name
    [aCoder encodeObject:_name forKey:@"name"];
    
    
    //phone
    [aCoder encodeObject:_phone forKey:@"phone"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
