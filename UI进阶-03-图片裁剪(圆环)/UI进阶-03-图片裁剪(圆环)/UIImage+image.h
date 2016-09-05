//
//  UIImage+image.h
//  UI进阶-03-图片裁剪(圆环)
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+(UIImage *)imageWithClipImage:(UIImage *)image border:(CGFloat)borderWidth borderColor:(UIColor *)color;

@end
