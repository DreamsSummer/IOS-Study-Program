//
//  ViewController.m
//  UI进阶-03-屏幕截取
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    //将图片写入到桌面
    
    //image转data,首先得知道生成一种什么样格式的图片，png,jpg.
    NSData *data = UIImagePNGRepresentation([UIImage imageWithCaptureView:self.view]);
    
    //写入到桌面
    [data writeToFile:@"/Users/liser-pc/Desktop/view.png" atomically:YES];
}

-(void)Capture{
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    //获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把控件上的图层渲染到上下文,layer只能渲染，
    [self.view.layer renderInContext:ctx];
    
    //生成一张图片
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    
    
    //compressionQuality:图片质量  1-最高质量，原图
    //jpeg 通常我们用来压缩图片
    NSData *data =  UIImageJPEGRepresentation(image, 1);
    
    [data writeToFile:@"/Users/liser-pc/Desktop/view.png" atomically:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
