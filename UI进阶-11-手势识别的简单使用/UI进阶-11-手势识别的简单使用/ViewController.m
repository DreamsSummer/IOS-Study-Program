//
//  ViewController.m
//  UI进阶-11-手势识别的简单使用
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //点击事件，创建一个点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//    tap.numberOfTapsRequired = 2;
    tap.delegate = self;
    
//    [self setUpLongPress];
//    [self setUpSwipe];
    [self setUpRotation];
    
    [self setUpPinch];
    
    [self setUpPan];
    
    
    [_imageView addGestureRecognizer:tap];
}

#pragma mark - 旋转手势
-(void)setUpRotation{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(Rotation:)];
    
    rotation.delegate = self;
    
    [self.imageView addGestureRecognizer:rotation];
}


//手势传递的默认角度都是相对于最开始的位置
-(void)Rotation:(UIRotationGestureRecognizer *)rotation{
//    NSLog(@"%s",__func__);
    
//    self.imageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    
    //复位操作
    rotation.rotation = 0;
    
    //获取手指旋转的角度
    NSLog(@"%f",rotation.rotation);
    
}


#pragma mark - 拖拽手势
-(void)setUpPan{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.imageView addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    //获取手指的触摸点
    [pan locationInView:self.imageView];
    
    
    //移动视图
    
    //获取手势的移动，也是相对于开始时候的位置
    CGPoint transp = [pan translationInView:self.imageView];
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transp.x, transp.y);
    
    [pan setTranslation:CGPointZero inView:self.imageView];
}


#pragma mark - 捏合手势
-(void)setUpPinch{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    
    pinch.delegate = self;
    
    [self.imageView addGestureRecognizer:pinch];
}

-(void)pinch:(UIPinchGestureRecognizer *)pinch{
//    NSLog(@"%f",pinch);
//    NSLog(@"%s",__func__);
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    
    //复位
    pinch.scale = 1;
    
}

#pragma mark - 长按手势

//默认会触发两次，开始触发的时候一次，手指抬起来的时候一次
-(void)setUpLongPress{
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    
    [self.imageView addGestureRecognizer:longpress];
}

-(void)longPress:(UILongPressGestureRecognizer *)longPress{
    if(longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"%s",__func__);
    }
}

#pragma mark - 轻扫手势

//默认轻扫手势的方向是向右，如果以后想向别的方向，可以设置它的direction属性来设置手势方向
//direction属性是一个枚举类型
-(void)setUpSwipe{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    
    //以后如果想要一个控件支持多个方向的轻扫，必须要创建多个轻扫手势，一个轻扫手势只能支持一个方向
    
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.imageView addGestureRecognizer:swipe];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"%s",__func__);
}


#pragma mark - 点按手势
-(void)tapAction:(UITapGestureRecognizer *)tap{
    NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 手势代理方法

//询问该手势是否可以被执行
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

//是否允许接受手指的触摸点
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

//是否允许同时支持多个手势，默认是不支持多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
