//
//  ViewController.m
//  UI进阶-03-图片裁剪(圆环)
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+image.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //图片剪裁
    _imageView.image = [UIImage imageWithClipImage:[UIImage imageNamed:@"阿狸头像"] border:2 borderColor:[UIColor redColor]];
    
}

-(void)drawWithClip{
    //0.加载图片
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    CGFloat imageWH = image.size.width;
    
    //设置圆环边缘的宽度
    CGFloat border  = 2;
    
    
    //圆形的宽度和高度
    CGFloat voalWH = imageWH + 2 *border;
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(voalWH, voalWH), NO, 0);
    
    //2.画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, voalWH, voalWH)];
    
    [[UIColor redColor]set];
    
    [path fill];
    
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    
    [imagePath addClip];
    
    [image drawAtPoint:CGPointMake(border, border)];
    
    //获取图片
    UIImage *imageRes = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = imageRes;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
