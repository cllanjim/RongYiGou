//
//  ShopCollectionController.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCollectionController : UIViewController

@property (nonatomic,strong)NavigationBar *shopCollectionNavBar;

@property (nonatomic,strong)UIButton *shopEditBtn;

@property (nonatomic,strong)UITableView *shopTableView;

@property (nonatomic,strong)UIView *shopBottomView;

@property (nonatomic,strong)UIButton *shopDeleteBtn;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSArray *shopCollectArr;

@property (nonatomic,strong)NSDictionary *shopCollectDic;

@end
