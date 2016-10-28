//
//  RetailerCodeController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RetailerCodeController.h"

@interface RetailerCodeController ()<UITextFieldDelegate>

@end

@implementation RetailerCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];

    //获取导航条
    [self RetilerCodeNavBar];
    
    //提示语句
    [self RetilerLabel];
    
    //修改框
    [self RetilerTextField];
    
    //确定按钮
    [self RetilerButton];
    
    
}

#pragma mark-添加导航条
-(NavigationBar *)RetilerCodeNavBar
{
    if (_retilerCodeNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"零售商编码修改" NavigationController:_retilerCodeNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _retilerCodeNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)RetilerLabel
{
    if (_retilerLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"零售商编码:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _retilerLabel = label;
    }
    return _retilerLabel;
}


#pragma mark-添加输入框
-(UITextField *)RetilerTextField
{
    if (_retilerTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _retilerTextField = textField;
    }
    return _retilerTextField;
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)RetilerButton
{
    if (_retilerButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(RetilerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _retilerButton = btn;
    }
    return _retilerButton;
}


#pragma mark-确定按钮的响应方法
-(void)RetilerButtonClick
{
    NSString * Str = [NSString deleteSpace:_retilerTextField.text];
    
    if (Str.length != 0)
    {
        _sendDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"retailer_code",@"value":Str,@"uid":_retilerUserId}}} method:@"POST"];
        
        NSLog(@"%@",_sendDataArr);
        
        if (_sendDataArr[0][@"content"][@"response"])
        {
            [self.retilerCodeNavController popViewControllerAnimated:YES];
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
