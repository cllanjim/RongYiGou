//
//  Register1Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register1Controller.h"
#import "Register2Controller.h"

@interface Register1Controller ()

@end

@implementation Register1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];

    //导航条
    [self NavigationBar];
    
    //短信验证码输入框
    [self NumberTextField];
    
    //验证按钮
    [self NumberBtn];
    
    //下一步按钮
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

#pragma mark-短信验证码输入框
-(UITextField *)NumberTextField
{
    if (_numberTextfield == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/10 , kHeight/5-5, kWidth*2/5, kHeight/20)];
    
        textfield.placeholder = @"请输入验证码";
        
        textfield.font = kLabelFont;
        
        [self.view addSubview:textfield];
        
        _numberTextfield = textfield;
    }
    return _numberTextfield;
}

#pragma mark-重发验证按钮
-(UIButton *)NumberBtn
{
    if (_numberBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/1.7, kHeight/5-5, kWidth/3, kHeight/20)];

        btn.backgroundColor = [UIColor brownColor];
        
        [btn setTitle:@"重发验证码" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        [self.view addSubview:btn];
        
        _numberBtn = btn;
    }
    return _numberBtn;
}

#pragma mark-下一步按钮
-(UIButton *)NextBtn
{
    if (_nextBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/4 + 20, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(NextBtn1Click) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _nextBtn = btn;
    }
    return _nextBtn;
}

#pragma mark-下一步按钮的响应方法
-(void)NextBtn1Click
{
    NSString *VerCodeTextField = [NSString deleteSpace:_numberTextfield.text];
    
    if (VerCodeTextField)
    {
        if ([_verCodeStr isEqual:VerCodeTextField])
        {
            Register2Controller *reg = [Register2Controller new];
            
            reg.navigationController = self.navigationController;
            
            [self.navigationController pushViewController:reg animated:NO];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"验证码错误";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"验证码不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
}

#pragma mark-取消第一响应

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_numberTextfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
