//
//  GoodsListView.m
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsListView.h"
#import "GoodsListCell.h"
#import "BigImageCell.h"
#import "ShopListCell.h"
#import "KxMenu.h"
#import "ProductDetailsController.h"
#import "ShopDetailsController.h"

@interface GoodsListView()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UIButton *_screenBtn;
    
    UIButton *_sortBtn;
    
    UITableView *_bottomTableView;
    
    UICollectionView *_bigIconCollectionView;
    
    UITableView *_shopTableView;
    
    BOOL flay;
    
    BOOL flayNumber;

}

@end

@implementation GoodsListView

-(void)addData:(NSArray *)dataArray ShopDataArray:(NSArray *)shopDataArr NavigationController:(UINavigationController *)navController
{
    _goodsListNavController = navController;
    
    _goodsListViewArr = dataArray;
    
    _shopListViewArr = shopDataArr;
    
    //排序(综合.销量.价格)和模式切换(列表和大图模式)
    [self SortButton];
    
    //商品展示(列表模式和大图模式)
    [self ListBottomTableView];
    
    //商品展示(大图模式)
    [self BigImageBottomTableView];
    
    //店铺模式
    [self ShopBottomTableView];
}

#pragma mark-排序(综合.销量.价格)和模式切换(列表和大图模式)
-(UIButton *)SortButton
{
    if (_sortBtn == nil)
    {
        for (int i = 0; i < 4; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i *(kCellWidth/4),0, kCellWidth/4, 35)];
            
            btn.tag = i +100;
            
            btn.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
            
            switch (btn.tag) {
                case 100:
                    [btn setTitle:@"综合" forState:UIControlStateNormal];
                    break;
                case 101:
                    [btn setTitle:@"销量" forState:UIControlStateNormal];
                    break;
                case 102:
                    [btn setTitle:@"价格" forState:UIControlStateNormal];
                    break;
                case 103:
                    [btn setTitle:@"列表模式" forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
            }
            
            [btn setTitle:@"" forState:UIControlStateHighlighted];
            
            btn.titleLabel.font = kLabelFont;
            
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
            
            _sortBtn = btn;
        }
    }
    
    
    return _sortBtn;
}
#pragma mark-综合.销量.价格按钮的响应事件
-(void)btnClick: (UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {
            
        }
            break;
        case 101:
        {
            
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
        
            NSArray *menuItems =
            @[
              
              [KxMenuItem menuItem:@"列表模式"
                             image:[UIImage imageNamed:@"check_icon"]
                            target:self
                            action:@selector(ListBtnClcik:)],
              
              [KxMenuItem menuItem:@"大图模式"
                             image:[UIImage imageNamed:@"action_icon"]
                            target:self
                            action:@selector(BigIconBtnClick:)],
              
              [KxMenuItem menuItem:@"店铺模式"
                             image:[UIImage imageNamed:@"check_icon"]
                            target:self
                            action:@selector(ShopBtnClick:)],
              
              ];
            
            
            [KxMenu showMenuInView:self
                          fromRect:sender.frame
                         menuItems:menuItems];
            
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark-列表模式
-(void)ListBtnClcik:(KxMenuItem *)sender
{
    
    
    [_sortBtn setTitle:sender.title forState:UIControlStateNormal];
    
    _bottomTableView.hidden = NO;
    
    _bigIconCollectionView.hidden = YES;
    
    _shopTableView.hidden = YES;
}

#pragma mark-大图模式
-(void)BigIconBtnClick:(KxMenuItem *)sender
{
    [_sortBtn setTitle:sender.title forState:UIControlStateNormal];
    
    _bottomTableView.hidden = YES;
    
    _bigIconCollectionView.hidden = NO;
    
    _shopTableView.hidden = YES;
}

#pragma mark-店铺模式
-(void)ShopBtnClick:(KxMenuItem *)sender
{
    [_sortBtn setTitle:sender.title forState:UIControlStateNormal];
    
    _bottomTableView.hidden = YES;
    
    _bigIconCollectionView.hidden = YES;
    
    _shopTableView.hidden = NO;
}

#pragma mark-添加底层TableView(列表形式)
-(UITableView *)ListBottomTableView
{
    if (_bottomTableView == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 35, kCellWidth, self.frame.size.height-35-44)];
        
        table.tag = 111;
        
        table.dataSource = self;
        
        table.delegate = self;
        
        [self addSubview:table];
        
        _bottomTableView = table;
    }
    return _bottomTableView;
}


