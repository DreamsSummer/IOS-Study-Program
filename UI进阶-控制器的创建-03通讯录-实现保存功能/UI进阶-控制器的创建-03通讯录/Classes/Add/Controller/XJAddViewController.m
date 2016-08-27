//
//  XJAddViewController.m
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/25.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJAddViewController.h"
#import "XJContant.h"
//#import "XJContantTableViewController.h" 

@interface XJAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneFiexld;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation XJAddViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneFiexld addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    

    
}

//点击添加的时候调用
- (IBAction)add:(id)sender {
    
    //0.把文本框的值包装成联系人模型
    XJContant *c = [XJContant contantWithName:_nameField.text phone:_phoneFiexld.text];
    
//    NSLog(@"%@",_contantVC);
    
    //1.把联系人模型传递到联系人控制器
//    self.contantVC.contant = c;
//    if([_delegate respondsToSelector:@selector(AddViewController:didClickAddBtnWithContact:)]){
//        [_delegate AddViewController:self didClickAddBtnWithContact:c];
//    }
    
    //1.把联系人添加到联系人控制器的数组,让联系人控制器刷新表格
    if(_block){
        _block(c);
    }
    
    //2.回到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textChange{
    _addBtn.enabled = (_nameField.text.length && _phoneFiexld.text.length);
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //主动弹出姓名文本框
    [_nameField becomeFirstResponder];
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
