//
//  XJContantTableViewController.m
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/24.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJContantTableViewController.h"
#import "XJAddViewController.h"
#import "XJContant.h"
#import "XJEditViewController.h"

@interface XJContantTableViewController ()<UIActionSheetDelegate>

@property(nonatomic,strong)NSMutableArray *contacts;

@end

@implementation XJContantTableViewController


-(NSMutableArray *)contacts{
    
    //从读取本地数据开始
    if(_contacts == nil){
        
        
        
        NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        
        NSString *filePath = [cachePath stringByAppendingPathComponent:@"contact.data"];
        
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        
//        _contacts = [NSMutableArray array];
        
        
    }
    return _contacts;
}


-(void)setContant:(XJContant *)contant{
    _contant = contant;
    
    NSLog(@"%@",contant.name);
}

//跳转之前调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    XJAddViewController *addVC = segue.destinationViewController;
    
//    addVC.contantVC = self;
//    addVC.delegate = self;
    
    addVC.block = ^(XJContant *contact){
      
        //把联系人添加到数组
        [self.contacts addObject:contact];
        
        
        //刷新表格
        [self.tableView reloadData];
        
        NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        
        NSString *filePath = [cachePath stringByAppendingPathComponent:@"contact.data"];
        
        //保存联系人 注意:如果归档数组，底层会遍历数组元素一个一个的归档
        [NSKeyedArchiver archiveRootObject:self toFile:filePath];
    };
}

-(void)AddViewController:(XJAddViewController *)addVC didClickAddBtnWithContact:(XJContant *)contact{
//    NSLog(@"%s,%@",__func__,contact.name);
    //把添加界面传过来的联系人模型传递到联系人界面
    
    //把联系人模型保存在数组中
    [self.contacts addObject:contact];
    
    //刷新表格
    [self.tableView reloadData];
}

//点击注销的时候调用
- (IBAction)logoutBar:(id)sender {
    //弹出actionsheet
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    
//    UIAlertControllerStyleActionSheet *shee = [[UIAlertController alloc]ini
    
    [sheet showInView:self.view];
}


//点击action控件上的按钮调用
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%ld",buttonIndex);
    if(buttonIndex == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //取消分割线
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    //tableView有数据的时候才需要分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建标示符
    static NSString *ID = @"cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    
    //获取模型
    XJContant *c = self.contacts[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    
    return cell;
}


#pragma mark - TableView的代理方法
//点击cell的时候调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //创建编辑控制器
    XJEditViewController *VC = [storyboard instantiateViewControllerWithIdentifier:@"edit"];
    
    VC.contact = self.contacts[indexPath.row];
    VC.block = ^(){//刷新表格
        [self.tableView reloadData];
    };

//    跳转到编辑界面
    [self.navigationController pushViewController:VC animated:YES];
}
@end
