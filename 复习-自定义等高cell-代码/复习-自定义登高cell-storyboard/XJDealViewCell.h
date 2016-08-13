//
//  XJDealViewCell.h
//  复习-自定义登高cell-storyboard
//
//  Created by liser on 16/8/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  XJDeal;
@interface XJDealViewCell : UITableViewCell

/**团购模型数据*/
@property (nonatomic, strong)XJDeal *deal ;


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
