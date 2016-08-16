//
//  XJMessage.h
//  07-聊天布局
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJMessage : NSObject

typedef enum{
    XJMessageTypeMe = 0,
    XJMessageTypeOther = 1
}XJMessageType;

@property(nonatomic,strong)NSString *text;

@property(nonatomic,strong)NSString *time;

@property(nonatomic,assign,getter=isOther)XJMessageType type;

@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,assign,getter=ishideTime)BOOL hideTime;

+(instancetype)messageWithDict:(NSDictionary *)dict;
@end
