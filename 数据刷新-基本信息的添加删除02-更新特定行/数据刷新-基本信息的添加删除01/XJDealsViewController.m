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
    
    //tableView里面需要显示新的cell数据，只需要改变模型数据就好了
    XJDeal *deal = [[XJDeal alloc]init];
    
    
    deal.title = [NSString stringWithFormat:@"XX饭店大折扣，%d折",arc4random_uniform(50)];
    deal.price = [NSString stringWithFormat:@"%d",10 + arc4random_uniform(50)];
    deal.buyCount = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    deal.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
//    deal.icon = [UIImageView]
//    [self.deals addObject:deal];
    [self.deals insertObject:deal atIndex:0];
    
    
    
    //题型tableview，模型数据发生了变化，请重新识别，请重新向数据源索要数据
//    [self.tableView reloadData];
    
    //动画效果
    //insertRowsAtIndexPaths该方法不仅仅有动画功能，还具有reloadData功能
    //该方法的第一个参数可以传递一个数组，一次性插入多行数据并且做数据刷新，同时，不会刷新旧的数据，只会刷新一行
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    
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
