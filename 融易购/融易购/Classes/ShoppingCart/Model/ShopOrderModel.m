//
//  ShopOrderModel.m
//  RongYiGou
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopOrderModel.h"
#import "ShoppingCartModel.h"

@implementation ShopOrderModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.goodsDataArr = [NSMutableArray array];
        
        self.isSelected = NO;
    }
    return self;
}

@end
