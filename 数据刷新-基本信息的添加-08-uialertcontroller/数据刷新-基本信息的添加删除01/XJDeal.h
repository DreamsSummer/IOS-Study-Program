//
//  XJDeal.h
//  复习-自定义登高cell-storyboard
//
//  Created by liser on 16/8/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJDeal : NSObject

//购买数量
@property (strong,nonatomic)NSString *buyCount;

@property(strong,nonatomic)NSString *price;

/**主题*/
@property (nonatomic, strong)NSString *title;

/**图片*/
@property (nonatomic, strong)NSString *icon;


+(instancetype)dealWithDict:(NSDictionary *)dict;
@end
