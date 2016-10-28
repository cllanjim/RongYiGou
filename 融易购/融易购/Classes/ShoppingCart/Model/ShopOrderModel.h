//
//  ShopOrderModel.h
//  RongYiGou
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShoppingCartModel;

@interface ShopOrderModel : NSObject

@property (nonatomic,strong)NSString *shopName;

@property(nonatomic,strong)NSMutableArray *goodsDataArr;

@property (nonatomic,assign)BOOL isSelected;


-(instancetype)initWithDict:(NSDictionary *)dict;

@end
