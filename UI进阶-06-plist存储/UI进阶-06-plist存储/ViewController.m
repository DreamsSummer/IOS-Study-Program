//
//  ViewController.m
//  UI进阶-06-plist存储
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

//点击保存的时候调用
- (IBAction)save:(id)sender {
    
    
    //如何判断一个对象能不能使用Plist存储，就看一下有没有writeToFile
    //Plist:数组和字典
    //Plist存储注意：不能存储自定义对象
    Person *p = [[Person alloc]init];
    NSArray *arr = @[@"123",@1,p];

    
    //获取应用的文件夹（应用沙盒）NSHomeDirectory()
//    NSString *homePath = NSHomeDirectory();
    
//    NSLog(@"%@",homePath);
    
    
    //获取temp文件夹
//    NSTemporaryDirectory();
    
    
    
    //获取Cache的文件夹
    //NSSearchPathDirectory:搜索的目录
    //NSSearchPathDomainMask:搜索范围 NSUserDomainMask表示在用户的范围查找（用户的手机上）
    //expandTilde:是否展开全路径，如果没有展开，应用的沙盒路径就是一个波浪号
    //存储一定要展开路径
    NSString *CachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)[0];
    
    //拼接文件名
    NSString *filePath = [CachePath stringByAppendingPathComponent:@"arr.plist"];
    
    NSLog(@"%@",filePath);
    
//    NSLog(@"%@",CachePath);
    //File:文件的全路径
    [arr writeToFile:filePath atomically:YES];
}


//点击读取的时候调用
- (IBAction)read:(id)sender {
    NSString *CachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)[0];
    
    //拼接文件名
    NSString *filePath = [CachePath stringByAppendingPathComponent:@"arr.plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSLog(@"%@",arr);
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
