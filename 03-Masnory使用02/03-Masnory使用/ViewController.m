//
//  ViewController.m
//  03-Masnory使用
//
//  Created by liser on 16/8/6.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"


//添加之后，可以省去加上mas前缀的麻烦
#define MAS_SHORTHAND

//添加之后可以让Masonry框架实现自动包装
#define MAS_SHORTHAND_GLOBALS


//CocoaPods管理第三方 pod install

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //蓝色控件
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //红色控件
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    CGFloat margin = 20;
    CGFloat height = 50;
    //添加约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {

        
        make.left.equalTo(self.view.left).offset(margin);
        make.right.equalTo(redView.left).offset(-margin);
        
        make.bottom.equalTo(self.view).offset(-margin);
        make.height.equalTo(height);
        
        make.top.equalTo(redView.top);
        make.bottom.equalTo(redView.bottom);
        make.width.equalTo(redView.width);
        
        
        
    }];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-margin);
        
    }];
}



-(void)test3{
    //蓝色控件
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //添加约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.width).multipliedBy(0.5);
        
        make.height.equalTo(self.view.height).multipliedBy(0.5);
        
        
        //添加了自动包装之后的功能
        //make.width.equalTo(100);
        
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
        
    }];
}

-(void)test2{
    
    
    //蓝色控件
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    
    //居中
    //尺寸是父控件的一半
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        设置宽度高度约束：设置蓝色控件的宽度高度是父控件的一半
        //        make.size.mas_equalTo(self.view).multipliedBy(0.5);
        //          设置位置约束：设置蓝色控件的中间点和父控件的中心点一样
        //        make.center.mas_equalTo(self.view);
        //        make.centerX.mas_equalTo(self.view);
        //        make.centerY.mas_equalTo(self.view);
        
        
        //        距离父控件的上下左右都是50间距
        //        make.left.mas_equalTo(self.view.mas_left).offset(50);
        //        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        //        make.top.mas_equalTo(self.view.mas_top).offset(50);
        //        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
        
        
        //        精简写法
        //        make.left.offset(50);
        //        make.right.offset(-50);
        //        make.top.offset(50);
        //        make.bottom.offset(-50);
        
        //        精简写法
        //        make.left.top.offset(50);
        //        make.right.bottom.offset(-50);
        
        //        精简写法
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
        
    }];
}

-(void)test{
    //尺寸限制：100*100
    //位置：粘着父控件右下角，间距是20
    
    
    
    /**
     mas_equalTo:这个方法会对参数进行包装
     equalTo:这个方法不会对参数进行包装
     mas_equalTo的功能强于 > equalTo
     */
    //这个方法只会添加新的约束
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //宽度约束
//        make.width.equalTo(@100);
//        //        make.width.mas_equalTo(100);
//        
//        
//        //高度约束
//        make.height.equalTo(@100);
//        //        make.height.mas_equalTo(100);
//        
//        
//        //        make.height.width.mas_equalTo(100);
//        
//        //        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)   ]);
//        
//        //        make.size.mas_equalTo(100);
//        
//        
//        //        高度宽度约束
//        //        make.size.equalTo(self.view).multipliedBy(0.5).offset(-50);
//        
//        
//        //右边约束
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        //        make.right.equalTo(self.view).offset(-20);
//        
//        
//        //底部约束
//        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
//        //        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
//    }];
    
    
    /*
     
     //这个方法会将以前的所有约束删掉，添加新的约束
     [blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
     <#code#>
     }];
     
     //这个方法将会覆盖以前的某些特定的约束
     [blueView mas_updateConstraints:^(MASConstraintMaker *make) {
     <#code#>
     }];
     
     */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
