//
//  RegisterController.m
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RegisterController.h"
#import "Register1Controller.h"
#import "NSString+MJ.h"


@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self NavigationBar];
    
    //手机号码输入框
    [self NumberLabel];
    
    [self NumberTextField];
    
    //下一步按钮
    [self NextBtn];
    
    //终端e站服务协议
    [self SelectBtn];
    
    [self InformationBtn];
    
    
}

-(NavigationBar *)NavigationBar
{
    if (_navigationBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        [nav addNavigationBar:@"注册" NavigationController:_navigationController];
        
        _navigationBar = nav;
    }
    return _navigationBar;
}


#pragma mark-手机号码
-(UILabel *)NumberLabel
{
    if (_numberLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, kHeight/5-5, kWidth/3-30, kHeight/20)];
        
        label.text = @"手机号码";
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        _numberLabel = label;
    }
    return _numberLabel;
}

#pragma mark-手机号码输入框
-(UITextField *)NumberTextField
{
    if (_numberTextField == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 + 10, kHeight/5-5, kWidth*2/3-30, kHeight/20)];
        
        textfield.placeholder = @"请输入手机号码";
        
        textfield.font = kLabelFont;
        
        [self.view addSubview:textfield];
        
        _numberTextField = textfield;
    }
    return _numberTextField;
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
        
        [btn addTarget:self action:@selector(NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _nextBtn = btn;
    }
    return _nextBtn;
}

#pragma  mark-下一步按钮的响应方法
-(void)NextBtnClick
{
    
    NSString *numberStr = [NSString deleteSpace:_numberTextField.text];
    
    NSArray *dataArray = [NSArray requestWithPath:@"send_sms.php" params:@{@"content":@{@"request":@{@"mobile":numberStr}}} method:@"POST"];
    
    NSString *codeStr = dataArray[0][@"content"][@"response"][@"auth_code"];
    
    if (_selectTag)
    {
        
        if (_numberTextField.text.length != 0 && _numberTextField.text.length == 11)
        {
            
            if (codeStr)
            {
                Register1Controller *reg = [Register1Controller new];
                
                reg.navigationController = self.navigationController;
                
                reg.verCodeStr = codeStr;
                
                [self.navigationController pushViewController:reg animated:NO];
            }
            else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                
                hud.mode = MBProgressHUDModeText;
                
                hud.labelText = @"获取验证码失败";
                
                hud.margin = 10.f;
                
                hud.removeFromSuperViewOnHide = YES;
                
                [hud hide:YES afterDelay:2];
            }
            
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"号码不能为空或者号码位数不对";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        if (_HUD == nil)
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"请勾选服务协议";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
     
}


#pragma mark-选择按钮
-(UIButton *)SelectBtn
{
    if (_selectBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(25, kHeight/3+27, 15, 15)];
        
        btn.backgroundColor = [UIColor lightGrayColor];
        
        [btn addTarget:self action:@selector(SelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _selectBtn = btn;
    }
    return _selectBtn;
}

#pragma mark-选择按钮的响应方法
-(void)SelectBtnClick: (UIButton *)sender
{
    _selectTag = !_selectTag;
    
    if (_selectTag)
    {
        sender.backgroundColor = [UIColor redColor];
    }
    else
    {
        sender.backgroundColor = [UIColor lightGrayColor];
    }
}


#pragma mark-终端e站买家服务协议
-(UIButton *)InformationBtn
{
    if (_informationBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(40, kHeight/3 +25, kWidth/2, 20)];
        
        [btn setTitle:@"同意终端e站买家服务协议" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        [self.view addSubview:btn];
        
        _informationBtn = btn;
    }
    return _informationBtn;
}

#pragma mark-取消第一响应
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_numberTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
