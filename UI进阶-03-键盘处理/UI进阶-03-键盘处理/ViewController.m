//
//  ViewController.m
//  UI进阶-03-键盘处理
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "XJProvinces.h"

@interface ViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

@property(nonatomic,weak)UIDatePicker *picker;

@property(nonatomic,strong)NSMutableArray *provinces;

@property(nonatomic,weak)UIPickerView *pickView;

//记录当前选中的省会的角标
@property(nonatomic,assign)NSInteger proIndex;

@end

@implementation ViewController


-(NSMutableArray *)provinces{
    if(_provinces == nil){
        
        _provinces = [NSMutableArray array];
        
        
        //加载plist文件
        NSString *path = [[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *dict in array) {
            //字典转模型
            XJProvinces *province = [XJProvinces ProvinceWithDict:dict];
            
            [_provinces addObject:province];
        }
    }
    return _provinces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _birthdayTextField.delegate = self;
    
    _cityTextField.delegate = self;
    
    [self setUpBirthdayKeyboard];
    
    [self setUpCityKeyboard];
    
}


//自定义城市键盘
-(void)setUpCityKeyboard{
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    
    _pickView = pickerView;
    
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    
    
    
    
    _cityTextField.inputView = pickerView;
}


#pragma mark - 数据源

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

//pickerView 的第0列描述省会，有多少个省
//pickerView 的第1列描述选中的省会，有多少个城市
//有一列的数据是根据上一列的数据决定的，二级联动问题
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){//描述省会的数据
        return self.provinces.count;
    }
    else{//根据所选择的省会，加载每个省会的城市
        
        XJProvinces *p = self.provinces[_proIndex];
        return p.cities.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if(component == 0){
        
        //获取省会
        XJProvinces *p = self.provinces[row];
        
        return p.name;
    }
    else{
        
        XJProvinces *p = self.provinces[_proIndex];
        
        return p.cities[row];
    }
}

//全局断点就是帮我们定位到出现bug的那一行。
//二级联动的bug的产生原因：当前选中内蒙古省，只有12个城市，角标0-11 但是右边城市是北京的，

#pragma mark - 代理
//滚动pickerView的时候调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){   //滚动省会，刷新第1列
        
        _proIndex =[pickerView selectedRowInComponent:0];
        [pickerView reloadComponent:1];
    }
    
    //给文本框赋值
    
    XJProvinces *p = self.provinces[_proIndex];
    //获取选中的城市
    NSInteger index2 = [pickerView selectedRowInComponent:1];
    
    NSString *cityName = p.cities[index2];
    
    _cityTextField.text = [NSString stringWithFormat:@"%@ %@",p.name,cityName];
}


//自定义生日键盘
-(void)setUpBirthdayKeyboard{
    
    //创建UIDatePicker
    //注意：UIDatePicker有默认的尺寸，可以不用设置frame
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    
    _picker = picker;
    //设置UIDatePicker的地区:zh:中国
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    
    //更改UIDatePicker的模式
    picker.datePickerMode = UIDatePickerModeDate;
    
    
    //监听UIDatePicker的滚动
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    

    
    _birthdayTextField.inputView = _picker;

}

//当UIDatePicker滚动的时候调用
-(void)dateChange:(UIDatePicker *)datePicker{
//    NSLog(@"%@",datePicker.date);
    
    //日期转换字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *datestr = [fmt stringFromDate:datePicker.date];
    
    _birthdayTextField.text = datestr;
}

//当文本框开始编辑的时候调用
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //获取当前的datePicker的日期
    if(textField == _birthdayTextField){
        [self dateChange:_picker];
    }
    
    else{
        [self pickerView:_pickView didSelectRow:0 inComponent:0];
    }
    
}


//是否允许改变（输入）文本框的文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}// return NO to not change text



@end
