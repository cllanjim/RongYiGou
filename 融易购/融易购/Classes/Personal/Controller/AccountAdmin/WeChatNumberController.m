//
//  WeChatNumberController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WeChatNumberController.h"

@interface WeChatNumberController ()<UITextFieldDelegate>

@end

@implementation WeChatNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取导航条
    [self WeChatNavBar];
    
    //提示语句
    [self WeChatLabel];
    
    //修改框
    [self WeChatTextField];
    
    //确定按钮
    [self WeChatButton];
    
}

#pragma mark-添加导航条
-(NavigationBar *)WeChatNavBar
{
    if (_weChatNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"微信修改" NavigationController:_weChatNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _weChatNavBar = navBar;
    }
    return _weChatNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)WeChatLabel
{
    if (_weChatLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"微信:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _weChatLabel = label;
    }
    return _weChatLabel;
}


#pragma mark-添加输入框
-(UITextField *)WeChatTextField
{
    if (_weChatTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _weChatTextField = textField;
    }
    return _weChatTextField;
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)WeChatButton
{
    if (_weChatButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(WeChatButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _weChatButton = btn;
    }
    return _weChatButton;
}

#pragma mark-确定按钮的响应方法
-(void)WeChatButtonClick
{
    NSString * Str = [NSString deleteSpace:_weChatTextField.text];
    
    if (Str.length != 0)
    {
        _weChatDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"weixin",@"value":Str,@"uid":_weChatUserId}}} method:@"POST"];
        
        NSLog(@"%@",_weChatDataArr);
        
        if (_weChatDataArr[0][@"content"][@"response"])
        {
            [self.weChatNavController popViewControllerAnimated:YES];
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
