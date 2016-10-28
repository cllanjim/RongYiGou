//
//  RrovinceSelectController.m
//  RongYiGou
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RrovinceSelectController.h"
#import "ProvinceSelectModel.h"
#import "CitySelectController.h"


@interface RrovinceSelectController ()

@end

@implementation RrovinceSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _selectModelArr = [NSMutableArray array];
    
    _showModelArr = [NSMutableArray array];
    
    //获取数据
    [self ProvinceGetData];
    
    //创建导航条
    [self ProvinceSelsctNavBar];
    

    [self ProvinceSelectTableView];
    
}

#pragma mark-获取数据
-(void)ProvinceGetData
{
    _provinceSelectDataArray = [NSArray requestWithPath:@"city.php" params:nil method:@"POST"];
    
    NSLog(@"%@",_provinceSelectDataArray);
    
    for (NSDictionary *dict in _provinceSelectDataArray[0][@"content"][@"response"][@"info_list"])
    {
        ProvinceSelectModel *selectModel = [[ProvinceSelectModel alloc]initWithDict:dict];
        
        [_selectModelArr addObject:selectModel];
    }
    
}

#pragma mark-创建导航条
-(NavigationBar *)ProvinceSelsctNavBar
{
    if (_provinceSelsctNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"省" NavigationController:_provinceSelectNavController];
        
        navBar.animated = NO;
        
        [self.view addSubview:navBar];
    }
    return _provinceSelsctNavBar;
}
#pragma mark-地址列表


-(UITableView *)ProvinceSelectTableView
{
    if (_provinceSelectTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, _provinceShowTableView.frame.size.height + 69, kWidth, kHeight-_provinceShowTableView.frame.size.height -69-44)];
        
        tableView.backgroundColor = [UIColor brownColor];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _provinceSelectTableView = tableView;
    }
    return _provinceSelectTableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _selectModelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
           static NSString *CellIdentifier = @"selectCell";
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            
            ProvinceSelectModel *selectModel = [ProvinceSelectModel new];
            
            selectModel = _selectModelArr[indexPath.row];
            
            cell.textLabel.text = selectModel.provinceName;
            
        }
     return cell;
}

#pragma mark-Cell的选中按钮
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ProvinceSelectModel *selectModel = [[ProvinceSelectModel alloc]init];
    
    selectModel = _selectModelArr[indexPath.row];
    
    CitySelectController *city = [CitySelectController new];
    
    city.CitySelectId = selectModel.provinceId;
    
    city.CitySelectName = selectModel.provinceName;
    
    city.citySelectNavController = self.provinceSelectNavController;
    
    city.ControllerId = self.ControllerId;
    
    [self.provinceSelectNavController pushViewController:city animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
