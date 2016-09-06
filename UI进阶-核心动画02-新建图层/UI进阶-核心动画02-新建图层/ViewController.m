//
//  ViewController.m
//  UI进阶-核心动画02-新建图层
//
//  Created by liser on 16/9/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //创建一个图层。图层的类是以CA开头
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(50, 50, 200, 200);
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.contents = (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
    
    //注意：layer只能添加到layer上面，不能添加到别处
    [self.view.layer addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
