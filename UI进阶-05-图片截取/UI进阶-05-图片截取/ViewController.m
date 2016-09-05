//
//  ViewController.m
//  UI进阶-05-图片截取
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign)CGPoint startP;

@property(nonatomic,assign)CGPoint endP;

@property(nonatomic,weak)UIView *clipView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

-(UIView *)clipView{
    if(_clipView == nil){
        UIView *view = [[UIView alloc]init];
        _clipView = view;
        
        view.backgroundColor = [UIColor blackColor];
        
        view.alpha = 0.5;
        
        [self.view addSubview:view];
    }
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //给控制器的View添加一个pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    _endP = CGPointZero;
    
    if(pan.state == UIGestureRecognizerStateBegan){         //刚开始拖动的时候
        _startP = [pan locationInView:self.view];
    }
    else if(pan.state == UIGestureRecognizerStateChanged){
        _endP = [pan locationInView:self.view];
        
        CGFloat w = _endP.x - _startP.x;
        CGFloat H = _endP.y - _startP.y;
        
        CGRect clipRect = CGRectMake(_startP.x, _startP.y, w, H);
        
        //生成截屏的View
        self.clipView.frame =clipRect;
    }
    else if(pan.state == UIGestureRecognizerStateEnded){
        //图片的裁剪：生成一张新的图片
        
        //开启上下文
        //如果不透明，默认超出裁剪区域的会变成黑色
        UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
        
        //设置裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_clipView.frame];
        
        [path addClip];
        
        //获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        //将控件上的图层渲染到上下文
        [_imageView.layer renderInContext:ctx];
        
        //生成一张新的图片
        _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
        //移除或者隐藏黑色半透明的View,并将View直接赋值为nil
        //应该先移除，在赋值
        [_clipView removeFromSuperview];
        _clipView = nil;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
