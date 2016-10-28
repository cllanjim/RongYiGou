//
//  CashRecordsController.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CashRecordsController.h"
#import "TransactionQueryView.h"

@interface CashRecordsController ()
{
    NSDictionary *cashRecordsTitleDic;
}
@end

@implementation CashRecordsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //获取数据
    [self CashGetData];
    
    //添加导航条
    [self CashRecordNavBar];
    
    //添加内容
    [self CashRecordView];
}

#pragma mark-获取数据
-(void)CashGetData
{
    _cashGetDataArr = [NSArray requestWithPath:@"pay_detail.php" params:@{@"content":@{@"request":@{@"want":@"record",@"uid":_cashUserId,@"gdbest":@"3"}}} method:@"POST"];
    
    
      _cashGetDataArr = _cashGetDataArr[0][@"content"][@"response"][@"de"][@"list"];
    
    
}


#pragma mark-添加导航条
-(NavigationBar *)CashRecordNavBar
{
    if (_cashRecordNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"提现记录" NavigationController:_cashRecordNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _cashRecordNavBar = navBar;
    }
    return _cashRecordNavBar;
}


#pragma mark-添加内容
-(TransactionQueryView *)CashRecordView
{
    
    cashRecordsTitleDic = @{@"time":@"创建时间",
                     @"name":@"名称|交易号",
                     @"type":@"账户类型",
                     @"amount":@"金额(元)",
                     @"state":@"状态"
                     };
    
    
    if (_cashRecordView == nil)
    {
        TransactionQueryView *view = [[TransactionQueryView alloc] initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        [view addTitle:cashRecordsTitleDic Content:_cashGetDataArr];
        
        [self.view addSubview:view];
        
        _cashRecordView = view;
    }
    return _cashRecordView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
