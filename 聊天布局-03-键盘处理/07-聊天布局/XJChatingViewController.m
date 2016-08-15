//
//  XJChatingViewController.m
//  07-聊天布局
//
//  Created by liser on 16/8/14.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "XJChatingViewController.h"
#import "XJMessage.h"
#import "XJMessageViewCell.h"

@interface XJChatingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSArray *messages;

@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpacing;

@end

@implementation XJChatingViewController


-(NSArray *)messages{
    if(_messages == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *messageArray = [NSMutableArray array];
        XJMessage *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            XJMessage *message = [XJMessage messageWithDict:dict];
            message.hideTime = [message.time isEqualToString:lastMessage.time];
            
            lastMessage = message;
            [messageArray addObject:message];
        }
        
        _messages = messageArray;
    }
    
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor redColor];
    leftView.frame = CGRectMake(0, 0, 10, 0);
    self.textFiled.leftView = leftView;
    self.textFiled.leftViewMode = UITextFieldViewModeAlways;
    
//    NSNotification *note = [NSNotification notificationWithName:@"出大事了" object:self
//                                                        userInfo:@{
//                                                                   @"Time":@"2013-8-15",
//                                                                   @"desc":@"也没有什么大事"
//                                                                   }];
//    
//    [[NSNotificationCenter defaultCenter] postNotification:note];
    
    //监听键盘通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - 键盘处理
-(void)keyboardWillShow:(NSNotification *)note{
//    NSLog(@"keyboard will show");
//    取出键盘最终的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    self.bottomSpacing.constant = rect.size.height;
    
//    NSLog(@"%@",note.userInfo);
//    取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)keyboardWillHide:(NSNotification *)note{
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    self.bottomSpacing.constant = 0;
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJMessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    
    cell.message = self.messages[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}


#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJMessage *message = self.messages[indexPath.row];
    
    return message.cellHeight;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    self.bottomSpacing.constant = 100;
    
//    退出键盘
    [self.view endEditing:YES];
//    self.bottomSpacing.constant = 0;
//    方法2
//    [self.textFiled resignFirstResponder];
//    方法3
//    [self.textFiled endEditing:YES];
}

@end
