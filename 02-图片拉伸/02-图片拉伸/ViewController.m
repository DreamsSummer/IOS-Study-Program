//
//  ViewController.m
//  02-图片拉伸
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(100, 100, 250, 250);
    imageView.image = [UIImage imageNamed:@"chat_send_nor"];
    [self.view addSubview:imageView];
    
    //加载原图
//    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    
    //拉伸处理(说明需要保护的区域)
//    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 30, 30) resizingMode:UIImageResizingModeStretch];
    
//    image =  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5 ];
    
    //left
    //right
    //width
    //right
    //在ios最开始的时候就具有得方法，只需要设置左边和顶部需要保护的像素，对于右边和底部需要保护的部分，编译器会自动计算出来，只留下中间1*1的区域提供拉伸
    //right = width - left - 1;
    //bottom =  height - top - 1;
    
    
    
//    imageView.image = image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
