//
//  QQNumberController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QQNumberController.h"

@interface QQNumberController ()<UITextFieldDelegate>

@end

@implementation QQNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor]; 
    
    //获取导航条
    [self TagQQNumberNavBar];
    
    //提示语句
    [self TagQQNumberLabel];
    
    //修改框
    [self TagQQNumberTextField];
    
    //确定按钮
    [self TagQQNumberButton];

}

#pragma mark-添加导航条
-(NavigationBar *)TagQQNumberNavBar
{
    if (_QQNumberNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"QQ号码修改" NavigationController:_QQNumberNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _QQNumberNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)TagQQNumberLabel
{
    if (_QQNumberLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"QQ号码:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _QQNumberLabel = label;
    }
    return _QQNumberLabel;
}


#pragma mark-添加输入框
-(UITextField *)TagQQNumberTextField
{
    if (_QQNumberTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _QQNumberTextField = textField;
    }
    return _QQNumberTextField;
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)TagQQNumberButton
{
    if (_QQNumberButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(QQNumberButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _QQNumberButton = btn;
    }
    return _QQNumberButton;
}

#pragma mark-确定按钮的响应方法
-(void)QQNumberButtonClick
{
    NSString * Str = [NSString deleteSpace:_QQNumberTextField.text];
    
    if (Str.length != 0)
    {
        _QQNumberDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"qq",@"value":Str,@"uid":_QQNumberUserId}}} method:@"POST"];
        
        NSLog(@"%@",_QQNumberDataArr);
        
        if (_QQNumberDataArr[0][@"content"][@"response"])
        {
            [self.QQNumberNavController popViewControllerAnimated:YES];
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
