//
//  GoodListController.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodListController.h"
#import "NavigationBar.h"
#import "GoodsListView.h"

@interface GoodListController ()
{
    NavigationBar *_navigation;
    
    UITextField *_searchTextField;
    
    UIButton *_screenBtn;
    
    UIButton *_sortBtn;
}
@end

@implementation GoodListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取数据
    [self GoodsListGetData];
    
    //添加顶部导航条
    [self NavigationBar];
    
    //添加其他部分
    [self GoodsListView];

}

#pragma mark-获取数据
-(void)GoodsListGetData
{
    NSLog(@"%@",_goodsListCatId);
    
    if (_goodsListBrand !=nil && _goodsListCatId != nil)
    {
        _goodsGetDataArr = [NSArray requestWithPath:@"product_list.php" params:@{@"content":@{@"request":@{@"filter":@{@"cat_id":_goodsListCatId,@"brand":_goodsListBrand}}}} method:@"POST"];
        
        _goodsGetDataArr = _goodsGetDataArr[0][@"content"][@"response"][@"product_list"];
        
        
        _shopsGetDataArr = [NSArray requestWithPath:@"product_shop_list.php" params:@{@"content":@{@"request":@{@"filter":@{@"cat_id":_goodsListCatId,@"brand":_goodsListBrand}}}} method:@"POST"];
        
        NSLog(@"%@",_shopsGetDataArr);
        
        _shopsGetDataArr = _shopsGetDataArr[0][@"content"][@"response"][@"shop_info"];
        
    }
    else
    {
        _goodsGetDataArr = _moduleGoodsListArr;
    }

}

#pragma mark-添加顶部导航条
-(NavigationBar *)NavigationBar
{
    if (_navigation == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
        
        [bar addNavigationBar:nil NavigationController:self.navigationController];
        
        bar.animated = YES;
        
        [self.view addSubview:bar];
        
        _navigation = bar;
    }
    
    //添加搜索框和筛选按钮
    [self SearchTextField];
    
    [self ScreenButton];
    
    return _navigation;
}

#pragma mark-添加搜索框

-(UITextField *)SearchTextField
{
    if(_searchTextField == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(_navigation.frame.size.width/10, 20, _navigation.frame.size.width*7/10, _navigation.frame.size.height-20)];
        
        textfield.borderStyle = UITextBorderStyleRoundedRect;
        
        textfield.text = _moduleGoodsListSearchTitle;
        
        textfield.font = kLabelFont;
        
        [_navigation addSubview:textfield];
        
        _searchTextField = textfield;
    }
    return _searchTextField;
}

#pragma mark-取消textfield的第一响应
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_searchTextField resignFirstResponder];
}

#pragma mark-添加筛选按钮
-(UIButton *)ScreenButton
{
    if (_screenBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_navigation.frame.size.width*8/10, 20, _navigation.frame.size.width*2/10, _navigation.frame.size.height-20)];
        
        btn.backgroundColor = kBgColor;
        
        [btn setTitle:@"筛选" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        [_navigation addSubview:btn];
        
        _screenBtn = btn;
    }
    return _screenBtn;
}

#pragma mark-添加其他部分
-(GoodsListView *)GoodsListView
{
    if (_goodsListView == nil)
    {
        GoodsListView *goods = [[GoodsListView alloc]initWithFrame:CGRectMake(0,50, kWidth, kHeight-50)];
        
        [goods addData:_goodsGetDataArr ShopDataArray:_shopsGetDataArr NavigationController:self.navigationController];
        
        [self.view addSubview:goods];
        
        _goodsListView = goods;
    }
    return _goodsListView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
