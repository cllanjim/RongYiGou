//
//  NavigationBar.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NavigationBar.h"


@implementation NavigationBar

-(void)addNavigationBar:(NSString *)title NavigationController:(UINavigationController *)navigationController
{
    
    _title = title;
    
    _navigation = navigationController;
    
    self.backgroundColor = kBgColor;
    
    //返回上一页的按钮
    [self BackButton];
    

    //设置主标题
    [self TitleLabel];
}

#pragma mark-返回上一页的按钮

-(UIButton *)BackButton
{
    if (_backButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width/10, self.frame.size.height-20)];
        
        [btn setTitle:@"<" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:24];
        
        [btn addTarget:self action:@selector(BackButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        _backButton = btn;
    }
    return _backButton;
}

#pragma mark-设置主标题
-(UILabel *)TitleLabel
{
    if (_title == nil) return nil;
    
    if (_titleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_backButton.frame.size.width,20, self.frame.size.width-(_backButton.frame.size.width*2), self.frame.size.height-20)];
        
        label.text = _title;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
    
}

#pragma mark-返回按钮的响应方法
-(void)BackButtonClick
{
    [_navigation popViewControllerAnimated:_animated];
}

@end
