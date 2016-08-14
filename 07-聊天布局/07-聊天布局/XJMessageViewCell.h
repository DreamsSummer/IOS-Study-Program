//
//  XJMessageViewCell.h
//  07-聊天布局
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XJMessage;

@interface XJMessageViewCell : UITableViewCell

@property(nonatomic,strong)XJMessage *message;


-(void)settingShowTextButton:(UIButton *)showcontentButtom showIconView:(UIImageView *)showIconView hideContentButtom:(UIButton *)hidecontentButton hideIconView:(UIImageView *)hideIconView;
@end
