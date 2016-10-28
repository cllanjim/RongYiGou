//
//  ShippingCartController.h
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailsCell.h"
#import "ShopOrderModel.h"

@class ShippingCartRank;

@interface ShippingCartController : UIViewController<OrderDetailCellDelegate>

@property (nonatomic,strong)UIView *bottomView;

@property (nonatomic,strong)UIButton *bottomSelectBnt;

@property (nonatomic,strong)UILabel *bottomSelectLabel;

@property (nonatomic,strong)UIButton *bottomConfirmBnt;

@property (nonatomic,strong)UILabel *bottomTotalLabel;

@property (nonatomic,strong)ShippingCartRank *shippingCartRank;

@property (nonatomic,strong)UIView *shippingCartBackgroundView;

@property (nonatomic,strong)UIButton *shippingCartClose;

@property (nonatomic,strong)UIButton *rackOkBtn;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSMutableArray *shippingCartDataMutableArr;

@property (nonatomic,strong)NSArray * deleteBackDataArr;

@property (nonatomic,strong)NSMutableArray *cartModelArr;  //存放单个商品

@property (nonatomic,strong)NSDictionary *cartModelDict;   //存放单个商品内属性

@property (nonatomic,strong)NSMutableArray *orderModelArr; //存放整个店铺的商品



@end
