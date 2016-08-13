//
//  XJDealViewCell.m
//  复习-自定义登高cell-storyboard
//
//  Created by liser on 16/8/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJDealViewCell.h"
#import "XJDeal.h"

@interface XJDealViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;

@end
@implementation XJDealViewCell

-(void)setDeal:(XJDeal *)deal{
    _deal = deal;
    
    //    设置数据
//    UIImageView *iconView = (UIImageView *)[self viewWithTag:10];
    self.iconView.image = [UIImage imageNamed:deal.icon];
    
//    UILabel *titleLabel = (UILabel *)[self viewWithTag:20];
    self.titleLabel.text = deal.title;
    
//    UILabel *priceLabel = (UILabel *)[self viewWithTag:30];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",deal.price];
    
//    UILabel *buyCount = (UILabel *)[self viewWithTag:40];
    self.buyCount.text = [NSString stringWithFormat:@"%@人购买",deal.buyCount];
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"deal";
    XJDealViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([XJDealViewCell class]) owner:nil options:nil]lastObject];
    }
    
    return cell;
}

@end
