//
//  ViewController.m
//  UI进阶-08-自定义对象归档
//
//  Created by liser on 16/8/27.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)save:(id)sender {
    Person *p = [[Person alloc]init];
    p.name = @"xj";
    p.age = 23;
    
    
    //获取cache
    NSString *cachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    
    //File文件的全路径
    //把自定义对象归档
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}




- (IBAction)read:(id)sender {
    NSString *cachePath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"person.data"];
    
    //解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%d",p.age);
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
