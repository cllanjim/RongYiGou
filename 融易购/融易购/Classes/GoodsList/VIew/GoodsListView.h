//
//  GoodsListView.h
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsListView : UIView

@property(nonatomic,strong)UINavigationController *goodsListNavController;

@property (nonatomic,strong)NSArray *goodsListViewArr;

@property (nonatomic,strong)NSArray *shopListViewArr;

-(void)addData:(NSArray *)dataArray ShopDataArray:(NSArray *)shopDataArr NavigationController:(UINavigationController *)navController;

@end
