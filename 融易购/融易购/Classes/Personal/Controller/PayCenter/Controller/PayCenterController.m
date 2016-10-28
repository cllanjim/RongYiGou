//
//  PayCenterController.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PayCenterController.h"
#import "AccountBalanceController.h"
#import "TransactionDetailsController.h"
#import "RechargeRecordsController.h"
#import "CashRecordsController.h"
#import "OperationRecordController.h"
#import "PayBoundController.h"
#import "PayPassWordController.h"

#define kHeader @"header" // 头部标题对应的key
#define kFooter @"footer" // 尾部标题对应的key
#define kCities @"cities" // 城市数组对应的key


@interface PayCenterController ()
{
    NSArray *accountArr;
    
    NSArray *dealArr;
    
    NSArray *accountAdminArr;
}
@end

@implementation PayCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    
//   accountClassArr = [[NSArray alloc]initWithObjects:@"对公账户",@"对私账户", nil];
//    
//   dealArr = [[NSArray alloc]initWithObjects:@"交易明细",@"充值记录",@"提现记录",@"操作记录", nil];
//    
//   accountAdminArr = [[NSArray alloc]initWithObjects:@"账户信息",@"实名认证",@"翼支付绑定", nil];
    
    
    
    accountArr = @[
                   @{
                       kHeader:@"账户",
                       
                       kCities:@[@"账户余额查询"]
                       
                       },
                   @{
                       kHeader:@"交易查询",
                       
                       kCities:@[@"交易明细",@"充值记录",@"提现记录",@"操作记录"]
                       
                       },
                   @{
                       kHeader:@"账户管理",
                       
                       kCities:@[@"翼支付绑定",@"支付密码修改"]
                       }
                   
                   
                   ];
    
    //添加导航栏
    [self PayCenterNavBar];
    
    
    //支付中心内容
    [self PayCenterTableView];
    
    
}
#pragma mark-添加导航栏
-(NavigationBar *)PayCenterNavBar
{
    if (_payCenterNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        [nav addNavigationBar:@"支付中心" NavigationController:_payCenterNav];
        
        nav.animated = YES;
        
        _payCenterNavBar = nav;
        
    }
    return _payCenterNavBar;
}

#pragma mark-支付中心的内容
-(UITableView *)PayCenterTableView
{
    if (_payCenterTableView == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)style:UITableViewStyleGrouped];
        
        table.backgroundColor = [UIColor whiteColor];
        
        table.delegate = self;
        
        table.dataSource = self;
        
        [self.view addSubview: table];
        
        _payCenterTableView = table;
    }
    return _payCenterTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = accountArr[section];
    
    NSArray *arr = dic[kCities];
    
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary *dict = accountArr[indexPath.section];
    
    NSArray *array = dict[kCities];
    
    NSString *text = array[indexPath.row];
    
    
    cell.textLabel.text = text;
    
    UILabel *IconLabel = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*18/20, 0, kCellWidth/10, cell.frame.size.height)];
    
    IconLabel.text = @">";
    
    IconLabel.textColor = [UIColor lightGrayColor];
    
    [cell addSubview:IconLabel];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return accountArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 30;
            break;
        case 1:
            return 0;
            break;
        case 2:
            return 0;
            break;
        default:
            break;
    }
    return 0;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return accountArr[section][kHeader];
}

#pragma mark-Cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    AccountBalanceController *account = [AccountBalanceController new];
                    
                    account.accountBalanceNavController = self.payCenterNav;
                    
                    account.accountUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:account animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    TransactionDetailsController *tranDetail = [TransactionDetailsController new];
                    
                    tranDetail.tranDetailNavController = self.payCenterNav;
                    
                    tranDetail.UserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:tranDetail animated:YES];
                }
                    break;
                case 1:
                {
                    RechargeRecordsController *rech = [RechargeRecordsController new];
                    
                    rech.rechargeNavController = self.payCenterNav;
                    
                    rech.rechUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:rech animated:YES];
                }
                    break;
                case 2:
                {
                    CashRecordsController *cash = [CashRecordsController new];
                    
                    cash.cashRecordNavController = self.payCenterNav;
                    
                    cash.cashUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:cash animated:YES];
                }
                    break;
                    case 3:
                {
                    OperationRecordController *oper = [OperationRecordController new];
                    
                    oper.operationNavController = self.payCenterNav;
                    
                    oper.operationUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:oper animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    PayBoundController *pay = [PayBoundController new];
                    
                    pay.payBoundNavController = self.payCenterNav;
                    
                    pay.payUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:pay animated:YES];
                }
                    break;
                case 1:
                {
                    PayPassWordController *pay = [PayPassWordController new];
                    
                    pay.payPasswordNavController = self.payCenterNav;
                    
                    pay.payUserId = _payCenterUserId;
                    
                    [self.payCenterNav pushViewController:pay animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
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