#pragma mark-添加底层TableView(店铺模式)
-(UITableView *)ShopBottomTableView
{
    if (_shopTableView == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 35, kCellWidth, self.frame.size.height-35-44)];
        
        table.hidden = YES;
        
        table.tag = 333;
        
        table.dataSource = self;
        
        table.delegate = self;
        
        [self addSubview:table];
        
        _shopTableView = table;
    }
    return _shopTableView;
}


#pragma mark-TableView Delegate 和 Datasource 方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        return 100;
    }
    else if (tableView.tag == 333)
    {
        return 150;
    }
    return 0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _goodsListViewArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        static NSString *CellIdentifer = @"Cell";
        
        GoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        
        if (cell == nil) {
            cell = [[GoodsListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifer];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        //列表模式下
        [cell.iconImage sd_setImageWithURL:_goodsListViewArr[indexPath.row][@"pic"]];
        
        cell.titleLabel.text = _goodsListViewArr[indexPath.row][@"name"];
        
        cell.salesVolumeLabel.text = [NSString stringWithFormat:@"销售量:%@",_goodsListViewArr[indexPath.row][@"sales"]];
        
        cell.shopName.text = _goodsListViewArr[indexPath.row][@"company"];
        
        cell.price.text = [NSString stringWithFormat:@"¥ %@",_goodsListViewArr[indexPath.row][@"price"]];
        
    
        return cell;
        
    }
    else if (tableView.tag == 333)
    {
        static NSString *CellIdentifer = @"Cell";
        
        ShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        
        if (cell == nil) {
            cell = [[ShopListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifer];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }

        [cell AddGoodsData:_shopListViewArr[indexPath.row]];
        
        //店铺模式下
        [cell.iconImageView sd_setImageWithURL:_shopListViewArr[indexPath.row][@"logo"]];
        
        return cell;
        
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        ProductDetailsController *product = [ProductDetailsController new];
        
        product.StringId = _goodsListViewArr[indexPath.row][@"id"];
        
        product.productDetailNavController = self.goodsListNavController;
        
        [self.goodsListNavController pushViewController:product animated:YES];
        
    }
    else if (tableView.tag == 333)
    {
        ShopDetailsController *shopDetail = [ShopDetailsController new];
        
        shopDetail.shopDetailsNavController = self.goodsListNavController;
        
        [self.goodsListNavController pushViewController:shopDetail animated:YES];
    }
}




#pragma mark-添加底层TableView(大图模式)
-(UICollectionView *)BigImageBottomTableView
{
    if (_bigIconCollectionView == nil)
    {
        //先实例化一个层
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        //创建视图
        UICollectionView *view = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 35, kCellWidth, self.frame.size.height-35-44) collectionViewLayout:layout];
        
        view.hidden = YES;
        
        [view registerClass:[BigImageCell class] forCellWithReuseIdentifier:@"cell"];
        
        view.backgroundColor = [UIColor whiteColor];
        
        view.delegate = self;
        
        view.dataSource = self;
        
        [self addSubview:view];
        
        _bigIconCollectionView = view;
        
    }
    return _bigIconCollectionView;
}

-( NSInteger )collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section

{
    return _goodsListViewArr.count ;
}

//定义展示的Section的个数

-( NSInteger )numberOfSectionsInCollectionView:( UICollectionView *)collectionView
{
    return 1 ;
}

//每个UICollectionView展示的内容

-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath
{
    BigImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier : @"cell" forIndexPath :indexPath];
    
    //    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    [cell.iconImageView sd_setImageWithURL:_goodsListViewArr[indexPath.row][@"pic"]];
    
    cell.titleLabel.text = _goodsListViewArr[indexPath.row][@"name"];
    
    cell.numberLabel.text = [NSString stringWithFormat:@"销售量:%@",_goodsListViewArr[indexPath.row][@"sales"]];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"¥ %@",_goodsListViewArr[indexPath.row][@"price"]];
    
    return cell;
    
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath

{
    UICollectionViewCell * cell = ( UICollectionViewCell *)[collectionView cellForItemAtIndexPath :indexPath];
    
    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
    
    
    ProductDetailsController *product = [ProductDetailsController new];
    
    product.StringId = _goodsListViewArr[indexPath.row][@"id"];
    
    product.productDetailNavController = self.goodsListNavController;
    
    [self.goodsListNavController pushViewController:product animated:YES];
    
}

//返回这个UICollectionViewCell是否可以被选择

-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath

{
    return YES ;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath

{
    return CGSizeMake ( (kCellWidth-20)/2 , 205);
}

//定义每个UICollectionView 的边距

-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section

{
    return UIEdgeInsetsMake ( 5 , 5 , 5 , 5 );
}



@end
