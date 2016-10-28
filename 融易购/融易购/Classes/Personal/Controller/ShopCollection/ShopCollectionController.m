//
//  ShopCollectionController.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopCollectionController.h"
#import "shopCollectionCell.h"
#import "ShopListCell.h"

@interface ShopCollectionController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL shopSelectEdit;
}
@end

@implementation ShopCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     self.view.backgroundColor = [UIColor whiteColor];
    
    //获取数据
    [self ShopCollectGetData];
    
    //添加导航条
    [self ShopCollectionNavBar];
    
    //添加收藏的店铺
    [self ShopTableVIew];
    
}


#pragma mark-获取数据
-(void)ShopCollectGetData
{
    _shopCollectArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"collectshoplist",@"uid":_UserId}}} method:@"POST"];
    
    NSLog(@"%@",_shopCollectArr);
    
    if (_shopCollectArr[0])
    {
        _shopCollectArr = _shopCollectArr[0][@"content"][@"response"][@"shoplist"];
    }

}

#pragma mark-添加导航栏
-(NavigationBar *)ShopCollectionNavBar
{
    if (_shopCollectionNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        nav.animated = YES;
        
        [nav addNavigationBar:@"店铺收藏" NavigationController:self.navigationController];
        
        _shopCollectionNavBar = nav;
    }
    
    return _shopCollectionNavBar;
}

#pragma mark-添加编辑按钮
-(UIButton *)ShopEditBtn
{
    if (_shopEditBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*2/3, 30, kWidth/3, 29)];
        
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(GoodEditBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_shopCollectionNavBar addSubview:btn];
        
        _shopEditBtn = btn;
    }
    return _shopEditBtn;
}

-(void)GoodEditBtnClick
{
    shopSelectEdit = !shopSelectEdit;
    
    if (shopSelectEdit)
    {
        _shopBottomView.hidden = NO;
        
        [_shopEditBtn setTitle:@"完成" forState:UIControlStateNormal];
        
        [_shopEditBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else
    {
        _shopBottomView.hidden = YES;
        
        [_shopEditBtn setTitle:@"编辑" forState:UIControlStateNormal];
        
        [_shopEditBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}



#pragma mark-添加收藏的店铺;
-(UITableView *)ShopTableVIew
{
    if (_shopTableView == nil)
    {
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        tableview.showsVerticalScrollIndicator = NO;
        
        tableview.dataSource = self;
        
        tableview.delegate = self;
        
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:tableview];
        
        _shopTableView = tableview;
    }
    return _shopTableView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _shopCollectArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    shopCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[shopCollectionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (_shopCollectArr.count != 0)
    {
        [cell.shopImageView sd_setImageWithURL:_shopCollectArr[indexPath.row][@"logo"]];
        
        cell.shopTitleName.text = _shopCollectArr[indexPath.row][@"shopname"];
        
        cell.shopGoodsNumber.text = _shopCollectArr[indexPath.row][@"shop_collect"];
        
        cell.shopAddress.text = _shopCollectArr[indexPath.row][@"area"];
        
        [cell addImageAndText:_shopCollectArr[indexPath.row][@"productlist"]];
    }
   
    return cell;
    
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
    return @"删除";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
