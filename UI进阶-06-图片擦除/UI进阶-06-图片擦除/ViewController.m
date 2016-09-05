//
//  ViewController.m
//  UI进阶-06-图片擦除
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
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *pan  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    //获取当前触摸点
    CGPoint curP = [pan locationInView:self.view];
    
    //获取擦除的矩形范围
    CGFloat wh = 30;
    CGFloat x = curP.x - wh * 0.5;
    CGFloat y = curP.y - wh * 0.5;
    
    CGRect rect =  CGRectMake(x, y, wh, wh);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    
    [_imageView.layer renderInContext:ctx];
    
    
    //擦除图片
    CGContextClearRect(ctx, rect);
    
    //生成一张图片
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    
    //将生成的图片显示在屏幕上
    _imageView.image = image;
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
