//
//  RetailerShopNameController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RetailerShopNameController.h"

@interface RetailerShopNameController ()<UITextFieldDelegate>

@end

@implementation RetailerShopNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取导航条
    [self RetilerShopNameNavBar];
    
    //提示语句
    [self RetilerShopNameLabel];
    
    //修改框
    [self RetilerShopNameTextField];
    
    //确定按钮
    [self RetilerShopNameButton];
}

#pragma mark-添加导航条
-(NavigationBar *)RetilerShopNameNavBar
{
    if (_retilerShopNameNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"销售门店名称修改" NavigationController:_retilerShopNameNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _retilerShopNameNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)RetilerShopNameLabel
{
    if (_retilerShopNameLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"销售门店名称:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _retilerShopNameLabel = label;
    }
    return _retilerShopNameLabel;
}


#pragma mark-添加输入框
-(UITextField *)RetilerShopNameTextField
{
    if (_retilerShopNameTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _retilerShopNameTextField = textField;
    }
    return _retilerShopNameTextField;
}

#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)RetilerShopNameButton
{
    if (_retilerShopNameButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(RetilerShopNameButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _retilerShopNameButton = btn;
    }
    return _retilerShopNameButton;
}


#pragma mark-确定按钮的响应方法
-(void)RetilerShopNameButtonClick
{
    NSString * Str = [NSString deleteSpace:_retilerShopNameTextField.text];
    
    if (Str.length != 0)
    {
        _shopNameDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"shop_name",@"value":Str,@"uid":_retilerShopNameUserId}}} method:@"POST"];
        
        NSLog(@"%@",_shopNameDataArr);
        
        if (_shopNameDataArr[0][@"content"][@"response"])
        {
            [self.retilerShopNameNavController popViewControllerAnimated:YES];
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
