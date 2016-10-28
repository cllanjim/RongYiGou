//
//  AccountBalanceController.m
//  RongYiGou
//
//  Created by mac on 16/2/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountBalanceController.h"
#import "GlobalInformation.h"
#import "LoginInController.h"
#import "RechargeController.h"
#import "WithdrawalsController.h"


@interface AccountBalanceController ()
{
    float YHeight;
    
    NSString *name;
    
    NSString *type;
    
    NSArray *blance;
    
    NSArray *btnArr;
}
@end

@implementation AccountBalanceController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    
//    _accountDataArr = @[
//                    
//                    @{
//                        @"name" :@"1814114667@qq.com",
//                        
//                        @"type" :@"对公账户",
//                        
//                        @"blance":@[@"100.00",@"100.00",@"0.00",@"1000.00"]
//                        
//                        },
//                    
//                    @{
//                        @"name" :@"7758521@qq.com",
//                        
//                        @"type" :@"对私账户",
//                        
//                        @"blance":@[@"308463332.00",@"308420.00",@"22.00",@"1000.00"]
//                        
//                        },
//                    
//                    ];
    
    
    //获取数据
    [self GetData];
    
    //添加导航条
    [self AccountBalanceNavBar];
    
    //内容主题
    [self AccountBalanceScrollView];
    
    
    
    //充值和提现
    [self AccountButton];
    
    _accountBalanceScrollView.contentSize = CGSizeMake(self.view.frame.size.width, YHeight);
}

-(void)GetData
{
     _accountDataArr = [NSArray requestWithPath:@"pay.php" params:@{@"content":@{@"request":@{@"want":@"accountsinfo",@"uid":_accountUserId}}} method:@"POST"];
    
    NSLog(@"%@",_accountDataArr);
    
    _accountDataDic=_accountDataArr[0][@"content"][@"response"];
}

#pragma mark-添加导航条
-(NavigationBar *)AccountBalanceNavBar
{
    if (_accountBalanceNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"账户余额" NavigationController:_accountBalanceNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _accountBalanceNavBar;
}

#pragma mark-添加底部视图


#pragma mark-账户余额信息展示
-(UIScrollView *)AccountBalanceScrollView
{
    if (_accountBalanceScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        scrollView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:scrollView];
        
        _accountBalanceScrollView = scrollView;
    }

    //账户详细内容
    [self AccountBalanceView];
    
    [self AccountBalanceView1];
    
    return _accountBalanceScrollView;
}

#pragma mark-账户详细内容
-(AccountBalanceView *)AccountBalanceView
{
    if (_accountBalanceView == nil)
    {
        
        //对公账户
        AccountBalanceView *view = [[AccountBalanceView alloc]initWithFrame:CGRectMake(0, 10, _accountBalanceScrollView.frame.size.width, _accountBalanceScrollView.frame.size.height/2.5)];
        
        view.backgroundColor = kBgColor;
        
        
        NSLog(@"%@",_accountDataDic);
        
        [view addAccountName:_accountDataDic[@"accounts"][@"wing_pay_public"] AccountType:@"对公账户" AccountBlance:_accountDataDic[@"cash+"]];
        
        [_accountBalanceScrollView addSubview:view];
        
        YHeight +=_accountBalanceScrollView.frame.size.height/2.4;
        
        _accountBalanceView = view;
        
  
    }
    return _accountBalanceView;
}

-(AccountBalanceView *)AccountBalanceView1
{
    if (_accountBalanceView1 == nil)
    {
        AccountBalanceView *view = [[AccountBalanceView alloc]initWithFrame:CGRectMake(0, 10 + _accountBalanceScrollView.frame.size.height/2.4, _accountBalanceScrollView.frame.size.width, _accountBalanceScrollView.frame.size.height/2.5)];
        
        view.backgroundColor = kBgColor;
        
       [view addAccountName:_accountDataDic[@"accounts"][@"wing_pay_private"] AccountType:@"对私账户" AccountBlance:_accountDataDic[@"private"]];
        
        [_accountBalanceScrollView addSubview:view];
        
        YHeight +=_accountBalanceScrollView.frame.size.height/2.4;
        
        _accountBalanceView = view;

    }
    return _accountBalanceView1;
}


#pragma mark-充值和提现按钮
-(UIButton *)AccountButton
{
    btnArr = @[@"充值",@"提现"];
    
    if (_accountButton == nil)
    {
        for (int i = 0; i < 2; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(40 + i * (_accountBalanceScrollView.frame.size.width-40)/2, YHeight + 20,(_accountBalanceScrollView.frame.size.width-120)/2, 40)];
            
            btn.tag = 300 + i;
            
            btn.backgroundColor = [UIColor redColor];
            
            [btn setTitle:[btnArr objectAtIndex:i] forState:UIControlStateNormal];
            
            [btn setTitle:@"" forState:UIControlStateHighlighted];
            
            [btn addTarget:self action:@selector(AccountBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_accountBalanceScrollView addSubview:btn];
            
            _accountButton = btn;
        }
        
        YHeight += 80;
    }
    return _accountButton;
}

#pragma mark-充值提现按钮的响应方法
-(void)AccountBtnClick:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 300:
        {
            RechargeController *recharge = [RechargeController new];
            
            recharge.UserId = self.accountUserId;
            
            recharge.rechargeNavController = self.accountBalanceNavController;
            
            recharge.rechrgeDataDic = _accountDataDic[@"accounts"];
            
            recharge.rechrgePayEmail = _accountDataDic[@"de"][@"email"];
            
            [self.accountBalanceNavController pushViewController:recharge animated:YES];
        }
            break;
        case 301:
        {
            WithdrawalsController *with = [WithdrawalsController new];
            
            with.rechargeNavController = self.accountBalanceNavController;
            
            with.withDataDic = _accountDataDic[@"accounts"];
            
            with.withPayEmail =_accountDataDic[@"de"][@"email"];
            
            [self.accountBalanceNavController pushViewController:with animated:YES];
        }
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
