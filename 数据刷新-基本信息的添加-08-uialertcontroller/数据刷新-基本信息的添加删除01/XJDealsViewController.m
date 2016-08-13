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

@interface XJDealsViewController ()<UITableViewDataSource,UITableViewDelegate>

/**所有的团购数据*/
@property (nonatomic, strong)NSMutableArray *deals;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XJDealsViewController




-(NSMutableArray *)deals{
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
    
    //让tableView进入编辑模式
//    self.tableView.editing = YES;
    
//    注册
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([XJDealViewCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"deal"];
    
//      self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection ----- %zd",self.deals.count);
    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    //取出模型数据
//    XJDeal *deal = _deals[indexPath.row];
    

    XJDealViewCell *cell = [XJDealViewCell cellWithTableView:tableView];
    
    
    cell.deal = _deals[indexPath.row];
    
    

    return cell;
}

- (IBAction)add {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入团购信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        NSString *name = [alert.textFields[0] text];
        NSString *price = [alert.textFields[1] text];
        
        XJDeal *deal = [[XJDeal alloc]init];
        deal.title = name;
        deal.price = price;
        
//        [self.deals addObject:deal];
        [self.deals insertObject:deal atIndex:0];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        
 
//        [self.tableView reloadData];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
//    [alert addAction:[UIAlertAction actionWithTitle:@"11111" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入团购名字";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入团购价格";
    }];
    [self presentViewController:alert animated:YES completion:nil];
    
     
    
}


- (IBAction)remove:(id)sender {
    
    //移除模型数据
    [self.deals removeObjectAtIndex:0];
    
    //刷新表格
//    [self.tableView reloadData];
    
    //动画效果
    //deleteSections也具有刷新表格的功能
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)update {
    
    XJDeal *deal = self.deals[3];
    

    deal.price = [NSString stringWithFormat:@"%d",20+arc4random_uniform(70)];
    
    [self.tableView reloadData];
    
//    [self.tableView reloadSections:@[[NSIndexPath indexPathWithIndex:3]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0],
                                             [NSIndexPath indexPathForRow:4 inSection:0]
                                             ]withRowAnimation:UITableViewRowAnimationLeft];
}


#pragma mark - TableView代理方法
/**
 *  只要实现这个功能，左划cell出现删除按钮功能就有了
 *  当用户提交了添加/删除操作时候会调用
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"commitEditingStyle-------->");
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
    [self.deals removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"+++++++++++++++++");
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row % 2 == 0 ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}


//切换编辑模式
- (IBAction)switchEditing {
//    [self.tableView setEditing:YES animated:YES];
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

@end
