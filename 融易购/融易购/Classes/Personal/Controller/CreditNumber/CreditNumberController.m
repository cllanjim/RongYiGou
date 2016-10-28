//
//  CreditNumberController.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CreditNumberController.h"
#import "CreditContentCell.h"
#import "NSString+MJ.h"

@interface CreditNumberController ()
{
    NSString *statusStr;
    
    NSString *numStr;
    
    NSString *sumStr;
    
    NSString *defaultNumStr;
}
@end

@implementation CreditNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载数据
    [self CreditGetData];
    
    //添加导航条
    [self CreditNavBar];
    
    //添加授信额度显示
    [self CreditShowNumber];
    
    //授信额度详情展示
    [self CreditContent];
}

#pragma mark-加载数据
-(void)CreditGetData
{
    _creditGetDataArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"accessseriallist",@"uid":_UserId}}} method:@"POST"];
    
    if (_creditGetDataArr[0])
    {
        _creditGetDataDic = _creditGetDataArr[0][@"content"][@"response"];
    }
}

#pragma mark-添加导航栏
-(NavigationBar *)CreditNavBar
{
    if (_creditNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        nav.animated = YES;
        
        [nav addNavigationBar:@"授信额度明细" NavigationController:self.navigationController];
        
        _creditNavBar = nav;
    }
    return _creditNavBar;
}

#pragma mark-添加授信展示
-(UIView *)CreditShowNumber
{
    if (_creditGetDataDic[@"access"][@"default_num"])
    {
        statusStr = [NSString stringWithFormat:@"授信额度:%@",_creditGetDataDic[@"access"][@"default_num"]];
    }
    else
    {
        statusStr = @"授信额度:0";
    }
    
    
    
     if (_creditGetDataDic[@"access"][@"num"])
     {
        numStr = [NSString stringWithFormat:@"授信余额:%@",_creditGetDataDic[@"access"][@"num"]];
     }
    else
    {
        numStr = @"授信余额:0";
    }
    
    
    
     if (_creditGetDataDic[@"access"][@"sum"])
     {
         sumStr = [NSString stringWithFormat:@"罚款额度:%@",_creditGetDataDic[@"sum"]];
     }
    else
    {
        sumStr = @"罚款额度:0";
    }
    
    
    
    
    if (_creditGetDataDic[@"access"][@"status"])
    {
        
        if ([_creditGetDataDic[@"access"][@"status"]isEqual:@"1"])
        {
            defaultNumStr = @"状态:开启";
        }
        else
        {
            defaultNumStr = @"状态:关闭";
        }
        
    }
    else
    {
        defaultNumStr = @"状态:关闭";
    }
    
    NSArray *array = [[NSArray alloc]initWithObjects:defaultNumStr,statusStr,numStr,sumStr, nil];
    
    
    
    if (_creditShowNumber == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight/20)];
        
        [self.view addSubview:view];
        
        _creditShowNumber = view;
        
        for (int i = 0; i < 4; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * view.frame.size.width/4, 0, view.frame.size.width/4, view.frame.size.height)];
            
            label.text = [array objectAtIndexedSubscript:i];
            
            label.font = kLabelFont;
            
            label.textAlignment = NSTextAlignmentCenter;
            
            [view addSubview:label];
        }
    }
    return _creditShowNumber;
}

#pragma mark-授信详细情况
-(UITableView *)CreditContent
{
    if (_creditContent == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, kHeight/20+69, kWidth, kHeight*19/20-69)];
        
        table.backgroundColor = [UIColor whiteColor];
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        table.dataSource = self;
        
        table.delegate = self;
        
        [self.view addSubview:table];
        
        
    }
    return _creditContent;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_creditGetDataDic[@"accessserial"][@"list"]count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CreditContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CreditContentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.layer.borderColor = [UIColor whiteColor].CGColor;
        
        cell.layer.borderWidth = 1;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    if ([_creditGetDataDic[@"accessserial"][@"list"]count])
    {
        cell.creditInformation.text = _creditGetDataDic[@"accessserial"][@"list"][indexPath.row][@"detail"];
        
        cell.creditRevise .text = _creditGetDataDic[@"accessserial"][@"list"][indexPath.row][@"count"];
        
        NSString *timeStr = [NSString timeConversion:_creditGetDataDic[@"accessserial"][@"list"][indexPath.row][@"time"]];
        
        cell.creditReviseDate.text = timeStr;
    }

    
    return cell;

}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    cell.backgroundColor = kBgColor;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
