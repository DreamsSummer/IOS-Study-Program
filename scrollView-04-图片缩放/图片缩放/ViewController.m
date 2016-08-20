//
//  ViewController.m
//  图片缩放
//
//  Created by liser on 16/7/30.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *uiscrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *ImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    
    [self.uiscrollView addSubview:ImageView ];
    
    self.uiscrollView.backgroundColor = [UIColor redColor];
    
    self.uiscrollView.contentSize = ImageView.image.size;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
