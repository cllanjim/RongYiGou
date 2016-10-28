//
//  GoodsCollectionController.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCollectionController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)NavigationBar *goodsNavBar;

@property (nonatomic,strong)UIButton *goodEditBtn;

@property (nonatomic,strong)UICollectionView *goodsCollectionView;

@property (nonatomic,strong)UIView *goodsBottomView;

@property (nonatomic,strong)UIButton *goodsDeleteBtn;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSArray *GoodsCollectArr;


@end
