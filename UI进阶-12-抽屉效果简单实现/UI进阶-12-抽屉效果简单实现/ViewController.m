//
//  ViewController.m
//  UI进阶-12-抽屉效果简单实现
//
//  Created by liser on 16/9/1.
//  Copyright © 2016年 liser. All rights reserved.
//


#define screenW [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)UIView *leftView;

@property(nonatomic,weak)UIView *rightView;

@property(nonatomic,weak)UIView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpChildView];
    
    //添加Pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
    
    //利用KVO时刻监听main_V的frame属性
    //Observer:观察者，谁想监听
    //KeyPath:监听的属性
    //options:监听新值的改变
//    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    //添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tap];
    
}

#pragma  mark - 点按手势的实现方式
-(void)tap:(UITapGestureRecognizer *)tap{
    if(_mainView.frame.origin.x != 0){
        [UIView animateWithDuration:0.25 animations:^{
            _mainView.frame = self.view.bounds;
        }];
    }
}

//只要监听的属性一改变，就会调用观察者的这个方法，通知你有新值
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if(_mainView.frame.origin.x  > 0 ){
        _rightView.hidden = YES;
    }
    else if(_mainView.frame.origin.x < 0){
        _rightView.hidden = NO;
    }
    
}


-(void)dealloc{
    //移除观察者
    [_mainView removeObserver:self forKeyPath:@"frame"];
}

#pragma mark - Pan的方法

#define kTargetR 275
#define kTargetL -250
-(void)pan:(UIPanGestureRecognizer *)pan{
    //获取手势移动的位置
    CGPoint transP = [pan translationInView:self.view];
    
    //获取X轴偏移量
    CGFloat offSetX = transP.x;
    
    //修改mainV的偏移量
    _mainView.frame = [self frameWithOffX:offSetX];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    //复位
    [pan setTranslation:CGPointZero inView:self.view];
    
    
    //判断当手势结束的时候做一个定位功能
    if(pan.state == UIGestureRecognizerStateEnded){
        //1.判断一下mainView的X>screenW * 0.5  定位到X = 275
        CGFloat target = 0 ;
        if(_mainView.frame.origin.x > screenW * 0.5 ){
            //定位到右边
            target =  kTargetR;
        }
        else if(CGRectGetMaxX(_mainView.frame) < screenW * 0.5 ){
            target = kTargetL;
        }
        
        //获取X轴偏移量
        CGFloat offsetX = target - _mainView.frame.origin.x;
        
        [UIView animateWithDuration:0.5 animations:^{
            _mainView.frame = target == 0 ? self.view.bounds : [self frameWithOffX:offsetX];
        }];
        
        
//        if(target == 0){
//            //还原
//            _mainView.frame = self.view.bounds;
//            
//        }
//        else{
//            //获取X轴偏移量
//            CGFloat offsetX = target - _mainView.frame.origin.x;
//            
//            _mainView.frame = [self frameWithOffX:offsetX];
//        }
        
        
        //3.其他情况全部还原
        
       
        
    }
    
}

#pragma mark - 根据offsetX计算mainV的Frame
#define kMaxY 80
-(CGRect)frameWithOffX:(CGFloat)offSetX{
    
    CGRect frame = _mainView.frame;
    
    //获取屏幕的高度
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    //获取屏幕的宽度
//    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    //X轴每平移一点，Y轴需要移动
    CGFloat offSexY = offSetX * kMaxY / screenW;
    
    //获取当前高度
   
    
    CGFloat curH =  frame.size.height - 2 * offSexY;
    if(frame.origin.x < 0){
        curH =  frame.size.height + 2 * offSexY;
    }//向左移动
    
    
    //获取上一次的宽度
    CGFloat preW = frame.size.width;
    
    //获取上一次的高度
    CGFloat preH = frame.size.height;
    
    
    //获取尺寸的缩放比例
    CGFloat scale = curH / preH;
    
    //获取当前宽度
    CGFloat curW = preW * scale;
    
    
    //获取当前的X
//    CGFloat X = frame.origin.x + offSexY;
    
    //获取当前的Y
    CGFloat Y = (screenH -  curH ) / 2 ;
    
    frame.origin.y = Y;
//    frame.origin.x = X;
    frame.origin.x += offSetX ;
    frame.size.height = curH;
    frame.size.width = curW;
    
//    frame.origin.x += offSetX;
    
    return frame;
}


#pragma mark - 添加子控件
-(void)setUpChildView{
    //left
    UIView *leftView = [[UIView alloc]initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    _leftView = leftView;
    
    //right
    UIView *rightView = [[UIView alloc]initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightView];
    _rightView = rightView;
    
    
    //main
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    _mainView = mainView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
