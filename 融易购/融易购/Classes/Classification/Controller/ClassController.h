//
//  ClassController.h
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassGoodsView;

@interface ClassController : UIViewController

@property (nonatomic,strong)NavigationBar *classNavBar;

@property (nonatomic,strong)ClassGoodsView *classGoodsView;

@property (nonatomic,strong)NSArray *tableArrayClass;

@property (nonatomic,strong)NSMutableArray *classGoodsDataArr;

@property (nonatomic,strong)NSMutableArray *GoodsDataMutableArr0;

@property (nonatomic,strong)NSMutableArray *GoodsDataMutableArr1;

@property (nonatomic,strong)NSMutableArray *GoodsDataMutableArr2;

@property (nonatomic,strong)NSMutableArray *GoodsDataMutableArr3;




@end
