//
//  ViewController.m
//  UI进阶-11-抽屉效果简单实现
//
//  Created by liser on 16/8/28.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"


//宏里面的#号，会自动把后面的参数编程C语言的字符串

//,表达式，只取右边的值
#define keyPath(objc,keyPath) @(((void)objc.keyPath,#keyPath))

//宏的操作原理:每输入一个字母就会把宏右边的拷贝，并自动补齐前面的内容

@interface ViewController ()

@property(nonatomic,weak)UIView *mainView;

@property(nonatomic,weak)UIView *leftView;

@property(nonatomic,weak)UIView *rightView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpChildView];
    
    //添加pan的手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
    
    //理由KVO时刻监听mainV的frame属性
    //addObserver:观察者，代表谁想监听  forKeyPath：表示你想要监听哪个属性 options：监听新值的改变
    //
    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    //如何把C语言字符串转换成OC字符串
    
    NSLog(@"%@",[keyPath(_mainView, frame) class]);
    
}


//只要frame改变，就会调用观察者的observeValueForKeyPath方法,通知你有新的值了
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if(_mainView.frame.origin.x > 0){  //向右边移动
        _leftView.hidden = YES;
    }
    else if(_mainView.frame.origin.x < 0){  //向左边移动
        _leftView.hidden = NO;
    }
    
}

//什么情况下需要用到自动提示宏



//在对象销毁的时候一定要移除观察者
-(void)dealloc{
    //移除观察者：一定要写
    [_mainView removeObserver:self forKeyPath:@"frame"];
    
}

#pragma mark - pan手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    //获取手指的移动位置
    CGPoint transp = [pan translationInView:self.view];
    
    //获取x轴的偏移量
    CGFloat offsetX = transp.x;
    
    
    _mainView.frame = [self frameWithOffsetX:offsetX];
    
    //复位
    [pan setTranslation:CGPointZero inView:self.view];
    
}

#pragma mark - 根据oddsetX计算Main的frame
-(CGRect)frameWithOffsetX:(CGFloat)offSetX{
    //修改main的frame
    CGRect frame = _mainView.frame;
    frame.origin.x += offSetX;
    
    return frame;
}

#pragma mark - 添加子控件
-(void)setUpChildView{
    
    //left
    UIView *leftView = [[UIView alloc]initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftView];
    
    //right
    UIView *rightView = [[UIView alloc]initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightView];
    
    
    //main
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mainView];
    
    self.mainView = mainView;
    self.leftView = leftView;
    self.rightView = rightView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
