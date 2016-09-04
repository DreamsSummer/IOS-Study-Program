//
//  ViewController.m
//  UI进阶-02-图片裁剪
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
    
    //图片裁剪:把正方形图片重新生产一张圆形的图片
    
    //0.加载一张图片
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    
    //1.开启一个位图上下文，并且位图上下文的尺寸和图片的尺寸一样大
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2.设置圆形剪裁区域，正切于图片
        //设置一个圆形的裁剪区域，设置一个圆形的路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
        //把路径设置为裁剪区域
    [path addClip];
    
    //3.绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4.从上下文中获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    

    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    
    _imageView.image = clipImage;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
