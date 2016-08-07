//
//  ViewController.m
//  01-性能优化
//
//  Created by liser on 16/8/6.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc]init];
    
    tableView.frame = self.view.bounds;
    
    tableView.dataSource = self;
    
    tableView.rowHeight = 80;
    
    
    [self.view addSubview:tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

/**
 *  什么时候调用这个方法：每当有一个cell进入视野范围，就会调用
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    0.重用标识
//    被static修饰的局部变量：只会初始化一次，在整个程序运行过程中，只有一份内存.
    static NSString *ID = @"cell";
    
//    1.先根据cell标识去缓存池中查找可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    
    //UITableViewCell *cell = [[UITableViewCell alloc]init];
    
//    2.如果cell为nil（缓存池就找不到对应的cell）
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
//    覆盖数据
    //%zd 对应NSInteger
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 - %zd",indexPath.row];
    
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
