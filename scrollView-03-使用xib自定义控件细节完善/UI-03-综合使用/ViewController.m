//
//  ViewController.m
//  UI-03-综合使用
//
//  Created by liser on 16/7/12.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"
#import "XJShopView.h"

@interface ViewController ()

/**大框*/
@property (weak, nonatomic) IBOutlet UIView *stopsView;

/**添加按钮*/
@property (weak, nonatomic) UIButton *addBtn;

/**删除按钮*/
@property (weak, nonatomic) UIButton *removeBtn;

/**存放资源的数组*/
@property (strong, nonatomic) NSArray *shops;

/**蒙板*/
@property (weak, nonatomic) IBOutlet UILabel *hud;
@end

@implementation ViewController


/**使用懒加载*/
-(NSArray *)shops{
    if(_shops == nil){
        NSBundle *bundle  = [NSBundle mainBundle];
        NSString *file = [bundle pathForResource:@"shops" ofType:@"plist"];
        
        NSArray *dictArray =[NSArray arrayWithContentsOfFile:file];
        NSMutableArray *shopArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArray){
            Shop *shop = [Shop shopWithDict:dict];
            
            [shopArray addObject:shop];
        }
        
        _shops = shopArray;
    }
    
    return _shops;
}


-(UIButton *)addButtonWithImage:(NSString *)image highImage:(NSString *)highImage disabledImage:(NSString *)disableImage frame:(CGRect)frame action:(SEL)action{
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    
    btn.frame = frame;
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    return btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    创建按钮
//    UIButton *addBtn = [[UIButton alloc]init];
    
////    设置背景图片
//    [addBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
//    [addBtn setBackgroundImage:[UIImage imageNamed:@"add_highlighted"] forState:UIControlStateHighlighted];
//    [addBtn setBackgroundImage:[UIImage imageNamed:@"add_disabled"] forState:UIControlStateDisabled];
//    
////    设置控件位置，宽和高
//    addBtn.frame = CGRectMake(30, 30, 50, 50);
//    addBtn.tag = 10;
    
    
    
//    设置事件代理
//    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    
//    添加按钮
//    [self.view addSubview:addBtn];
    
    
//    UIButton *addBtn = [[UIButton alloc]init];
    
    self.addBtn = [self addButtonWithImage:@"add" highImage:@"add_highlighted" disabledImage:@"add_disabled" frame:CGRectMake(30, 30, 50, 50) action:@selector(add)];
    
    self.removeBtn = [self addButtonWithImage:@"remove" highImage:@"remove_highlighted" disabledImage:@"remove_disabled" frame:CGRectMake(270, 30, 50, 50) action:@selector(remove)];
    
    
    //凡是参数名为file，则文件名必须为全路径
    //但是写成全路径的形式是不可取的，因为如果对于开发手机APP来说，手机APP不能加载电脑上面的资源
//    NSString *file = @"/Users/liser-pc/Documents/UI/0526UI/UI-03-综合使用/UI-03-综合使用/shops.plist";
    
    //一个NSBundle对象对应一个资源包（图片、音频、视频、plist文件等）
//    NSBundle的作用：用来访问与之对应的资源包内部的文件，可以用来获得文件的全路径
//    项目中添加的资源都会被添加到主资源包中，利用mainBundle,它关联的就是项目中的主资源包
//    利用mainBundle获取plist在主资源包中的全路径(两种写法)
//    NSBundle *bundle  = [NSBundle mainBundle];
//    NSString *file = [bundle pathForResource:@"shops" ofType:@"plist"];
//    NSString *file = [bundle pathForResource:@"shops.plist" ofType:nil];
//    
//    self.shops =[NSArray arrayWithContentsOfFile:file];
    
    
    
//
//    UIButton *removeBtn = [[UIButton alloc]init];
//
//    [removeBtn setBackgroundImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
//    [removeBtn setBackgroundImage:[UIImage imageNamed:@"remove_highlighted"] forState:UIControlStateHighlighted];
//    [removeBtn setBackgroundImage:[UIImage imageNamed:@"remove_disabled"] forState:UIControlStateDisabled];
//    
//    removeBtn.frame = CGRectMake(300, 30, 50, 50);
//    removeBtn.tag = 20;
//    [removeBtn addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:removeBtn];
    
//    [self check];
    
    _removeBtn.enabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)add{
    
    /**存放商品信息的数组*/
   
    
//    超出边界裁剪
    self.stopsView.clipsToBounds = YES;
    
    
//    NSLog(@"点击了添加");
    
//    每一个商品的尺寸
    CGFloat shopW = 70;
    CGFloat shopH = 90;
    
//    一行的列数
    int cols = 3;
    int rows = 3;

    
//    首先创建一个父控件，然后将图片和文字添加到父控件中
//    XJShopView *shopView = [[XJShopView alloc]init];
    
//    XJShopView *shopView = [[[NSBundle mainBundle]loadNibNamed:[XJShopView xibName] owner:nil options:nil]firstObject];
    
    XJShopView *shopView = [XJShopView shopView];

    
    CGFloat colMargin = (self.stopsView.frame.size.width - cols * shopW)/(cols-1);
    CGFloat rowMargin = (self.stopsView.frame.size.height - rows * shopH)/(rows-1);
    
//    商品的索引
    NSUInteger index = self.stopsView.subviews.count;
//
//    UIImageView *iconView = (UIImageView *)[shopView viewWithTag:10];
//    UILabel *nameLabel = (UILabel *)[shopView viewWithTag:20];
//    
//    Shop *shop = self.shops[index];
    
    shopView.shop = self.shops[index];
    
//    iconView.image = [UIImage imageNamed:shop.icon];
//    nameLabel.text = shop.name;
    
    
    
//    shopView.shop = self.shops[index];
//    商品的x值
    NSUInteger col = index % cols;
    CGFloat shopX = col * (shopW + colMargin);
    
//商品的Y值
    NSUInteger row = index / 3 ;
    CGFloat shopY = row * (shopH + rowMargin);
    
//    shopView.backgroundColor = [UIColor whiteColor];
    shopView.frame = CGRectMake(shopX, shopY, 70, 90);
    
    [self.stopsView addSubview:shopView];
//    NSDictionary *dict = self.shops[index];
//    Shop *shop = [Shop shopWithDict:dict];
    
//    Shop *shop = self.shops[index];
    

    
//    UIImageView *iconView = [[UIImageView alloc]init];
//    iconView.image = [UIImage imageNamed:shop.icon];
//    iconView.frame = CGRectMake(0, 0, 70, 70);
////    iconView.backgroundColor = [UIColor blueColor];
//    [shopView addSubview:iconView];
    
    
//    UILabel *label = [[UILabel alloc]init];
//    label.text = shop.name;
//    label.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
//    label.font = [UIFont systemFontOfSize:11];
//    label.textAlignment = NSTextAlignmentCenter;
//    [shopView addSubview:label];
//
//    if(self.stopsView.subviews.count == _shops.count)
//        _addBtn.enabled = NO;
    
    [self check];
    
    
}

-(void)remove{
    [self.stopsView.subviews.lastObject removeFromSuperview];
    
    [self check];
}

-(void)click:(UIButton *)btn{
    if(btn.tag == 10){
        NSLog(@"点击了添加");
    }
    else{
        NSLog(@"点击了删除");
    }
}


#pragma mark 检查状态：按钮状态
-(void)check{
    
//    判断添加按钮什么时候能够点击
    _addBtn.enabled = (self.stopsView.subviews.count != self.shops.count);
    
    
//    判断删除按钮什么时候能够点击
    _removeBtn.enabled = (self.stopsView.subviews.count != 0);

//显示HUD
    
    if(_addBtn.enabled == NO){
        _hud.alpha = 1.0;
        
        _hud.text = @"衣柜已经满了！";
        
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
    }
    else if(_removeBtn.enabled == NO){
        _hud.alpha = 1.0;
        
        _hud.text = @"衣柜已经空了！";
        
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.5];
    }
    
    
}


/**
 
 指示器：（提示用户发生了什么事情）
HUD
蒙板
遮盖
*/
#pragma mark HUD
-(void)hideHUD{
    self.hud.alpha = 0.0;
}

@end
