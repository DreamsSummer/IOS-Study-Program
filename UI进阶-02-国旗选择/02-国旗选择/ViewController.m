//
//  ViewController.m
//  02-国旗选择
//
//  Created by liser on 16/8/20.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "ViewController.h"
#import "XJFlag.h"
#import "XJFlagView.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

/**国旗数据*/
@property (nonatomic, strong)NSMutableArray *flags ;

@end

@implementation ViewController


-(NSMutableArray *)flags{
    if(_flags == nil){
        
        //装XJFlag模型
        _flags = [NSMutableArray array];
        
        //字典转模型
        
        //加载plist
        NSString *path = [[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *dict in array) {
            XJFlag *flag = [XJFlag flagWithDict:dict];
            
            [_flags addObject:flag];
        }
        
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    XJFlagView *flagView = [[[NSBundle mainBundle]loadNibNamed:@"XJFlagView" owner:nil options:nil]lastObject];
    
    
    //取出对应的模型
    XJFlag *flag = self.flags[row];
    flagView.flag = flag;
    return flagView;
    
}

@end
