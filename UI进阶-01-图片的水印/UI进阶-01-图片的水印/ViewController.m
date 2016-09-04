//
//  ViewController.m
//  UI进阶-01-图片的水印
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载图片
    UIImage *image = [UIImage imageNamed:@"小黄人"];
    
    //0.获取上下文,获取上下文都是在view的drawRect方法中获取（跟view相关联的上下文 layer上下文）
        //目前我们需要绘制图片到新的图片上，因此需要用到位图上下文
    
        //怎么获取位图上下文，注意：位图上下文的获取方式根layer上下文不一样，位图上下文需要我们自己创建
    //开启一个位图上下文:注意位图上下文跟view无关联，所以不需要在drawRect
    //size：位图上下文的尺寸(新图片的尺寸)
    //opaque:不透明度 YES:不透明 NO:透明 通常我们都需要设置称为透明的上下文
    //scale:缩放 通常我们不需要缩放上下文 通常取值为0表示不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //只要开启了上下文，马上就会在内存中存在一个上下文
    
    //1.绘制一张原生的图片
    [image drawAtPoint:CGPointZero];
    
    //2.给原生的图片添加文字
    NSString *str = @"小荐的图片";
    
    //创建一个字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    //withAttributes传nil表示默认的文字
    [str drawAtPoint:CGPointMake(200, 528) withAttributes:dict];
    
    //3.生成一张图片给我们
    UIImage *imageRes =  UIGraphicsGetImageFromCurrentImageContext();
    
    //4.为了节省内存，我们要手动关闭位图上下文
    UIGraphicsEndImageContext();
    
    
    _imageView.image = imageRes;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
