//
//  XJFlag.h
//  02-国旗选择
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJFlag : NSObject

/**标题*/
@property (nonatomic, strong)NSString *name;

/**图标*/
@property (nonatomic, strong)NSString *icon;


//instancetype:自动识别当前是哪个类在调用，就会变成对应类的对象
//为什么不提倡用id：1.id不能使用.语法   2.id可以调用任何对象的方法：坏处：不利于编译器检查错误
+(instancetype)flagWithDict:(NSDictionary *)dict;
@end
