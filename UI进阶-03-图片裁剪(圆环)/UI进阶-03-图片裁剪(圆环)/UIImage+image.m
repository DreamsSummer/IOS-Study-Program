//
//  UIImage+image.m
//  UI进阶-03-图片裁剪(圆环)
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+(UIImage *)imageWithClipImage:(UIImage *)image border:(CGFloat)borderWidth borderColor:(UIColor *)color{
    
    CGFloat imageWH = image.size.width;
    
    //圆形的宽度和高度
    CGFloat voalWH = imageWH + 2 * borderWidth;
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(voalWH, voalWH), NO, 0);
    
    //2.画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, voalWH, voalWH)];
    
    [color set];
    
    [path fill];
    
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageWH, imageWH)];
    
    [imagePath addClip];
    
    [image drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    
    //获取图片
    UIImage *imageRes = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return imageRes;
}

@end
