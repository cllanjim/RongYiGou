//
//  PhoneNumberController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PhoneNumberController.h"

@interface PhoneNumberController ()<UITextFieldDelegate>

@end

@implementation PhoneNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取导航条
    [self PhoneNumberNavBar];
    
    //提示语句
    [self PhoneNumberLabel];
    
    //修改框
    [self PhoneNumberTextField];
    
    //确定按钮
    [self PhoneNumberButton];

}


#pragma mark-添加导航条
-(NavigationBar *)PhoneNumberNavBar
{
    if (_phoneNumberNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"手机号码修改" NavigationController:_phoneNumberNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _phoneNumberNavBar = navBar;
    }
    return _phoneNumberNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)PhoneNumberLabel
{
    if (_phoneNumberLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"手机号码:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _phoneNumberLabel = label;
    }
    return _phoneNumberLabel;
}


#pragma mark-添加输入框
-(UITextField *)PhoneNumberTextField
{
    if (_phoneNumberTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _phoneNumberTextField = textField;
    }
    return _phoneNumberTextField;
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)PhoneNumberButton
{
    if (_phoneNumberButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(PhoneNumberButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _phoneNumberButton = btn;
    }
    return _phoneNumberButton;
}

#pragma mark-确定按钮的响应方法
-(void)PhoneNumberButtonClick
{
    NSString * Str = [NSString deleteSpace:_phoneNumberTextField.text];
    
    if (Str.length != 0)
    {
        _phoneNumberDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"mobile",@"value":Str,@"uid":_phoneNumberUserId}}} method:@"POST"];
        
        NSLog(@"%@",_phoneNumberDataArr);
        
        if (_phoneNumberDataArr[0][@"content"][@"response"])
        {
            [self.phoneNumberNavController popViewControllerAnimated:YES];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"修改失败";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"编码不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
