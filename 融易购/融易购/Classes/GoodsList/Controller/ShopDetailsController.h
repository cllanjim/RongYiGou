//
//  ShopDetailsController.h
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopDetailsSelectBtn,GoodsListView;

@interface ShopDetailsController : UIViewController

@property (nonatomic,strong)UINavigationController *shopDetailsNavController;

@property(nonatomic,strong)NavigationBar *shopDetailsNavBar;

@property (nonatomic,strong)UITextField *shopDetailsTextField;

@property (nonatomic,strong)UIButton *shopDetailsClassBtn;

@property (nonatomic,strong)UIImageView *shopDetailsImageView;

@property (nonatomic,strong)UIImageView *shopDetailsLOGO;

@property (nonatomic,strong)UILabel *shopDetailsName;

@property (nonatomic,strong)UIImageView *shopDetailsGrade;

@property (nonatomic,strong)UIButton *shopDetailsIsSelectedBtn;

@property (nonatomic,strong)ShopDetailsSelectBtn *shopSelectBtn;

@property (nonatomic,strong)UIScrollView *shopDetailsScrollView;

@property (nonatomic,strong)GoodsListView *goodsListView;

@end
