//
//  Register6Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register6Controller.h"

@interface Register6Controller ()

@end

@implementation Register6Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self Reg6NavBar];
    
    //提示语
    [self PromptLabel];
    
    //登录界面按钮
    [self LoginBtn];

}

#pragma mark-添加导航栏
-(NavigationBar *)Reg6NavBar
{
    if (_reg6NavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:navBar];
        
        [navBar addNavigationBar:@"注册" NavigationController:_reg6NavController];
        
        navBar.backButton.hidden = YES;
        
        _reg6NavBar = navBar;
    }
    return _reg6NavBar;
}

#pragma mark-提示语
-(UILabel *)PromptLabel
{
    if (_promptLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeight/3, kWidth, kHeight/20)];
        
        label.text = @"恭喜11011001100注册成功";
        
        label.textColor = [UIColor brownColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:label];
        
        _promptLabel = label;
    }
    return _promptLabel;
}

#pragma mark-跳转登录页面
-(UIButton *)LoginBtn
{
    if (_loginBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight*8/20 + 20, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"注册成功,点击立即登录" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(LoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _loginBtn = btn;

    }
    return _loginBtn;
}


-(void)LoginBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
