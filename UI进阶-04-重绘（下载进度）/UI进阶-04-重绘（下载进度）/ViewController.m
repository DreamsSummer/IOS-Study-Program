//
//  ViewController.m
//  UI进阶-04-重绘（下载进度）
//
//  Created by liser on 16/9/2.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ProgressLabel;

@property (weak, nonatomic) IBOutlet ProgressView *ProgressView;



@end

@implementation ViewController

- (IBAction)ProgressChange:(UISlider *)sender {
    
    
    //%% = %
    _ProgressLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    
    //给ProgressView赋值
    _ProgressView.progress = sender.value;
    //获取滑块的值
    NSLog(@"%f",sender.value);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
