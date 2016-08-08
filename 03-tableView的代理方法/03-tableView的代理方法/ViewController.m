//
//  ViewController.m
//  03-tableView的代理方法
//
//  Created by liser on 16/8/7.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource , UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource>


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"假数据";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.拿到cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //2.设置数据
    cell.textLabel.text = @"312321321";
    
    //3.返回cell
    return cell;
}

/**
 *  点击某个cell的时候调用
 *
 *  @param tableView 被点击的那一行
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click - %zd",indexPath.row);
}


/**
 *  取消选中某一行的时候调用
 *
 *  @param tableView 被取消选中的那一行
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselectRowAtIndexPath - %zd",indexPath.row);
}

/**
 *  告诉tableView第indexPath行cell的高度
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row% 2 == 0)
        return 100;
    
    return 70;
}

/**
 *  告诉tableView第section组的尾标签高度
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

/**
 *  告诉tableView第section组显示怎样的头部控件
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}
@end
