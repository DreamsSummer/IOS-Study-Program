//
//  Person.m
//  UI进阶-08-自定义对象归档
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "Person.h"

@implementation Person


//什么时候调用?自定义对象归档的时候调用

//作用:用来描述当前对象里面哪些属性需要完成归档

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:_name forKey:@"name"];
    
    [aCoder encodeInteger:_age forKey:@"age"];
}


//什么时候调用?解档对象的时候调用
//作用:用来描述当前对象里面哪些属性需要解档
//initWithCoder这个方法就是用来解析文件的
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    //初始化父类
    //super:NSObject
    if(self = [super init]){
        
        //注意:一定要给成员变量赋值
        
        //name
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntForKey:@"age"];
        
    }
    return self;
}

@end
