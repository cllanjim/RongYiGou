//
//  EmailNumberController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "EmailNumberController.h"

@interface EmailNumberController ()<UITextFieldDelegate>

@end

@implementation EmailNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取导航条
    [self EmailNumberNavBar];
    
    //提示语句
    [self EmailNumberLabel];
    
    //修改框
    [self EmailNumberTextField];
    
    //确定按钮
    [self EmailNumberButton];
    
}



#pragma mark-添加导航条
-(NavigationBar *)EmailNumberNavBar
{
    if (_emailNumberNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"邮箱地址修改" NavigationController:_emailNumberNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _emailNumberNavBar = navBar;
    }
    return _emailNumberNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)EmailNumberLabel
{
    if (_emailNumberLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"邮箱号码:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _emailNumberLabel = label;
    }
    return _emailNumberLabel;
}


#pragma mark-添加输入框
-(UITextField *)EmailNumberTextField
{
    if (_emailNumberTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _emailNumberTextField = textField;
    }
    return _emailNumberTextField;
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)EmailNumberButton
{
    if (_emailNumberButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(EmailNumberButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _emailNumberButton = btn;
    }
    return _emailNumberButton;
}

#pragma mark-确定按钮的响应方法
-(void)EmailNumberButtonClick
{
    NSString * Str = [NSString deleteSpace:_emailNumberTextField.text];
    
    if (Str.length != 0)
    {
        _emailNumberDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"email",@"value":Str,@"uid":_emailNumberUserId}}} method:@"POST"];
        
        NSLog(@"%@",_emailNumberDataArr);
        
        if (_emailNumberDataArr[0][@"content"][@"response"])
        {
            [self.emailNumberNavController popViewControllerAnimated:YES];
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
