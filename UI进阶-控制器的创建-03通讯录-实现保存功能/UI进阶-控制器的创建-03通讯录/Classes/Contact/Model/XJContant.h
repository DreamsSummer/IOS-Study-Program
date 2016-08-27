//
//  XJContant.h
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/26.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJContant : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *phone;

+(instancetype)contantWithName:(NSString *)name phone:(NSString *)phone;
@end
