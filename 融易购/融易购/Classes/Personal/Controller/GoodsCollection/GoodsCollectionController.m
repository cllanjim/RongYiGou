//
//  GoodsCollectionController.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsCollectionController.h"
#import "GoodsCollectionCell.h"

@interface GoodsCollectionController ()
{
    BOOL selectEdit;
}
@end

@implementation GoodsCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
    
    //获取数据
    [self CollectionGetData];
    //添加导航栏
    [self GoodsNavBar];
    
    //添加UICollection
    [self GoodsCollectionView];
    
    //底部操作框
    [self GoodsBottomView];
    
}

#pragma mark-获取数据
-(void)CollectionGetData
{
    _GoodsCollectArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"ollectproductlist",@"uid":_UserId}}} method:@"POST"];
    
    NSLog(@"%@",_GoodsCollectArr);
    
    if (_GoodsCollectArr[0])
    {
         _GoodsCollectArr = _GoodsCollectArr[0][@"content"][@"response"];
    }
    
}


#pragma mark-添加导航栏
-(NavigationBar *)GoodsNavBar
{
    if (_goodsNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        nav.animated = YES;
        
        [nav addNavigationBar:@"商品收藏" NavigationController:self.navigationController];
        
        _goodsNavBar = nav;
    }
    
    //添加编辑按钮
    [self GoodEditBtn];
    
    return _goodsNavBar;
}

#pragma mark-添加编辑按钮
-(UIButton *)GoodEditBtn
{
    if (_goodEditBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*2/3, 30, kWidth/3, 29)];
        
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor: [UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(GoodEditBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_goodsNavBar addSubview:btn];
        
        _goodEditBtn = btn;
    }
    return _goodEditBtn;
}

-(void)GoodEditBtnClick
{
    selectEdit = !selectEdit;
    
    if (selectEdit)
    {
        _goodsBottomView.hidden = NO;
        
        [_goodEditBtn setTitle:@"完成" forState:UIControlStateNormal];
        
        [_goodEditBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        
    }
    else
    {
        _goodsBottomView.hidden = YES;
        
        [_goodEditBtn setTitle:@"编辑" forState:UIControlStateNormal];
        
        [_goodEditBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}



#pragma mark-添加收藏商品
-(UICollectionView *)GoodsCollectionView
{
    if (_goodsCollectionView == nil)
    {
        //先实例化一个层
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        //创建视图
        UICollectionView *view = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44-44) collectionViewLayout:layout];
    
        
        [view registerClass:[GoodsCollectionCell class] forCellWithReuseIdentifier:@"cell"];
        
        view.backgroundColor = [UIColor whiteColor];
        
        view.delegate = self;
        
        view.dataSource = self;
        
        [self.view addSubview:view];
        
        _goodsCollectionView = view;
        
    }
    return _goodsCollectionView;
}

-( NSInteger )collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section

{
    return _GoodsCollectArr.count ;
}

//定义展示的Section的个数

-( NSInteger )numberOfSectionsInCollectionView:( UICollectionView *)collectionView
{
    return 1 ;
}

//每个UICollectionView展示的内容

-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath
{
    GoodsCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier : @"cell" forIndexPath :indexPath];
    
    //    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    
    
    if (_GoodsCollectArr.count != 0)
    {
        [cell.goodsImageView sd_setImageWithURL:_GoodsCollectArr[indexPath.row][@"image"]];
        
        cell.goodsLabel.text = _GoodsCollectArr[indexPath.row][@"name"];
        
        cell.goodsPrice.text = _GoodsCollectArr[indexPath.row][@"price"];
        
        cell.goodsVolume.text = _GoodsCollectArr[indexPath.row][@"sales"];
        
        cell.goodsCollectNumber.text = _GoodsCollectArr[indexPath.row][@"collectnum"];
    }
    
    return cell;
    
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath

{
    
    UICollectionViewCell * cell = ( UICollectionViewCell *)[collectionView cellForItemAtIndexPath :indexPath];
    
    cell. backgroundColor = [ UIColor colorWithRed :(( arc4random ()% 255 )/ 255.0 ) green :(( arc4random ()% 255 )/ 255.0 ) blue :(( arc4random ()% 255 )/ 255.0 ) alpha : 1.0f ];
    
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
    return CGSizeMake ( (kWidth-20)/2 , kHeight/3 );
}

//定义每个UICollectionView 的边距

-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section

{
    return UIEdgeInsetsMake ( 5 , 5 , 5 , 5 );
}

#pragma mark-底部操作条
-(UIView *)GoodsBottomView
{
    if (_goodsBottomView == nil)
    {
        UIView *view = [[UIView  alloc]initWithFrame:CGRectMake(0,kHeight-88, kWidth, 44)];
        
        view.backgroundColor = kBgColor;
        
        view.hidden = YES;
        
        [self.view addSubview:view];
        
        _goodsBottomView = view;
    }
    //添加删除按钮
    [self GoodsDeleteBtn];
    
    return _goodsBottomView;
}

#pragma mark-添加删除按钮
-(UIButton *)GoodsDeleteBtn
{
    if (_goodsDeleteBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*2/3, 5, kWidth/3-10, 34)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"删除" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [_goodsBottomView addSubview:btn];
        
        _goodsDeleteBtn = btn;
    }
    return _goodsDeleteBtn;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
