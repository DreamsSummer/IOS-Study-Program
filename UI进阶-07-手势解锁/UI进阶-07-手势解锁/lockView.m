//
//  lockView.m
//  UI进阶-07-手势解锁
//
//  Created by liser on 16/9/3.
//  Copyright © 2016年 liser. All rights reserved.
//

#import "lockView.h"

@interface lockView()

@property(nonatomic,strong)NSMutableArray *selectedBtn;

@property(nonatomic,assign)CGPoint curP;
@end

@implementation lockView


-(NSMutableArray *)selectedBtn{
    if(_selectedBtn != nil){
        _selectedBtn = [NSMutableArray array];
    }
    
    return _selectedBtn;
}

-(IBAction)pan:(UIPanGestureRecognizer *)pan{
    _curP = [pan locationInView:self];
    
    //判断点是否点击按钮
    for (UIButton *btn in self.subviews) {
        
        //点在不在某个范围内,并且按钮没有被选中
        if(CGRectContainsPoint(btn.frame, _curP) && btn.selected == NO){
            //点在按钮上
            btn.selected = YES;
            //保存到数组中
            [self.selectedBtn addObject:btn];
        }
    }
    
    
    
    //重绘
    [self setNeedsDisplay];
    
    
    if(pan.state == UIGestureRecognizerStateEnded){
        //保存密码
        NSMutableString *strM = [NSMutableString string];
        for (UIButton *btn in _selectedBtn) {
            [strM appendFormat:@"%ld",btn.tag];
            
        }
        
        
        //还原界面
        
        //清除画线，把选中的按钮清空
        [self.selectedBtn removeAllObjects];
        
        
        //取消所有按钮的选中
        [self.selectedBtn makeObjectsPerformSelector:@selector(setSelector:) withObject:@(NO)];
        
        
        //在输入按钮的时候对比一下字符串
    }
}

//加载完xib的时候调用
-(void)awakeFromNib{
    
    //创建9个按钮
    for (int i = 0 ; i < 9 ; i++ ) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.userInteractionEnabled = NO;
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        btn.tag = i;
        
        [self addSubview:btn];
        
    }
    
    //添加pan手势(storyboard)
    
    
    //重绘
    [self setNeedsDisplay];
    
    
    
    
}

//为什么要在这个方法中布局子控件:因为只要一调用这个方法，就表示父控件的尺寸确定了。
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger clos = 3;
    
    CGFloat x = 0 ;
    CGFloat y = 0 ;
    CGFloat w = 74 ;
    CGFloat h = 74 ;
    
    CGFloat margin = (self.bounds.size.width - clos * w)/(clos + 1 );
    NSInteger col = 0 ;
    NSInteger row = 0 ;
    
    NSInteger count = self.subviews.count;
    for (int i = 0 ; i < count; i++ ) {
        col = i % clos;
        row = i / clos;
        y = row *(margin + h);
        UIButton *btn = self.subviews[i];
        x = margin + col * (margin + w );
        btn.frame = CGRectMake(x, y, w, h);
}
}



//只要调用这个方法，就会把之前绘制的东西全部清空，重新绘制
-(void)drawRect:(CGRect)rect{
    
    if(self.selectedBtn.count == 0)
        return;
    
    //把所有选中的按钮中心点连线
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起点
    NSInteger count = self.selectedBtn.count;
    for (int i = 0 ; i < count; i++) {
        UIButton *btn = self.subviews[i];
        if(i == 0){
            [path moveToPoint:btn.center];
        }
        else{
            [path addLineToPoint:btn.center];
        }
    }
    
    
    //连线到手指的触摸点
    [path addLineToPoint:_curP];
    
    
    //表示所有选中的按钮都已经连好线
    [[UIColor greenColor]set];
    
    path.lineWidth = 5;
    
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
    //设置终点
    
}

@end


