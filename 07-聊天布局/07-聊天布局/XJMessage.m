//
//  XJMessage.m
//  07-聊天布局
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJMessage.h"

@implementation XJMessage


+(instancetype)messageWithDict:(NSDictionary *)dict{
    XJMessage *message = [[XJMessage alloc]init];
    
    [message setValuesForKeysWithDictionary:dict];
    
    return message;
}
@end
