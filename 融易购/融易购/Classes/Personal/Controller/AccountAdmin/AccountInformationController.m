//
//  AccountInformationController.m
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountInformationController.h"
#import "AccountInformationCell.h"

@interface AccountInformationController ()
{
    NSArray *accountTitle;
    
    NSArray *accountTextArr;
    
    NSString *userName;
    
    NSString *sex;
    
    NSString *IP;
    
    NSString *phoneNumber;
    
    NSString *area;
    
    NSString *regtime;
    
    NSString *lastLoginTime;
    
    NSString *retailer_code;
    
    NSString *shop_code;
    
    NSString *shop_name;
}
@end

@implementation AccountInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//基本信息(用户ID,用户名,真实姓名,手机号码,邮箱,地址,注册时间,最后登录时间,零售商/仓储商编码,审核备注,销售门店编码,销售门店名称,支付密码安全程度)
    
    accountTitle = [NSArray arrayWithObjects:@"用户名:",@"性别:",@"IP:",@"手机号码:",@"地址:",@"注册时间:",@"最后登录时间:",@"零售商/仓储商编码:",@"销售门店编码:",@"销售门店名称:", nil];
    
    
    if (![_accountInforationArr[0][@"user"]isEqual:@""])
    {
        userName = _accountInforationArr[0][@"user"];
    }
    else
    {
        userName = @"未填写";
    }
    
    if (![_accountInforationArr[0][@"sex"]isEqual:@""])
    {
        sex = _accountInforationArr[0][@"sex"];
    }
    else
    {
        sex = @"未填写";
    }
    
    if (![_accountInforationArr[0][@"ip"]isEqual:@""])
    {
        IP = _accountInforationArr[0][@"ip"];
    }
    else
    {
        IP = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"mobile"]isEqual:@""])
    {
       phoneNumber = _accountInforationArr[0][@"mobile"];
    }
    else
    {
        phoneNumber = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"area"]isEqual:@""])
    {
        area = _accountInforationArr[0][@"area"];
    }
    else
    {
        area = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"regtime"]isEqual:@""])
    {
        regtime = _accountInforationArr[0][@"regtime"];
    }
    else
    {
        regtime = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"lastLoginTime"]isEqual:@""])
    {
        NSString *str = [NSString timeConversion:_accountInforationArr[0][@"lastLoginTime"]];
        
        lastLoginTime = str;
    }
    else
    {
        lastLoginTime = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"retailer_code"]isEqual:@""])
    {
        retailer_code = _accountInforationArr[0][@"retailer_code"];
    }
    else
    {
        retailer_code = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"shop_code"]isEqual:@""])
    {
        shop_code = _accountInforationArr[0][@"shop_code"];
    }
    else
    {
        shop_code = @"未填写";
    }
    
    
    if (![_accountInforationArr[0][@"shop_name"]isEqual:@""])
    {
        shop_name = _accountInforationArr[0][@"shop_name"];
    }
    else
    {
        shop_name = @"未填写";
    }
    
    
    accountTextArr = [NSArray arrayWithObjects:userName,sex,IP,phoneNumber,area,regtime,lastLoginTime,retailer_code,shop_code,shop_name, nil];
    
    
    
    //添加导航条
    [self AccountNavBar];
    
    //添加主体内容
    
    [self AccountTableView];
    
    
    
}
#pragma mark-添加导航条
-(NavigationBar *)AccountNavBar
{
    if (_accountNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"账户基本信息" NavigationController:_accountInformationNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _accountNavBar;
}

#pragma mark-添加内容主体
-(UITableView *)AccountTableView
{
    if (_accountTableView == nil)
    {
        UITableView *tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)];
        
        tabelView.dataSource = self;
        
        tabelView.delegate = self;
        
        tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:tabelView];
    }
    return _accountTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return accountTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AccountInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        
        cell = [[AccountInformationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.layer.borderColor = kBgColor.CGColor;
        
        cell.layer.borderWidth = 0.5;
        
    }
    
    cell.accountTitle.text = accountTitle[indexPath.row];
    
    cell.accountText.text = accountTextArr[indexPath.row];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
