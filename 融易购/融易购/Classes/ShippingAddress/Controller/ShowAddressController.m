//
//  ShowAddressController.m
//  RongYiGou
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShowAddressController.h"
#import "ShowAddressCell.h"
#import "AddAddressController.h"

@interface ShowAddressController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShowAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //获取数据
    [self ShowAddressGetData];
    
    //1.导航条
    [self ShowAddressNavBar];
    
    //2.收货地址展示
    [self ShowAddressTableView];
    
    //3.新增收货地址按钮
    [self ShowAddressAddAddressBtn];
}

-(void)ShowAddressGetData
{
    _showAddressGetDataArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"deliveryaddresslist",@"uid":_showUserId}}} method:@"POST"];
    
    _showAddressGetDataArr = _showAddressGetDataArr[0][@"content"][@"response"][@"address_list"];
    
    NSLog(@"%@",_showAddressGetDataArr);
}

#pragma  mark-添加导航条
-(NavigationBar *)ShowAddressNavBar
{
    if (_showAddressNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 69)];
        
        [nav addNavigationBar:@"收货地址管理" NavigationController:_showAddressNavController];
        
        nav.animated = YES;
        
        [self.view addSubview:nav];
        
        _showAddressNavBar = nav;
    }
    return _showAddressNavBar;
}

#pragma mark-收货地址展示
-(UITableView *)ShowAddressTableView
{
    if (_showAddressTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, self.view.frame.size.width, self.view.frame.size.height-69-44)];
        
        tableView.dataSource = self;
        
        tableView.delegate = self;
        
        tableView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:tableView];
        
        _showAddressTableView = tableView;
    }
    return _showAddressTableView;
}

#pragma mark-添加收货地址按钮
-(UIButton *)ShowAddressAddAddressBtn
{
    if (_showAddressAddAddressBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20,  self.view.frame.size.height-74,self.view.frame.size.width-40, 30)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"新增收货地址" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(ShowAddressAddAddressBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _showAddressAddAddressBtn = btn;
    }
    return _showAddressAddAddressBtn;
}
#pragma mark-新增收货地址按钮的响应方法
-(void)ShowAddressAddAddressBtnClick
{
    AddAddressController *add = [AddAddressController new];
    
    add.addAddressNavController = self.showAddressNavController;
    
    [self.showAddressNavController pushViewController:add animated:YES];
}





#pragma mark-UITableViewDataSource

#pragma mark-设置Cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _showAddressGetDataArr.count;
}

#pragma mark-自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShowAddressCell *cell = [ShowAddressCell new];
    
    if (indexPath.row == 0)
    {
        cell.showAddressDefault.hidden = NO;
    }
    
    cell.showAddressName.text =[NSString stringWithFormat:@"收货人:%@",_showAddressGetDataArr[indexPath.row][@"name"]];
    
    
    cell.showAddressNumber.text = [NSString stringWithFormat:@"电话号码:%@",_showAddressGetDataArr[indexPath.row][@"mobile"]];
    
    cell.showAddressAddress.text = [NSString stringWithFormat:@"收货地址:%@%@",_showAddressGetDataArr[indexPath.row][@"area"],_showAddressGetDataArr[indexPath.row][@"address"]];
    
    if ([_showAddressGetDataArr[indexPath.row][@"addr_default"]isEqual:@"2"])
    {
        cell.showAddressDefault.hidden = NO;
    }
    else if ([_showAddressGetDataArr[indexPath.row][@"addr_default"]isEqual:@"1"])
    {
        cell.showAddressDefault.hidden = YES;
    }
    

    return cell;
}

#pragma mark-UITableViewDelegate

#pragma mark-设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83;
}


#pragma mark-左滑删除实现 Delegate 方法
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"删除Cell");
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        NSLog(@"添加Cell");
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除地址";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
