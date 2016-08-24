//
//  XJLoginViewController.m
//  UI进阶-控制器的创建-03通讯录
//
//  Created by liser on 16/8/24.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJLoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface XJLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountField;

@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *remberSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation XJLoginViewController
/*
 数据传值：
 1.接收方一定要有属性接收
 2.控制器一定要拿到接收方
 
 **/


//在执行跳转之前调用这个方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@---%@",segue.sourceViewController,segue.destinationViewController);
    
    
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人列表",_accountField.text];
}


//记住密码开关状态改变的时候调用
- (IBAction)remberPwdChange:(id)sender {
    
    //如果取消记住密码，自动登录也需要取消勾选
    if(_remberSwitch.on == NO){
        [_autoLoginSwitch setOn:NO animated:YES];
//        _autoLoginSwitch.on = NO;
    }
}


//自动登录开关状态改变的时候调用
- (IBAction)autoLoginChange:(id)sender {
    if(_autoLoginSwitch.on == YES)
       [_remberSwitch setOn:YES animated:YES];
//        _remberSwitch.on = YES;
}


//点击登录按钮的时候调用
- (IBAction)Login:(id)sender {
    
    
    //提示用户 正在登录...
    [MBProgressHUD showMessage:@"正在登录ing"];
    
    //延迟判断
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //隐藏蒙版
        [MBProgressHUD hideHUD];
        
        //一般账号和密码都会存储在公司的服务器中，发送网络请求即可
        //判断账号密码是否正确
        if([_accountField.text isEqualToString:@"xj"] && [_pwdField.text isEqualToString:@"123"]){
            [self performSegueWithIdentifier:@"login2Contant" sender:nil];
        }
        else{
            [MBProgressHUD showError:@"用户名或密码错误"];
        }
    });
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //监听文本框是否有内容
//    self.accountField.delegate = self;
    
    //给文本框添加监听器
    //当两个任意文本框的内容改变，都会调用这个方法。
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textChange{
//    if(_accountField.text.length && _pwdField.text.length){
//        _loginBtn.enabled = YES;
//    }
//    else{
//        _loginBtn.enabled = NO;
//    }
    
    _loginBtn.enabled = (_accountField.text.length && _pwdField.text.length);
}

//当用户输入的时候调用，判断用户是否允许输入
//及时判断文本框有没有内容
//这个方法不能及时获取文本框的内容
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"%@",self.accountField.text);
    return YES;
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
