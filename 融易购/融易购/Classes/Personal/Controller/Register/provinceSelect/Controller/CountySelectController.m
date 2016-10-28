//
//  CountySelectController.m
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CountySelectController.h"
#import "CountySelectModel.h"
#import "Register3Controller.h"
#import "AddAddressController.h"

@interface CountySelectController ()

@end

@implementation CountySelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _countInforArr = [NSMutableArray array];
    
    //获取数据
    [self CountyGetData];
    
    //创建导航条
    [self CountyNavBar];
    
    //已选地址展示
    [self CountShowTableView];
    
    //未选地址展示
    [self CountySelectTableView];
    
}

#pragma mark-获取数据
-(void)CountyGetData
{
    _countGetDataArr = [NSArray requestWithPath:@"city.php" params:@{@"content":@{@"request":@{@"pid":_cityId}}} method:@"POST"];

    for (NSDictionary *dict in _countGetDataArr[0][@"content"][@"response"][@"info_list"])
    {
        CountySelectModel *countyModel = [[CountySelectModel alloc]initWithDict:dict];
        
        [_countInforArr addObject:countyModel];
    }

    NSLog(@"%@",_countGetDataArr);
}

#pragma mark-创建导航条
-(NavigationBar *)CountyNavBar
{
    if (_countyNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"区/县" NavigationController:_countyNavController];
        
        navBar.animated = NO;
        
        [self.view addSubview:navBar];
        
        _countyNavBar = navBar;
    }
    return _countyNavBar;
}

#pragma mark-已选地址展示
-(UITableView *)CountShowTableView
{
    if (_countShowTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, 88)];
        
        tableView.bounces = NO;
        
        tableView.tag = 333;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _countShowTableView = tableView;
    }
    return _countShowTableView;
}


#pragma mark-未选地址展示
-(UITableView *)CountySelectTableView
{
    if (_countySelectTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69 + 88, kWidth, kHeight- 69 -88)];
        
        tableView.tag = 444;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _countySelectTableView = tableView;
    }
    return _countySelectTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 333)
    {
        return 2;
    }
    else if(tableView.tag == 444)
    {
        return _countInforArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 333)
    {
        static NSString *CellIdentifier = @"showCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            
             cell.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        }
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = _provinceName;
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = _cityName;
        }
        
        return cell;
    }
    else if(tableView.tag == 444)
    {
        static NSString *CellIdentifier = @"selectCell";
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        CountySelectModel *CountyModel = [CountySelectModel new];
        
        CountyModel = _countInforArr[indexPath.row];
        
        cell.textLabel.text = CountyModel.countyName;
        
        return cell;
    }
    
    return 0;
}

#pragma mark-cell选中按钮的响应方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (tableView.tag == 444)
    {
        CountySelectModel *countyModel = [CountySelectModel new];
        
        countyModel = _countInforArr[indexPath.row];
        
        NSDictionary *provinceDict = @{@"province":@{
                                               @"id":_provinceId,
                                               @"name":_provinceName
                                               },
                                       @"city":@{
                                               @"id":_cityId,
                                               @"name":_cityName
                                               },
                                       @"county":@{
                                               @"id":countyModel.countyId,
                                               @"name":countyModel.countyName
                                               }
                                       };
        
        
        if ([_ControllerId isEqual:@"reg3"])
        {
            
            Register3Controller *reg3 = [[Register3Controller alloc]init];
            
            self.delegate = reg3;
            
            if ([_delegate respondsToSelector:@selector(CountySelect:Address:)])
            {
                [self.delegate CountySelect:self Address:provinceDict];
            }
            
            [self.navigationController pushViewController:reg3 animated:NO];

        }
        else if([_ControllerId isEqual:@"addAddress"])
        {
            AddAddressController *addAddress = [[AddAddressController alloc]init];
            
            self.delegate = addAddress;
            
            if ([_delegate respondsToSelector:@selector(CountySelectAddress:Address:)])
            {
                [self.delegate CountySelectAddress:self Address:provinceDict];
            }
            
            [self.countyNavController pushViewController:addAddress animated:NO];
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
