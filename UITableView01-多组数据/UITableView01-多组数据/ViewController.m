//
//  ViewController.m
//  UITableView01-多组数据
//
//  Created by liser on 16/8/5.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.TableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UITableViewDataSource>


//告诉TableView第Session组一共有多少行

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section == 0){
        return 3;
    }
    else if(section == 1){
        return 4;
    }
    else if(section == 2){
        return 2;
    }
    else{
        return 2;
    }
}


/**
 *告诉tableView一共有多少组数据
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}



/**
 *告诉tableView第indexPath行显示怎样的cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            cell.textLabel.text = @"奥迪";
            cell.imageView.image = [UIImage imageNamed:@"m_9_100"];
            cell.detailTextLabel.text = @"123";

        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"宝马";
            cell.imageView.image = [UIImage imageNamed:@"m_3_100"];
        }
        else{
            cell.textLabel.text = @"奔驰";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
    }
    else if(indexPath.section == 1){
        if(indexPath.row == 0){
            cell.textLabel.text = @"本田";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
        else if(indexPath.row == 1){
            cell.textLabel.text = @"马自达";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
        else if(indexPath.row == 2){
            cell.textLabel.text = @"三菱";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
        else{
            cell.textLabel.text = @"丰田";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
    }
    else if(indexPath.section == 2){
        if(indexPath.row == 0){
            cell.textLabel.text = @"红旗";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
        else{
            cell.textLabel.text = @"比亚迪";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
    }
    else{
        if(indexPath.row == 0){
            cell.textLabel.text = @"法拉利";
            cell.imageView.image = [UIImage imageNamed:@"m_21_100"];
        }
        if(indexPath.row == 1){
            cell.textLabel.text = @"兰博基尼";
            cell.imageView.image = [UIImage imageNamed:@"m_21_100"];
        }
    }
    return cell;
}


/**
 *告诉tableView的头部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"德系";
    }
    else if(section == 1){
        return @"日系";
    }
    else if(section == 2){
        return @"中国";
    }
    else{
        return @"意大利系";
    }
}

/**
 *告诉tableview第section组的尾部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section == 0){
        return @"德系车";
    }
    else if(section == 1){
        return @"日系车";
    }
    else if(section == 2){
        return @"中国车";
    }
    else{
        return @"意大利车";
    }
}
@end
