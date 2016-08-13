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
    
//    注册
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([XJDealViewCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"deal"];
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

    
    //取出模型数据
//    XJDeal *deal = _deals[indexPath.row];
    
//    static NSString *ID = @"deal";
//
//    XJDealViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if(cell == nil){
//        cell = [[XJDealViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"deal"];
//    }
    
    XJDealViewCell *cell = [XJDealViewCell cellWithTableView:tableView];
    
    cell.deal = _deals[indexPath.row];
    
    

    return cell;
}




@end
