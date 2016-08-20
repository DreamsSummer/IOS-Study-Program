//
//  ViewController.m
//  点餐系统
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

/**食品数据*/
@property (nonatomic, strong)NSArray *foods;
@end


@implementation ViewController


-(NSArray *)foods{
    if(_foods == nil){
        
        //加载plist文件
        NSString *path = [[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil];
        
        //大数组：pickerView有多少列
        _foods = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _foods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pickerView.delegate = self;
    
    for (int i = 0; i < 3; i++) {
    [self pickerView:nil didSelectRow:0 inComponent:i];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.返回pickerView有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foods.count;
}


//返回指定列有多少行
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)componet{
    return [self.foods[componet] count];
}


// returns width of column and height of row for each component.
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED;
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED{
//    
//}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect

//返回component列第row行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.foods[component][row];
}

//NSAttributedString富文本属性：可以描述文字的大小和颜色
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED; // attributed title is favored if both methods are implemented


//总结：如果同时返回字符串和UIView的方法，返回UIView的优先级比较高
//返回第component列第row行的View
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
//    v.backgroundColor = [UIColor redColor];
//    return v;
//}
//


//选中第component列第row行调用
//__func__:返回当前方法在哪个类里面调用
//注意：这个方法必须用户主动拖动pickerView 才能调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    NSLog(@"%s",__func__);
    
    
    
    switch (component) {
        case 0:
            //设置水果的Label
            _fruitLabel.text = self.foods[component][row];
            break;
        case 1:
            //设置主食的Label
            _mainLabel.text = self.foods[component][row];
            break;
        case 2:
            //设置饮料的Label
            _drinkLabel.text = self.foods[component][row];
            break;
            
    }
    
}

- (IBAction)random:(id)sender {
    
    //pickerView每一列随机选中一行
    //随机选中的文字展示到label
    
//    [_pickerView selectRow:arc4random_uniform(self.foods.count) inComponent:0 animated:YES];
    
    //取出第0列的行数
    
//    command + option + [ 代码上跳
//    command + [  代码左移
    
    for (int i = 0 ; i < 3; i++ ) {
        
        NSInteger count = [self.foods[i]count];
        
        int random = arc4random_uniform((u_int32_t)count);
        
        [_pickerView selectRow:random inComponent:i animated:YES];
        
        [self pickerView:nil didSelectRow:random inComponent:i];
    }
}

@end
