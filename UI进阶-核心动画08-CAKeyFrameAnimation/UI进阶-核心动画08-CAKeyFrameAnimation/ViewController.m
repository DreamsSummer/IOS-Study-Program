//
//  ViewController.m
//  UI进阶-核心动画08-CAKeyFrameAnimation
//
//  Created by liser on 16/9/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"


#define angle2radion(a) ((a) / 180.0 * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView.layer.anchorPoint = CGPointZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //添加核心动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
//    anim.keyPath = @"transform.rotation";
    
    anim.keyPath = @"position";
    
//    anim.values = @[@(angle2radion(-5)),@(angle2radion(5)),@(angle2radion(-5))];

}

@end
