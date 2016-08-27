//
//  ViewController.m
//  04-Block讲解
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

//name是block类型的别名
typedef void(^Myblock)(int a);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
     blockName---block变量名
     returnType(^blockName)(parameterTypes) = ^(parameters) {
     statements
     };
    //如何定义block(inline)
    void(^block)() = ^(){
        NSLog(@"block");
    };
    
    //调用block
    block();
    
    block类型:void(^)()
    */
    
    Myblock myblock = ^(int a){
        NSLog(@"%d",a);
    };
    
    myblock(2);
    
    //block作用:根函数和代码很像，其实就是用来保存一段代码，等到恰当的时候在去使用
    
    //什么时候使用block,逆传一般用来传值，处理网络的时候经常使用block封装代码
    
    //请求网络数据（延迟），先把展示到控件的代码先保存到block，等请求到数据的时候直接调用Block
    
    //通讯录Block使用
    //点击保存，通知联系人刷新表格，用代理
    //block:小弟   代理:打电话
    //block先把刷新表格的代码保存起来
    //等用户点击了保存按钮的时候，调用block 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
