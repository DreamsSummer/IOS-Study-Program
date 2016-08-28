//
//  Person.h
//  UI进阶-08-自定义对象归档
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <Foundation/Foundation.h>


//如果一个自定义对象想要归档成功，必须遵守NSCoding这个协议并实现协议方法
@interface Person : NSObject<NSCoding>


@property(nonatomic,assign)int age;

@property(nonatomic,strong)NSString *name;


@end
