//
//  ViewController.m
//  UI-02-UIView简介
//
//  Created by liser on 16/7/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick {
    UISwitch *s = [[UISwitch alloc]init];
    [self.view addSubview:s];
}

@end
