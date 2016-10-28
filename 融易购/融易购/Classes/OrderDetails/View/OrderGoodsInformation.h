//
//  OrderGoodsInformation.h
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderGoodsInformation : UIView

@property(nonatomic,strong)UIImageView *orderGoodsImageView;

@property (nonatomic,strong)UILabel *orderGoodsTitle;

@property (nonatomic,strong)UILabel *orderGoodsSpec;

@property (nonatomic,strong)UILabel *orderGoodsPrice;

@property (nonatomic,strong)UILabel *orderGoodsNumber;

@property (nonatomic,strong)NSDictionary *getGoodsDataDic;


-(void)addOrderGoodsInformation:(NSDictionary *)goodsInformation;

@end
