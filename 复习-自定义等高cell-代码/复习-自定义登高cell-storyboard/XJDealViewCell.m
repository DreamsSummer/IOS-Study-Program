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
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *priceLabel;
@property (weak, nonatomic) UILabel *buyCount;

@end
@implementation XJDealViewCell


//1.在initWithFrame:方法中添加子控件

//-(instancetype)initWithFrame:(CGRect)frame{
//    if(self == [super initWithFrame:frame]){
//        
//    }
//    return self;
//}

//加载cell需要调用这个函数
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel *buyCountLabel = [[UILabel alloc]init];
        buyCountLabel.textColor = [UIColor lightGrayColor];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLabel];
        self.buyCount = buyCountLabel;
    }
    return self;
}
//2.在layoutSubviews方法中设置子控件的位置

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    // iconView
    CGFloat viewX = 10;
    CGFloat viewY = 10;
    CGFloat viewW = 100;
    CGFloat viewH = self.contentView.frame.size.height - 2 * viewY;
    self.iconView.frame = CGRectMake(viewX, viewY, viewW, viewH);
    
    //titleLabel
    CGFloat titleX = CGRectGetMaxX(self.iconView.frame) + 10;
    CGFloat titleY = viewY;
    CGFloat titleW = self.contentView.frame.size.width - titleX - 10;
    CGFloat titleH = 21;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    //priceLabel
    CGFloat priceX = CGRectGetMaxX(self.iconView.frame) + 10;
    CGFloat priceY = self.contentView.frame.size.height - 10 - 21;
    CGFloat priceW = 70;
    CGFloat priceH = 21;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    //buyCountLabel
    CGFloat buyCountX = CGRectGetMaxX(self.priceLabel.frame) + 10;
    CGFloat buyCountY = priceY;
    CGFloat buyCountW = self.contentView.frame.size.width - buyCountX - 10;
    CGFloat buyCountH = priceH;
    self.buyCount.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
    
}
//3.重写模型的set方法


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
        cell = [[XJDealViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deal"];
    }
    
    return cell;
}

@end
