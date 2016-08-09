//
//  XMGStatusesViewController.m
//  备课03-不等高的cell-非代码
//
//  Created by MJ Lee on 15/6/2.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGStatusesViewController.h"
#import "XMGStatus.h"
#import "XMGStatusCell.h"

@interface XMGStatusesViewController ()
@property (strong, nonatomic) NSArray *statuses;
@end

@implementation XMGStatusesViewController

- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            XMGStatus *status = [XMGStatus statusWithDict:dict];
            [statusArray addObject:status];
        }
        
        _statuses = statusArray;
    }
    return _statuses;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGStatusCell *cell = [XMGStatusCell cellWithTableView:tableView];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
/**
 *  返回每一行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}


@end
