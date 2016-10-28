//
//  AccountRetailerController.m
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountRetailerController.h"

@interface AccountRetailerController ()
{
    float YHeight;
    
    NSArray *accountRetailerLabelArray;
    
    NSArray *accountRetailerTextFieldArray;
}
@end

@implementation AccountRetailerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏
    [self AccountRetailNavBar];
    //提示语
    [self AccountRetaillabel];
    //填写框
    [self AccountRetailTextField];
    //确定按钮
    [self AccountRetailBtn];

}

#pragma mark-添加导航条
-(NavigationBar *)AccountRetailNavBar
{
    if (_accountRetailNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"修改真实姓名" NavigationController:_accountRetailerNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    
    YHeight += 69 + 40;
    
    return _accountRetailNavBar;
}

#pragma mark-提示语
-(UILabel *)AccountRetaillabel
{
    if (_accountRetaillabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,YHeight, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"真实姓名:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _accountRetaillabel = label;
 
    }
    return _accountRetaillabel;
}

#pragma mark-填写框
-(UITextField *)AccountRetailTextField
{
    if (_accountRetailTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,YHeight, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _accountRetailTextField = textField;

    }
    return _accountRetailTextField;
}

#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark-确认按钮
-(UIButton *)AccountRetailBtn
{
    if (_accountRetailBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(AccountRetailBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _accountRetailBtn = btn;
    }
    return _accountRetailBtn;
}

#pragma mark-确认按钮的响应方法
-(void)AccountRetailBtnClick
{
    NSString * Str = [NSString deleteSpace:_accountRetailTextField.text];
    
    if (Str.length != 0)
    {
        _accountRetailDataArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"realname",@"value":Str,@"uid":_accountRetailUserId}}} method:@"POST"];
        
        NSLog(@"%@",_accountRetailDataArr);
        
        if (_accountRetailDataArr[0][@"content"][@"response"])
        {
            [self.accountRetailerNavController popViewControllerAnimated:YES];
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
