//
//  GoodListController.h
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodsListView;

@interface GoodListController : UIViewController

@property (nonatomic,strong)NSString *moduleGoodsListSearchTitle;

@property (nonatomic,strong)UIView *listView;

@property (nonatomic,strong)GoodsListView *goodsListView;

@property (nonatomic,strong)NSArray *moduleGoodsListArr;

@property (nonatomic,strong)NSArray *goodsGetDataArr;

@property (nonatomic,strong)NSArray *shopsGetDataArr;

//从分类传进来的"分类ID""品牌名"
@property (nonatomic,strong)NSString *goodsListCatId;

@property (nonatomic,strong)NSString *goodsListBrand;

@end
