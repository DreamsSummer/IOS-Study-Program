//
//  ViewController.m
//  UI进阶-核心动画06-时钟
//
//  Created by liser on 16/9/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

#define kClockW _clockView.bounds.size.width
#define kClockH _clockView.bounds.size.height

#define angle2radion(a) ((a)/180.0 * M_PI)


//每秒转6度
#define perSecondA 6

//每分钟分针转6度
#define perMinuteA 6

//每小时时针转动30度
#define perHourA 30

//每分钟时针转动0.5度
#define perHourMinA 0.5

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *clockView;

@property(nonatomic,weak)CALayer *secondLayer;

@property(nonatomic,weak)CALayer *MinuteLayer;

@property(nonatomic,weak)CALayer *HourLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    //添加分针
    [self setUpMinuteLayer];
    
    //添加秒针
    [self setUpSecondLayer];
    
    //添加时针
    [self setUpHourLayer];
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
}

-(void)timeChange{
    //获取当前的系统时间
    //获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //获取日期组件:年月日时分秒
    //components:需要获取的日期组件
    //fromDate:获取哪个日期的组件
    
    //经验:以后在一个枚举中有移位的运算符，通常可以使用“|”（并）运算符
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour fromDate:[NSDate date]];
    

    
    //计算秒针转动多少度
    CGFloat secondA = (cmp.second * perSecondA);
    
    //获取当前分针转动多少度
//    NSLog(@"%ld",cmp.minute);
    CGFloat MinuteA = (cmp.minute * perMinuteA);
    
    
//    NSLog(@"%ld",cmp.minute);
    NSInteger Minute = cmp.minute;
    
    //获取当前时针转动多少度
    CGFloat HourA = (cmp.hour * perHourA + Minute * perHourMinA);
    
    
    NSLog(@"%f",cmp.hour * perHourA + Minute * perHourMinA);
    
//    NSLog(@"%f",HourA);
    
    //旋转秒针
    _secondLayer.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    
    
    //旋转分针
    _MinuteLayer.transform = CATransform3DMakeRotation(angle2radion(MinuteA), 0, 0, 1);
    
    //旋转时针
    _HourLayer.transform =  CATransform3DMakeRotation(angle2radion(HourA), 0, 0, 1);
}

//添加秒针
-(void)setUpSecondLayer{
    CALayer *secondL = [CALayer layer];
    
    secondL.backgroundColor = [UIColor redColor].CGColor;
    
    
    //确定锚点
    secondL.anchorPoint = CGPointMake(0.5, 1);
    
    secondL.position = CGPointMake(kClockW * 0.5 , kClockH * 0.5 );
    
    
    secondL.bounds = CGRectMake(0, 0, 2, kClockH * 0.5 - 20);
    
    _secondLayer = secondL;
    
    [_clockView.layer addSublayer:secondL];
}


//添加分针
-(void)setUpMinuteLayer{
    CALayer *MinuteL = [CALayer layer];
    
    MinuteL.backgroundColor = [UIColor blackColor].CGColor;
    
//    MinuteL.borderWidth = 100;
    //确定锚点
    MinuteL.anchorPoint = CGPointMake(0.5, 1);
    
    MinuteL.position = CGPointMake(kClockW * 0.5 , kClockH * 0.5 );
    
    MinuteL.cornerRadius = 4;
    
    MinuteL.bounds = CGRectMake(0, 0, 4, kClockH * 0.5 - 30);
    
    _MinuteLayer = MinuteL;
    
    [_clockView.layer addSublayer:MinuteL];
}


//添加时针
-(void)setUpHourLayer{
    CALayer *HourL = [CALayer layer];
    
    HourL.backgroundColor = [UIColor blackColor].CGColor;
    
//    HourL.borderWidth = 100;
    //确定锚点
    HourL.anchorPoint = CGPointMake(0.5, 1);
    
    HourL.position = CGPointMake(kClockW * 0.5 , kClockH * 0.5 );
    
    
    HourL.bounds = CGRectMake(0, 0, 4, kClockH * 0.5 - 50);
    
    HourL.cornerRadius = 4;
    
    _HourLayer = HourL;
    
    [_clockView.layer addSublayer:HourL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
