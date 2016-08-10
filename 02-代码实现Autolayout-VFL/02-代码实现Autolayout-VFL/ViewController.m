//
//  ViewController.m
//  02-代码实现Autolayout-VFL
//
//  Created by liser on 16/8/4.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    NSNumber *margin = @20;
    
    //添加水平方向的约束
    NSString *vfl = @"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView,redView);
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    
    
    //添加竖直方向的约束
    NSNumber *height = @40;
    NSString *vfl2 = @"V:[blueView(height)]-margin-|";
    NSDictionary *mertrics2 = NSDictionaryOfVariableBindings(margin,height);
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics2 views:views];
    [self.view addConstraints:constraints2];


    

    
//    添加红色剩余约束
    NSLayoutConstraint *redContraint1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *redConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [self.view addConstraint:redContraint1];
    [self.view addConstraint:redConstraint2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)test0{
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    /**添加水平方向的约束*/
    NSString *vfl = @"H:|-20-[abc]-20-|";
    NSDictionary *views = @{@"abc" : blueView};
    NSArray *constraints1= [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:nil views:views];
    [self.view addConstraints:constraints1];
    
    
    /**添加竖直方向的约束*/
    NSString *vfl2 = @"V:|-20-[abc(40)]";
    NSDictionary *views2 = @{@"abc":blueView};
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:nil views:views2];
    [self.view addConstraints:constraints2];
}

-(void)test1{
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    /**添加水平方向的约束*/
    NSString *vfl = @"H:|-20-[blueView]-20-|";
    NSDictionary *views = @{@"blueView" : blueView};
    NSArray *constraints1= [NSLayoutConstraint constraintsWithVisualFormat:vfl options:kNilOptions metrics:nil views:views];
    [self.view addConstraints:constraints1];
    
    
    //简化写法：定义宏
    /* This macro is a helper for making view dictionaries for +constraintsWithVisualFormat:options:metrics:views:.
     NSDictionaryOfVariableBindings(v1, v2, v3) is equivalent to [NSDictionary dictionaryWithObjectsAndKeys:v1, @"v1", v2, @"v2", v3, @"v3", nil];
     */
    NSDictionary *views3 = NSDictionaryOfVariableBindings(blueView);
    
    
    NSNumber *margin = @20;
    
    NSDictionary *mertrics = @{@"margin" : margin};
    /**添加竖直方向的约束*/
    NSString *vfl2 = @"V:|-margin-[blueView(40)]";
    //NSDictionary *views2 = @{@"blueView":blueView};
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics views:views3];
    [self.view addConstraints:constraints2];
}

@end
