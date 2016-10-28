//
//  OrderInformationView.h
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrderGoodsInformation;

@interface OrderInformationView : UIView

@property (nonatomic,strong)UIView *orderShopView;

@property (nonatomic,strong)OrderGoodsInformation *orderGoodsInformation;

@property (nonatomic,strong)UIView *orderMessage;

@property (nonatomic,strong)UIView *orderSettleMent;

@property (nonatomic,strong)NSArray *GetOrderInformationArr;



//需要信息:店铺LOGO.店铺名称.商品详情.买家留言.结算
-(void)AddOrderInformationView: (NSArray *)informationArr;

@end
