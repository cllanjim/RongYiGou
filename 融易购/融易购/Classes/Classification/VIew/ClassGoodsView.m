//
//  ClassGoodsView.m
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ClassGoodsView.h"
#import "ClassGoodsBtn.h"

#define kClassGoodsViewWidth self.frame.size.width

#define kClassGoodsViewHeight self.frame.size.height

@interface ClassGoodsView()
{
     UILabel *_labelThread;
}
@end

@implementation ClassGoodsView

-(void)addViewInformation:(NSArray *)array ContentStr:(NSString *)contentStr NavController:(UINavigationController *)navController
{
    _btnInformation = array;
    
    _contentStr = contentStr;
    
    _classViewNavController = navController;
    
    //主标题
    [self MainTitle];
    
    //遮挡线
    [self LabelThread];
    
    //商品按钮
    
    [self ClassGoodsBtn];

}

#pragma mark-主标题
-(UIButton *)MainTitle
{
    if (_mainTitle == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(25, 5, kCellWidth/5, 20)];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        _mainTitle = btn;
    }
    return _mainTitle;
}

#pragma mark-遮挡线
-(UILabel *)LabelThread
{
    if (_labelThread == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, kCellWidth-40, 0.5)];
        
        label.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        
        _labelThread = label;
    }
    return _labelThread;
}

#pragma mark-商品按钮
-(ClassGoodsBtn *)ClassGoodsBtn
{
    if (_classGoodsBtn == nil)
    {
        for (int i = 0; i <_btnInformation.count; i ++)
        {
            NSInteger index = i % 3;
            
            NSInteger page = i / 3;
            
            ClassGoodsBtn *btn = [[ClassGoodsBtn alloc]initWithFrame:CGRectMake(20 + index*(kClassGoodsViewWidth -40)/3, 40 + page * 75,(kClassGoodsViewWidth-60)/3, 70)];
            
            btn.tag = 100 +i;
            
            [btn addInformation:[_btnInformation objectAtIndex:i]ContentStr:_contentStr NavController:_classViewNavController];
            
            btn.backgroundColor = [UIColor whiteColor];
            
            [self addSubview:btn];
            
            _classGoodsBtn = btn;
        }
    }
    return _classGoodsBtn;
}



@end
