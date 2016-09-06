//
//  ViewController.m
//  UI进阶-核心动画01-CALayer的基本使用
//
//  Created by liser on 16/9/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //图层的形变：图层的形变是3D效果
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //图层形变
    
    //缩放
    [UIView animateWithDuration:1 animations:^{
//        _redView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
        
//        _redView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
        
        
        //快速进行图层缩放：可以使用KVC
//        [_redView.layer setValue:@0.5 forKey:@"transform.scale"];
        
        //使用KVC做屏幕旋转
        //做旋转最好不要使用KVC
        [_redView.layer setValue:@(M_PI_2) forKeyPath:@"transform.rotation"];
    }];
    
}


-(void)imageLayer{
    _imageView.layer.cornerRadius = 50;
    
    //超出主层边框的内容全部裁减掉
    _imageView.layer.masksToBounds = YES;
    
    _imageView.layer.borderColor = [UIColor blueColor].CGColor;
    _imageView.layer.borderWidth = 1;
    
    //如何判断以后是否需要裁减图片，就判断一下需要显示图层的控件是否是正方形
}

-(void)viewLayer{
    //shadowOpacity--阴影不透明度
    _redView.layer.shadowOpacity = 1 ;
    
    //shadowOffset--阴影的偏移量
    _redView.layer.shadowOffset = CGSizeMake(10, 10);
    
    //shadowColor--设置阴影的颜色，要通过CGColor对颜色进行转换
    //注意：图层的颜色都是核心绘图框架的，通常我们都需要通过CGColor进行转换
    _redView.layer.shadowColor = [UIColor yellowColor].CGColor;
    
    
    //设置阴影的圆角半径
    _redView.layer.shadowRadius = 10;
    
    //圆角半径
    _redView.layer.cornerRadius = 50;
    
    //边框
    _redView.layer.borderColor = [UIColor greenColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
