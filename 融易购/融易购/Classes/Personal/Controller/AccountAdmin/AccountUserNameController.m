//
//  AccountUserNameController.m
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountUserNameController.h"

@interface AccountUserNameController ()
{
    NSArray *_userInformationLabelArray;
    
    NSArray *_userInformationTextFieldArray;
    
    BOOL _userSelect;
    
    UIButton *_userSelectBtn;
}
@end

@implementation AccountUserNameController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    //添加导航栏
    [self AccountUserNameNavBar];
    
    //添加内容主体
    [self UserInformationLabel];
    
    [self UserInformationTextField];
    
    //添加确定按钮
    [self UserInformationBtn];
    
}

#pragma mark-添加导航栏
-(NavigationBar *)AccountUserNameNavBar
{
    if (_accountUserNameNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [nav addNavigationBar:@"昵称修改" NavigationController:_accountUserNameNavController];
        
        nav.animated = YES;
        
        [self.view addSubview:nav];
        
        _accountUserNameNavBar = nav;
    }
    return _accountUserNameNavBar;
}


#pragma mark-


#pragma mark-添加内容主体<1>
-(UILabel *)UserInformationLabel
{
    if (_userInformationLanel == nil)
    {
      
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,89 +self.view.frame.size.height/10, self.view.frame.size.width/3, self.view.frame.size.height/15)];
            
            label.text = @"填写昵称:";
            
            label.font = kLabelFont;
            
            label.textAlignment = NSTextAlignmentRight;
            
            [self.view addSubview:label];
            
            _userInformationLanel = label;
     
    }
    return _userInformationLanel;
}

#pragma mark-添加内容主体<2>
-(UITextField *)UserInformationTextField
{
    if (_userInformationTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,89 + self.view.frame.size.height/10, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请输入新的昵称";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _userInformationTextField = textField;
    }
   return _userInformationTextField;
}

#pragma mark-取消textField的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark-确认按钮
-(UIButton *)UserInformationBtn
{
    if (_userInformationBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(UserInformationBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _userInformationBtn = btn;
    }
    return _userInformationBtn;
}

#pragma mark -确认按钮的响应方法
-(void)UserInformationBtnClick
{
    NSString *textStr = [NSString deleteSpace:_userInformationTextField.text];
    
    _backResultArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"name",@"value":textStr,@"uid":_accountUserId}}} method:@"POST"];
    
    NSLog(@"%@",_backResultArr);
    
    if (_backResultArr[0][@"content"][@"response"])
    {
        [self.accountUserNameNavController popViewControllerAnimated:YES];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
