//
//  AccountContactController.m
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountContactController.h"

@interface AccountContactController ()
{
    float YHeight;
    
    NSArray *accountContactLabelArray;
    
    NSArray *accountContactTextFieldArray;
}
@end

@implementation AccountContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    //添加导航条
    [self AccountContactNavBar];
    
    [self AccountSexBtn1];
    
    [self AccountSexBtn2];
    
}
#pragma mark-添加导航条
-(NavigationBar *)AccountContactNavBar
{
    if (_accountContactNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"性别选择" NavigationController:_accountContactNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _accountContactNavBar = navBar;
    }
    
    YHeight += 89 + 40;
    
    return _accountContactNavBar;
}

#pragma mark-按钮的选择
-(UIButton *)AccountSexBtn1
{
    if (_accountSexBtn1 == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/6, YHeight,kWidth/4, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"男" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(AccountSexBtn1Click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _accountSexBtn1 = btn;
    }
    return _accountSexBtn1;
}

#pragma mark-性别(男)的响应方法
-(void)AccountSexBtn1Click: (UIButton *)sender
{
    
    _sendRequestArr = [NSArray requestWithPath:@"user_data_edit.php"params:@{@"content":@{@"request":@{@"want":@"sex",@"value":@"1",@"uid":_accountSexUserId}}} method:@"POST"];
    
    if (_sendRequestArr[0][@"content"][@"response"])
    {
        [self.accountContactNavController popViewControllerAnimated:YES];
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


#pragma mark-按钮的选择
-(UIButton *)AccountSexBtn2
{
    if (_accountSexBtn2 == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 + kWidth/4, YHeight, kWidth/4, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"女" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(AccountSexBtn2Click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _accountSexBtn2 = btn;
    }
    return _accountSexBtn2;
}

#pragma mark-按钮(女)的选择
-(void)AccountSexBtn2Click:(UIButton *)sender
{
    _sendRequestArr = [NSArray requestWithPath:@"user_data_edit.php"params:@{@"content":@{@"request":@{@"want":@"sex",@"value":@"2",@"uid":_accountSexUserId}}} method:@"POST"];
    
    if (_sendRequestArr[0][@"content"][@"response"])
    {
        [self.accountContactNavController popViewControllerAnimated:YES];
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
