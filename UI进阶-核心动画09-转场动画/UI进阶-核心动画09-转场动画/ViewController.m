//
//  ViewController.m
//  UI进阶-核心动画09-转场动画
//
//  Created by liser on 16/9/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

static int i = 2;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //转场代码
    
    if(i == 4){
        i = 1;
    }
    
    //加载图片的名称
    NSString *imageN = [NSString stringWithFormat:@"%d",i];
    
    _imageView.image = [UIImage imageNamed:imageN];
    
    i++;
    
    //转场动画
    //转场动画和转场代码一定要写到一起
    CATransition *anim = [CATransition animation];
    
    anim.type = @"suckSffect";
    
    [_imageView.layer addAnimation:anim forKey:nil];
    
    
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
