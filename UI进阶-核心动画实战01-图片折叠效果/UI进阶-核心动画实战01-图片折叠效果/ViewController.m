//
//  ViewController.m
//  UI进阶-核心动画实战01-图片折叠效果
//
//  Created by liser on 16/9/6.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *dragView;

@property(nonatomic,weak) CAGradientLayer *gradientL;

@end

@implementation ViewController


//一张图片必须通过两个控件显示，旋转的时候，只旋转上部分控件
//如何让一张完整的图片通过两个控件显示
//通过layer就可以实现这种效果
//通过layer可以控制图片的显示内容

//如何快速的把两个控件拼接成一张完整的图片
//设置锚点
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //设置contentsRect（内容矩阵）可以设置图片显示的尺寸，取值0~1
    _topView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _topView.layer.anchorPoint = CGPointMake(0.5, 1);
    _bottomView.layer.contentsRect = CGRectMake(0,0.5, 1, 0.5);
    _bottomView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    //渐变图层
    //注意：渐变图层需要设置尺寸
    CAGradientLayer *gradientL = [CAGradientLayer layer];
    //设置透明度
    gradientL.opacity = 0;
    gradientL.frame = _bottomView.bounds;
    gradientL.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    //    gradientL.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor];
    
    [_bottomView.layer addSublayer:gradientL];
    
    _gradientL = gradientL;
    
    [_dragView addGestureRecognizer:pan];
}


//拖动的时候旋转上部分的内容，拖拽200 转动180度
-(void)pan:(UIPanGestureRecognizer *)pan{
    //监听手指的拖拽
    
    //获取手指的偏移量
    CGPoint transP = [pan translationInView:_dragView];
    
    
    
    //旋转的角度,向下逆时针旋转
    CGFloat angle = -transP.y / 200.0 * M_PI;
    
    //增加旋转的立体感(需要设置transform的一个m34属性)
    CATransform3D transform = CATransform3DMakeRotation(angle, 1, 0, 0);
    //增加旋转的立体感，近大远小 d:距离图层的距离
    transform.m34  = -1/300.0;
//    _topView.layer.transform  = CATransform3DMakeRotation(angle, 1, 0, 0);
    _topView.layer.transform = transform;
    
    _gradientL.opacity = transP.y * 1 / 200.0;
    

    

    
    if(pan.state == UIGestureRecognizerStateEnded){
        
        //需要添加一个弹簧效果的动画，添加一个物理引擎
        //usingSpringWithDamping:弹性系数，弹性系数越小，弹簧效果越明显
        //delay:延迟动画时间
        //initialSpringVelocity:初始速度
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _topView.layer.transform = CATransform3DIdentity;
            _gradientL.opacity = 0;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
