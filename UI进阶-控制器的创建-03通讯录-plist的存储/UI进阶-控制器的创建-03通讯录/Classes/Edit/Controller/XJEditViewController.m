//
//  XJEditViewController.m
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/26.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJEditViewController.h"
#import "XJContant.h"

@interface XJEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation XJEditViewController


//点击保存的时候调用
- (IBAction)save:(id)sender {
    //修改模型数据
    _contact.name = _nameField.text;
    _contact.phone = _phoneField.text;
    
    
    //让小弟做事情并刷新表格
    if(_block){
        _block();
    }
    
    
    //回到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
}

/*
控制器之间传值：一定要注意控制器的子控件有没有加载，一定要在子控件加载完成的时候才去给子控件赋值
一般在ViewDidLoad中给控件赋值
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航条的标题
    self.title = @"编辑界面";
    
    
    
    //设置导航条右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
    
    _nameField.text = _contact.name;
    _phoneField.text = _contact.phone;
    
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

-(void)textChange{
    _saveBtn.enabled = (_nameField.text.length && _phoneField.text.length);
}

//点击编辑的时候调用
-(void)edit:(UIBarButtonItem *)item{
    NSLog(@"%@",item);
    
    if([item.title isEqualToString:@"编辑"]){
        //更改右侧标题为取消
        item.title = @"取消";
    
        //让文本框允许编辑
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        
        //弹出电话文本框的内容
        [_phoneField becomeFirstResponder];
        
        //显示保存按钮
        _saveBtn.hidden = NO;
        

    }
    else{
        //更改右侧标题为编辑
        item.title = @"编辑";
    
//        [self.view endEditing:YES];
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        
        //显示保存按钮
        _saveBtn.hidden = YES;
        
        //还原数据
        _nameField.text = _contact.name;
        _phoneField.text = _contact.phone;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
