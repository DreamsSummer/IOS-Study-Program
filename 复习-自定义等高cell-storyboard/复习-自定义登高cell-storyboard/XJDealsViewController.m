//
//  XJDealsViewController.m
//  复习-自定义登高cell-storyboard
//
//  Created by liser on 16/8/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJDealsViewController.h"
#import "XJDeal.h"
#import "XJDealViewCell.h"

@interface XJDealsViewController ()

/**所有的团购数据*/
@property (nonatomic, strong)NSArray *deals;
@end

@implementation XJDealsViewController


-(NSArray *)deals{
    if(_deals == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"deals" ofType:@".plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *heroArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArray){
            XJDeal *deal = [XJDeal dealWithDict:dict];
            [heroArray addObject:deal];
        }
        _deals = heroArray;
    }
    return _deals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"deal";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //取出模型数据
    XJDeal *deal = _deals[indexPath.row];
    
    
//    设置数据
    UIImageView *iconView = (UIImageView *)[cell viewWithTag:10];
    iconView.image = [UIImage imageNamed:deal.icon];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:20];
    titleLabel.text = deal.title;
    
    UILabel *priceLabel = (UILabel *)[cell viewWithTag:30];
    priceLabel.text = [NSString stringWithFormat:@"￥%@",deal.price];
    
    UILabel *buyCount = (UILabel *)[cell viewWithTag:40];
    buyCount.text = [NSString stringWithFormat:@"%@人购买",deal.buyCount];
    return cell;
}




@end
