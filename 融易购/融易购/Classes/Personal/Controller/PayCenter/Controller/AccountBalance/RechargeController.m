//
//  RechargeController.m
//  RongYiGou
//
//  Created by mac on 16/3/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RechargeController.h"

@interface RechargeController ()
{
    float YHeight;
    
    UIButton *accountBtn1;
    
    UIButton *accountBtn2;
    
    UITextField *amoutTextField;
    
    UITextField *payTextField;
}
@end

@implementation RechargeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    if (![_rechrgeDataDic[@"wing_pay_private"] isEqual:@""])
    {
        _rechrgeType = @"2";
    }
    else
    {
        _rechrgeType = @"1";
    }
    
    
    //添加导航条
    [self RechargeNavBar];
    
    //添加内容
    [self AddContent];
}

#pragma mark-添加导航条
-(NavigationBar *)RechargeNavBar
{
    if (_rechargeNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"充值中心" NavigationController:_rechargeNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        YHeight += navBar.frame.size.height + 30;
        
        _rechargeNavBar = navBar;
    }
    return _rechargeNavBar;
}


#pragma mark-添加内容
-(void)AddContent
{
    //到账账户
    UILabel *accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/6, YHeight, kWidth*4/18, kWidth/18)];
    
    accountLabel.text = @"到账账户:";
    
    accountLabel.font = kLabelFont;
    
    [self.view addSubview:accountLabel];
    
    
    //对公按钮
    accountBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*7.5/18 , YHeight, kWidth/18,kWidth/18)];
    
    
    if (![_rechrgeDataDic[@"wing_pay_public"] isEqual:@""] && [_rechrgeDataDic[@"wing_pay_private"] isEqual:@""])
    {
         accountBtn1.backgroundColor = [UIColor redColor];
    }
    else
    {
        accountBtn1.backgroundColor = [UIColor lightGrayColor];
    }
   
    
    accountBtn1.layer.cornerRadius = kWidth/36;
    
    [accountBtn1 addTarget:self action:@selector(AccountBtn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:accountBtn1];
    
    //账户展示
    UILabel *accountLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*9/18, YHeight, kWidth*8/18, kWidth/18)];
    
    if (![_rechrgeDataDic[@"wing_pay_public"] isEqual:@""])
    {
        accountLabel1.text = [NSString stringWithFormat:@"对公账户(%@)",_rechrgeDataDic[@"wing_pay_public"]];
    }
    else
    {
         accountLabel1.text = [NSString stringWithFormat:@"对公账户(未配置)"];
    }
    
    accountLabel1.font = kLabelFont;
    
    [self.view addSubview:accountLabel1];
    
    YHeight += 40;
    
    
    //对私按钮
    accountBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*7.5/18, YHeight, kWidth/18, kWidth/18)];
    
    
     if (![_rechrgeDataDic[@"wing_pay_private"] isEqual:@""])
     {
         accountBtn2.backgroundColor = [UIColor redColor];
     }
    else
    {
        accountBtn2.backgroundColor = [UIColor lightGrayColor];
    }
    
    accountBtn2.layer.cornerRadius = kWidth/36;
    
    [accountBtn2 addTarget:self action:@selector(AccountBtn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:accountBtn2];
    
    
    //对私账户展示
    UILabel *accountLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*9/18 , YHeight, kWidth*8/18, kWidth/18)];
    
    
    if (![_rechrgeDataDic[@"wing_pay_private"] isEqual:@""])
    {
        accountLabel2.text = [NSString stringWithFormat:@"对私账户(%@)",_rechrgeDataDic[@"wing_pay_private"]];
    }
    else
    {
         accountLabel2.text = [NSString stringWithFormat:@"对私账户(未配置)"];
    }

    accountLabel2.font = kLabelFont;
    
    [self.view addSubview:accountLabel2];
    
    YHeight += 40;
 
    //付款金额
    UILabel *amoutLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/6, YHeight, kWidth*4/18, kWidth/18)];
    
    amoutLabel.text = @"付款金额:";
    
    amoutLabel.font = kLabelFont;
    
    [self.view addSubview:amoutLabel];
    
    amoutTextField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth*7.5/18, YHeight, kWidth*8/18, 30)];
    
    amoutTextField.placeholder = @"请输入金额(单位:元)";
    
    amoutTextField.font = kLabelFont;
    
    amoutTextField.borderStyle =UITextBorderStyleRoundedRect;
    
    [self.view addSubview:amoutTextField];
    
    YHeight += 50;
    
    
    //支付密码
    UILabel *payLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/6, YHeight, kWidth*4/18, 30)];
    
    payLabel.text = @"支付密码:";
    
    payLabel.font = kLabelFont;
    
    [self.view addSubview:payLabel];
    
    payTextField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth*7.5/18, YHeight, kWidth*8/18, 30)];
    
    payTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:payTextField];
    
    YHeight += 50;
    
    
    //确定充值
    UIButton *confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/6, YHeight, kWidth*2/3, 40)];
    
    confirmBtn.backgroundColor = [UIColor redColor];
    
    [confirmBtn setTitle:@"充值" forState:UIControlStateNormal];
    
    [confirmBtn addTarget:self action:@selector(ConformBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:confirmBtn];
    
}

#pragma mark-对公按钮的响应方法
-(void)AccountBtn1Click
{
    
    if (![_rechrgeDataDic[@"wing_pay_public"] isEqual:@""])
    {
        accountBtn1.backgroundColor = [UIColor redColor];
        
        accountBtn2.backgroundColor = [UIColor lightGrayColor];
        
        _rechrgeType = @"1";
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"账户未配置";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];

    }
    
   
}

#pragma mark-对私按钮的响应方法
-(void)AccountBtn2Click
{

    if (![_rechrgeDataDic[@"wing_pay_private"] isEqual:@""])
    {
        accountBtn1.backgroundColor = [UIColor lightGrayColor];
        
        accountBtn2.backgroundColor = [UIColor redColor];
        
        _rechrgeType = @"2";
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"账户未配置";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    
}

#pragma mark-发送请求,账户充值
-(void)ConformBtnClick
{
    NSString *amountStr = [NSString deleteSpace:amoutTextField.text];
    
    NSString *payPasswordStr = [NSString deleteSpace:payTextField.text];
    
    payPasswordStr = [NSString md5HexDigest:payPasswordStr];
    
    if (![amountStr isEqual:@""])
    {
        if (![payPasswordStr isEqual:@""])
        {
            
            /*
             接口未开通
             */
            
            /*
             
            _rechrgeArr = [NSArray requestWithPath:@"pay.php" params:@{@"content":@{@"request":@{@"want":@"recharge",@"uid":_UserId,@"type":_rechrgeType,@"pay_email":_rechrgePayEmail,@"amount":amountStr,@"paypassword":payPasswordStr}}} method:@"POST"];
             
            */
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"功能未开通";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
            
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
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"金额不能为空";
        
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
