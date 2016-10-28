//
//  OperationRecordController.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OperationRecordController.h"
#import "TransactionQueryView.h"

@interface OperationRecordController ()
{
    NSDictionary *operationTitleDic;
}
@end

@implementation OperationRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //获取元素
    [self OperationGetData];
    
    //添加导航条
    [self OperationNavBar];
    
    //添加主要内容
    [self OperationView];
}

#pragma mark-获取数据
-(void)OperationGetData
{
    _operationArr = [NSArray requestWithPath:@"pay_detail.php" params:@{@"content":@{@"request":@{@"want":@"record",@"uid":_operationUserId,@"gdbest":@"4"}}} method:@"POST"];
    
      _operationArr = _operationArr[0][@"content"][@"response"][@"de"][@"list"];
}

#pragma mark-添加导航栏
-(NavigationBar*)OperationNavBar
{
    if (_operationNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"操作记录" NavigationController:_operationNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _operationNavBar = navBar;
    }
    return _operationNavBar;
}

#pragma mark-添加主要内容
-(TransactionQueryView *)OperationView
{
    
    operationTitleDic = @{@"time":@"创建时间",
                            @"name":@"名称|交易号",
                            @"type":@"账户类型",
                            @"amount":@"金额(元)",
                            @"state":@"状态"
                            };

    
    if (_operationView == nil)
    {
        TransactionQueryView *view = [[TransactionQueryView alloc] initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        [view addTitle:operationTitleDic Content:_operationArr];
        
        [self.view addSubview:view];
        
        _operationView = view;
    }
    return _operationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
