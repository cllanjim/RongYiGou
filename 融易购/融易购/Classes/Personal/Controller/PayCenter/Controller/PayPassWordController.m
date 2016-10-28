//
//  PayPassWordController.m
//  RongYiGou
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PayPassWordController.h"

@interface PayPassWordController ()
{
    NSArray *payPasswordLabelArr;
    
    NSArray *payPassWordTextFielsArr;
}
@end

@implementation PayPassWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self PayPasswordNavBar];
    
    //提示语
    [self PayBoundLabel];
    
    //用户名
    [self PayPasswordName];
    
    //信息展示
    [self PayPassWordTextField1];
    
    [self PayPassWordTextField2];
    
    [self PayPassWordTextField3];
    
    //确认按钮
    [self PayBoundButton];

    
}


#pragma mark-添加导航条
-(NavigationBar *)PayPasswordNavBar
{
    if (_payPasswordNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"支付密码修改" NavigationController:_payPasswordNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _payPasswordNavBar = navBar;
    }
    return _payPasswordNavBar;
}

#pragma mark-设置提示语
-(UILabel *)PayBoundLabel
{
    payPasswordLabelArr = @[@"用户名:",@"原密码:",@"设置支付密码:",@"确认支付密码:"];
    
    if (_payPassWordLabel == nil)
    {
        
        for (int i = 0; i < payPasswordLabelArr.count; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeight/6 + i * kHeight/10, kWidth/2, kHeight/15)];
            
            label.text = [payPasswordLabelArr objectAtIndex:i];
            
            label.textAlignment = NSTextAlignmentCenter;
            
            [self.view addSubview:label];
            
            _payPassWordLabel = label;
            
        }
    }
    return _payPassWordLabel;
}


#pragma mark-用户名展示
-(UILabel *)PayPasswordName
{
    if (_payPasswordName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2, kHeight/6, kWidth/2, kHeight/15)];
        
        label.text = @"1******29281";
        
        [self.view addSubview:label];
    }
    return _payPasswordName;
}

#pragma mark-输入原密码
-(UITextField *)PayPassWordTextField1
{
    if (_payPassWordTextField1 == nil)
    {
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/2,kHeight/6 + kHeight/10, kWidth/2.5, kHeight/15)];
        
        text.delegate = self;
        
        text.borderStyle = UITextBorderStyleRoundedRect;
        
        text.placeholder = @"请输入原密码";
        
        text.font = kLabelFont;
        
        [self.view addSubview:text];
        
        _payPassWordTextField1 = text;
    }
    return _payPassWordTextField1;
}

#pragma mark-新密码
-(UITextField *)PayPassWordTextField2
{
    if (_payPassWordTextField2 == nil)
    {
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/2,kHeight/6 + 2 * kHeight/10, kWidth/2.5, kHeight/15)];
        
        text.delegate = self;
        
        text.borderStyle = UITextBorderStyleRoundedRect;
        
        text.placeholder = @"密码位数大于6";
        
        text.font = kLabelFont;
        
        [self.view addSubview:text];
        
        _payPassWordTextField2 = text;
  
    }
    return _payPassWordTextField2;
}

#pragma mark-信息展示
-(UITextField *)PayPassWordTextField3
{
    if (_payPassWordTextField3 == nil)
    {
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/2,kHeight/6 + 3 * kHeight/10, kWidth/2.5, kHeight/15)];
        
        text.delegate = self;
        
        text.borderStyle = UITextBorderStyleRoundedRect;
        
        text.placeholder = @"请再次输入密码";
        
        text.font = kLabelFont;
        
        [self.view addSubview:text];
        
        _payPassWordTextField3 = text;
    }
    return _payPassWordTextField3;
}


#pragma mark-确认按钮
-(UIButton *)PayBoundButton
{
    if (_payPassWordBtton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(30, kHeight*3/5, kWidth-60, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(PayPassWordBttonClick) forControlEvents:UIControlEventTouchDragInside];
        
        [self.view addSubview:btn];
    }
    return _payPassWordBtton;
}


#pragma mark-确认按钮响应方法
-(void)PayPassWordBttonClick
{
    if (_payPassWordTextField1.text.length != 0 && _payPassWordTextField2.text.length !=0 && _payPassWordTextField3.text.length != 0)
    {
        
        
        if ([_payPassWordTextField2.text isEqual:_payPassWordTextField3.text])
        {
            
            NSString *oldPasswordStr = [NSString deleteSpace:_payPassWordTextField1.text];
            
            oldPasswordStr = [NSString md5HexDigest:oldPasswordStr];
            
            NSString *newPassWordStr = [NSString deleteSpace:_payPassWordTextField2.text];
            
            newPassWordStr = [NSString md5HexDigest:newPassWordStr];
            
            _payPassWordArr = [NSArray requestWithPath:@"pay.php" params:@{@"content":@{@"request":@{@"want":@"paypassword",@"uid":_payUserId,@"oldpassword":oldPasswordStr,@"newpassword":newPassWordStr}}} method:@"POST"];
            
            
            if ([_payPassWordArr[0][@"content"][@"response"]length])
            {
                [self.navigationController popViewControllerAnimated:YES];
            }
            else if([_payPassWordArr[0][@"faultCode"]isEqual:@"1"])
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                hud.mode = MBProgressHUDModeText;
                
                hud.labelText = @"原支付密码错误";
                
                hud.margin = 10.f;
                
                hud.removeFromSuperViewOnHide = YES;
                
                [hud hide:YES afterDelay:2];
            }
            
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"新密码前后不一致";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
            

        }
        
        
      
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"密码不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        

    }
    
    
    
  
}


#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
