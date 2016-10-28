//
//  CitySelectController.m
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CitySelectController.h"
#import "CitySelectModel.h"
#import "CountySelectController.h"

@interface CitySelectController ()

@end

@implementation CitySelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cityInforArr = [NSMutableArray array];
    
    //获取数据
    [self CityGetData];
    
    //创建导航条
    [self CitySelectNavBar];
    
    //创建已选展示视图
    [self CityShowTableView];
    
    //创建待选展示视图
    [self CitySelectTableView];
    
}

#pragma mark-获取数据
-(void)CityGetData
{
    _cityGetdataArr  = [NSArray requestWithPath:@"city.php" params:@{@"content":@{@"request":@{@"pid":_CitySelectId}}} method:@"POST"];
    
    
    for (NSDictionary *dict in _cityGetdataArr[0][@"content"][@"response"][@"info_list"])
    {
        CitySelectModel *cityModel = [[CitySelectModel alloc]initWithDict:dict];
        
        [_cityInforArr addObject:cityModel];
    }
}

#pragma mark-创建导航条
-(NavigationBar *)CitySelectNavBar
{
    if (_citySelectNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"市" NavigationController:_citySelectNavController];
        
        navBar.animated = NO;
        
        [self.view addSubview:navBar];
    }
    return _citySelectNavBar;
}


#pragma mark-创建已选视图
-(UITableView *)CityShowTableView
{
    if (_cityShowTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, 44)];
        
        tableView.tag = 111;
        
        tableView.bounces = NO;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _cityShowTableView = tableView;
    }
    return _cityShowTableView;
}

#pragma mark-创建待选视图
-(UITableView *)CitySelectTableView
{
    if (_citySelectTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69 + 44, kWidth, kHeight-113)];
    
        tableView.tag = 222;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _citySelectTableView = tableView;

    }
    return _citySelectTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 111)
    {
        return 1;
    }
    else if(tableView.tag == 222)
    {
        return _cityInforArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        static NSString *CellIdentifier = @"showCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            
            cell.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
            
        }
    
        cell.textLabel.text = _CitySelectName;
        
        return cell;
    }
    else if(tableView.tag == 222)
    {
        static NSString *CellIdentifier = @"selectCell";
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            
        }
        
        CitySelectModel *cityModel = [CitySelectModel new];
        
        cityModel = _cityInforArr[indexPath.row];
        
        cell.textLabel.text = cityModel.cityName;
        
        
        return cell;
    }
    
    return 0;
}

#pragma mark-cell选中按钮的响应方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (tableView.tag == 222)
    {
        CitySelectModel *cityModel = [CitySelectModel new];
        
        cityModel = _cityInforArr[indexPath.row];
        
        CountySelectController *county = [CountySelectController new];
        
        county.countyNavController = self.citySelectNavController;
        
        county.provinceName = self.CitySelectName;
        
        county.provinceId = self.CitySelectId;
        
        county.cityName = cityModel.cityName;
        
        county.cityId = cityModel.cityId;
        
        county.ControllerId = self.ControllerId;
        
        [self.citySelectNavController pushViewController:county animated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
