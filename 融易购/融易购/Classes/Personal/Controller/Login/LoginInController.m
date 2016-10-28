//
//  LoginInController.m
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginInController.h"
#import "RegisterController.h"
#import "NSString+MJ.h"
#import "NSArray+MJ.h"
#import "LoginInTitleBtn.h"
#import "AuthcodeView.h"
#import "NSString+MJ.h"
#import "HttpTool.h"

@interface LoginInController ()
{
    CGRect authFrame;
}
@end

@implementation LoginInController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self NavigationBar];
    
    //账户名称
    [self AccountNameLabel];
    
    [self AccountNameTextfield];

    //遮挡线
    [self ThreadLabel];
    
    //账户密码
    [self PasswordLabel];
    
    [self PasswordTextfield];
    
    
    //遮档线
    [self ThreadLabel1];
    
    //验证码
    [self VerificationCodeLabel];
    
    [self VerificationCodeTextField];
    
    [self AuthCodeView];
    
    //登录按钮
    [self LoginBtn];
    
    //免费注册
    [self RegisterBtn];
    
    //忘记密码
    [self ForgetPasswordBtn];
    
    
    //滑动手势返回上一页
    UISwipeGestureRecognizer * rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    

    [self.view addGestureRecognizer:rightSwipe];

}

-(void)click:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark-导航条
-(NavigationBar *)NavigationBar
{
    if (_bar == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        bar.backgroundColor = kBgColor;
        
        [bar addNavigationBar:@"登录" NavigationController:self.navigationController];
        
        bar.animated = YES;
        
        [self.view addSubview:bar];
        
        bar.backButton.backgroundColor = kBgColor;
        
        [bar.backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        _bar = bar;
    }
    return _bar;
}

#pragma mark-用户名称
-(LoginInTitleBtn *)AccountNameLabel
{
    if (_accountTitleBtn == nil)
    {
        LoginInTitleBtn *btn = [[LoginInTitleBtn alloc]initWithFrame:CGRectMake(40, kHeight/5-5, kWidth/3-30, kHeight/20)];
        
        UIImage *icon = [UIImage imageNamed:@"user.png"];
        
        icon = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
        [btn addTitle:@"账户:" IconImage:icon];
        
        [self.view addSubview:btn];
        
        _accountTitleBtn = btn;
    }
    return _accountTitleBtn;
}

#pragma mark-填写用户名称
-(UITextField *)AccountNameTextfield
{
    if (_accountNameTextfield == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 20, kHeight/5-5, kWidth*2/3-30, kHeight/20)];
        
        textfield.placeholder = @"手机号码/邮箱";
        
        textfield.font = [UIFont systemFontOfSize:12];
        
        [self.view addSubview:textfield];
        
        _accountNameTextfield = textfield;
    }
    return _accountNameTextfield;
}

#pragma mark-遮档线
-(void)ThreadLabel
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, kHeight/4, kWidth-40, 0.5)];
    
    label.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}


#pragma mark-账户密码
-(LoginInTitleBtn *)PasswordLabel
{
    if (_passwordTitleBtn == nil)
    {
        LoginInTitleBtn *btn = [[LoginInTitleBtn alloc]initWithFrame:CGRectMake(40, kHeight/4+7, kWidth/3-30, kHeight/20)];
        
        UIImage *icon = [UIImage imageNamed:@"password.png"];
        
        icon = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
        [btn addTitle:@"密码:" IconImage:icon];
        
        [self.view addSubview:btn];
        
        _passwordTitleBtn = btn;
    }
    return _passwordTitleBtn;
}

#pragma mark-填写账户密码
-(UITextField *)PasswordTextfield
{
    if (_passwordTextfield == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 20, kHeight/4+7, kWidth*3/3-30, kHeight/20)];
        
        textfield.placeholder = @"请输入密码";
        
        textfield.font = [UIFont systemFontOfSize:12];
        
        [self.view addSubview:textfield];
        
        _passwordTextfield = textfield;
    }
    return _passwordTextfield;
}


-(void)ThreadLabel1
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20,kHeight*6.5/20, kWidth-40, 0.5)];
    
    label.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}


#pragma mark-验证码
-(LoginInTitleBtn *)VerificationCodeLabel
{
    if (_verificationTitleBtn == nil)
    {
        LoginInTitleBtn *btn = [[LoginInTitleBtn alloc]initWithFrame:CGRectMake(40, kHeight*6.7/20, kWidth/3-30, kHeight/20)];
        
        UIImage *icon = [UIImage imageNamed:@"verifi.png"];
        
        icon = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [btn addTitle:@"验证:" IconImage:icon];
        
        [self.view addSubview:btn];
    
        _verificationTitleBtn = btn;
    }
    return _verificationTitleBtn;
}


