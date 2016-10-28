//
//  RechargeRecordsController.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RechargeRecordsController.h"
#import "TransactionQueryView.h"

@interface RechargeRecordsController ()
{
    NSDictionary *rechTitleDic;
}
@end

@implementation RechargeRecordsController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //获取数据
    [self RechGetData];
    
    //创建导航条
    [self RechargeNavBar];
    
    //内容实体
    [self TransactionView];
}

#pragma mark-获取数据
-(void)RechGetData
{
    _rechArray = [NSArray requestWithPath:@"pay_detail.php" params:@{@"content":@{@"request":@{@"want":@"record",@"uid":_rechUserId,@"gdbest":@"2"}}} method:@"POST"];
    
    
      _rechArray = _rechArray[0][@"content"][@"response"][@"de"][@"list"];
}

#pragma mark-创建导航条
-(NavigationBar *)RechargeNavBar
{
    if (_rechargeNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"充值记录" NavigationController:_rechargeNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _rechargeNavBar;
}

#pragma mark-创建内容实体
-(TransactionQueryView *)TransactionView
{
    
    rechTitleDic = @{@"time":@"创建时间",
                     @"name":@"名称|交易号",
                     @"type":@"账户类型",
                     @"amount":@"金额(元)",
                     @"state":@"状态"
                     };
    
    if (_transactionView == nil)
    {
        TransactionQueryView *View = [[TransactionQueryView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        [View addTitle:rechTitleDic Content:_rechArray];
        
        [self.view addSubview:View];
    }
    return _transactionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
