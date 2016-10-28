//
//  Register2Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register2Controller.h"
#import "Register3Controller.h"

@interface Register2Controller ()
{
    NSArray *_reg2TitleArray;
    
    NSArray *_reg2textArray;
    
    NSString *_reg2AccountName;
    
    NSString *_reg2AccountPassword;
    
    NSString *_reg2AccountPassword1;
}
@end

@implementation Register2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _reg2TitleArray = [[NSArray alloc]initWithObjects:@"账户",@"登录密码",@"确认密码", nil];
    
    _reg2textArray = [[NSArray alloc]initWithObjects:@"手机号码/邮箱",@"请输入密码",@"请验证一下密码", nil];
    
    //导航条
    [self NavigationBar];
    
    //添加内容
//    [self Reg2RegisterView];
    
    //账户
    [self AccountNameTextfield];
    
    //分隔线
    [self ThreadLabel];

    //登录密码
    [self PasswordTextfield];
    
    //分隔线
    [self ThreadLabel2];
    
    //确认密码
    
    [self EqualPasswordTextfield];
    
    //下一步
    [self NextBtn];
    
    
}

#pragma mark-添加导航条
-(NavigationBar *)NavigationBar
{
    if (_navigationBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        [nav addNavigationBar:@"注册" NavigationController:_navigationController];
        
        nav.animated = NO;
        
        _navigationBar = nav;
    }
    return _navigationBar;
}

#pragma mark-添加内容
-(RegisterView *)Reg2RegisterView
{
    Register3Controller *reg3 = [Register3Controller new];
    
    reg3.reg3NavigationController = self.navigationController;
    
    if (_reg2RegisterView == nil)
    {
        RegisterView *reg = [[RegisterView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)];
        
        [reg addRegisterView:_reg2TitleArray TextArray:_reg2textArray whetherTextfield:YES SelfNavController:self.navigationController NextNavController:reg3];
        
        [self.view addSubview:reg];
        
        _reg2RegisterView = reg;
    }
    return _reg2RegisterView;
}





#pragma mark-填写账户信息
-(UITextField *)AccountNameTextfield
{
    if (_accountName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, kHeight/5-5, kWidth/3-30, kHeight/20)];
        
        label.text = @"账户";
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];

        
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 10, kHeight/5-5, kWidth*2/3-30, kHeight/20)];
        
        textfield.placeholder = @"手机号码/邮箱";
        
        textfield.font = kLabelFont;
        
        [self.view addSubview:textfield];
        
        _accountName = textfield;
    }
    return _accountName;
}


#pragma mark-遮档线
-(void)ThreadLabel
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, kHeight/4, kWidth-40, 0.3)];
    
    label.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}

#pragma mark-填写账户密码
-(UITextField *)PasswordTextfield
{
    if (_passwordTextfield == nil)
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, kHeight/4+7, kWidth/3-30, kHeight/20)];
        
        label.text = @"登录密码";
        
        label.textColor = [UIColor lightGrayColor];
        
        label.font = kLabelFont;
        
        [self.view addSubview:label];
        
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 10, kHeight/4+7, kWidth*2/3-30, kHeight/20)];
        
        textfield.placeholder = @"请输入密码";
        
        textfield.font = kLabelFont;
        
        [self.view addSubview:textfield];
        
        _passwordTextfield = textfield;
    }
    return _passwordTextfield;
}

#pragma mark-遮档线
-(void)ThreadLabel2
{
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, kHeight*6/20 +15, kWidth-40, 0.5)];
    
    label2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:label2];
}


#pragma mark-确认密码

-(UITextField *)EqualPasswordTextfield
{
    if (_equalPasswordTextfield == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, kHeight*6/20 + 25, kWidth/3-30, kHeight/20)];
        
        label.text = @"登录密码";
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];

        
        UITextField *equal = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 10, kHeight*6/20 + 25, kWidth*2/3-30,kHeight/20)];
        
        equal.placeholder = @"请验证一下密码";
        
        equal.font = kLabelFont;
        
        [self.view addSubview:equal];
        
        _equalPasswordTextfield = equal;
    }
    return _equalPasswordTextfield;
}


#pragma mark-下一步按钮
-(UIButton *)NextBtn
{
    if (_nextBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight*7/20 + 40, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(NextBtn2Click) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _nextBtn = btn;
    }
    return _nextBtn;
}

#pragma mark-下一步按钮的响应方法
-(void)NextBtn2Click
{
    _reg2AccountName = [NSString deleteSpace:_accountName.text];
    
    _reg2AccountPassword = [NSString deleteSpace:_passwordTextfield.text];
    
    _reg2AccountPassword1 = [NSString deleteSpace:_equalPasswordTextfield.text];
    
    NSLog(@"%@----%@",_reg2AccountName,_reg2AccountPassword);
    
    
    if (![_reg2AccountName  isEqual: @""] && ![_reg2AccountPassword  isEqual: @""] && ![_reg2AccountPassword1  isEqual: @""])
    {
        if ([_reg2AccountPassword isEqual:_reg2AccountPassword1])
        {
            
            //将账户信息存入单例类
            GlobalInformation *global = [GlobalInformation shareManager];
            
            global.AccountName = _reg2AccountName;
            
            global.AccountPassWord = _reg2AccountPassword;
            
            
            Register3Controller *reg3 = [Register3Controller new];
            
            reg3.reg3NavigationController = self.navigationController;
            
            reg3.reg3NavigationController1 = self.navigationController;
            
            [self.navigationController pushViewController:reg3 animated:NO];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"密码不一致";
            
            hud.margin = 10.f;
        
            hud.removeFromSuperViewOnHide = YES;
                        
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        
    }
   
    
}


#pragma mark-取消第一响应

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_accountName resignFirstResponder];
    
    [_passwordTextfield resignFirstResponder];
    
    [_equalPasswordTextfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