#pragma mark-填写验证码
-(UITextField *)VerificationCodeTextField
{
    if (_verificationCodeTextField == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 20, kHeight*6.7/20, kWidth/8, kHeight/20)];
        
        textfield.delegate = self;
        
        textfield.placeholder = @"验证码";
        
        textfield.font = [UIFont systemFontOfSize:12];
        
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        
        [self.view addSubview:textfield];
        
        _verificationCodeTextField = textfield;
    }
    return _verificationCodeTextField;
}


#pragma mark-本地验证码
-(AuthcodeView *)AuthCodeView
{
    if (_authCodeView == nil)
    {
        authFrame = CGRectMake(kWidth/1.8, kHeight*6.7/20, kWidth/2-30, kHeight/20);
    
        
        AuthcodeView *auth = [[AuthcodeView alloc]initWithFrame:authFrame];
        
        auth.delegate = self;
        
        _authCodeString = auth.authCodeStr;
        
        [self.view addSubview:auth];
    }
    return _authCodeView;
}

#pragma mark-
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    
    return YES;

}

#pragma mark-登录按钮
-(UIButton *)LoginBtn
{
    if (_loginBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight*8.5/20, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(LoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _loginBtn = btn;
    }
    return _loginBtn;
}

#pragma mark-接受验证码
-(void)authcodeView:(AuthcodeView *)authcodeView AuthCode:(NSString *)code
{
    _authCodeString = code;
}

#pragma mark-登录按钮的响应方法
-(void)LoginBtnClick: (UIButton *)sender
{
    [_verificationCodeTextField resignFirstResponder];
    
    //发送账户登录的请求
    
    NSString *textStr = [NSString deleteSpace:_verificationCodeTextField.text];
    
    
    if ([textStr isEqualToString:_authCodeString])
    {
        NSString *strName = [NSString deleteSpace:_accountNameTextfield.text];
        
        NSString *strPassworld = [NSString deleteSpace:_passwordTextfield.text];
        
        strPassworld = [NSString md5HexDigest:strPassworld];
    
        NSString *loginStr = @"login.php";
        
        NSArray * dataArr = [NSArray requestWithPath:loginStr params:@{@"content":@{@"request":@{@"username":strName,@"password":strPassworld}}} method:@"POST"];

        NSDictionary *dict = [dataArr objectAtIndex:0];
        
        if (dict[@"content"])
        {
            GlobalInformation *global = [GlobalInformation shareManager];
            
            global.userId = dict[@"content"][@"response"][@"user_info"][@"userid"];
            
            global.AccountName = dict[@"content"][@"response"][@"user_info"][@"name"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"登录失败";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        //验证不匹配，验证码和输入框抖动
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        
        anim.repeatCount = 1;
        
        anim.values = @[@-20,@20,@-20];
        
        //        [authCodeView.layer addAnimation:anim forKey:nil];
        
        [_verificationCodeTextField.layer addAnimation:anim forKey:nil];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"验证码错误";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        
        _verificationCodeTextField.text = @"";
    }
    
}


#pragma mark-免费注册

-(UIButton *)RegisterBtn
{
    if (_registerBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight*8.5/20 +70, (kWidth-40)/4, 20)];
        
        [btn setTitle:@"免费注册" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
         btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchDragInside];
        
        [self.view addSubview:btn];
        
        _registerBtn = btn;
    }
    return _registerBtn;
}

-(void)btnClick
{
    RegisterController *reg = [RegisterController new];
    
    reg.navigationController = self.navigationController;
    
    [self.navigationController pushViewController:reg animated:YES];
}

#pragma mark-忘记密码
-(UIButton *)ForgetPasswordBtn
{
    if (_forgetPasswordBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20 +(kWidth-40)*3/4, kHeight*8.5/20 +70, (kWidth-40)/4, 20)];
        
        [btn setTitle:@"忘记密码" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [self.view addSubview:btn];
        
        _forgetPasswordBtn = btn;
    }
    return _forgetPasswordBtn;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_accountNameTextfield resignFirstResponder];
    
    [_passwordTextfield resignFirstResponder];
    
    [_verificationCodeTextField resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
