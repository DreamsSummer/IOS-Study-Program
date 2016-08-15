//
//  XJMessageViewCell.m
//  07-聊天布局
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJMessageViewCell.h"
#import "XJMessage.h"

#define  MAS_SHORTHAND

#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"


@interface XJMessageViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *contentButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *otherIconView;
@property (weak, nonatomic) IBOutlet UIButton *othercontentButton;

@end

@implementation XJMessageViewCell


-(void)awakeFromNib{
    self.contentButton.titleLabel.numberOfLines = 0 ;
//    self.contentButton.titleLabel.backgroundColor = [UIColor redColor];
    
    self.othercontentButton.titleLabel.numberOfLines = 0 ;
    
}

-(void)setMessage:(XJMessage *)message{
    _message = message;
    
    
    
    if(message.type == XJMessageTypeMe ){
        [self settingShowTextButton:self.contentButton showIconView:self.iconView hideContentButtom:self.othercontentButton hideIconView:self.otherIconView];
        
    }
    else{
        
        [self settingShowTextButton:self.othercontentButton showIconView:self.otherIconView hideContentButtom:self.contentButton hideIconView:self.iconView];
        
    }
    
    if(message.ishideTime){
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    }
    else{
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    }
    self.timeLabel.text = message.time;
}


-(void)settingShowTextButton:(UIButton *)showcontentButtom showIconView:(UIImageView *)showIconView hideContentButtom:(UIButton *)hidecontentButton hideIconView:(UIImageView *)hideIconView{
    hideIconView.hidden = YES;
    hidecontentButton.hidden = YES;
    
    showIconView.hidden = NO;
    showcontentButtom.hidden = NO;
    
    
    //设置按钮的文字（self.contentButton.titleLabel 就有文字）
    [showcontentButtom setTitle:self.message.text forState:UIControlStateNormal];
    
    //强制更新
    [showcontentButtom layoutIfNeeded];
    
    //设置按钮的高度就是titleLabel的高度
    [showcontentButtom updateConstraints:^(MASConstraintMaker *make) {
        
        CGFloat buttonH = showcontentButtom.titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];
    
    [showcontentButtom layoutIfNeeded];
    
    //计算当前cell的高度
    CGFloat buttomMaxY = CGRectGetMaxY(showcontentButtom.frame);
    CGFloat contentMaxY = CGRectGetMaxY(showIconView.frame);
    
    self.message.cellHeight = MAX(buttomMaxY, contentMaxY) + 10;
}

@end
