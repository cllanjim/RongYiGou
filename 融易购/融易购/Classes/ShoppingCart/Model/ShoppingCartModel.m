//
//  ShopCartModel.m
//  RongYiGou
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShoppingCartModel.h"

@implementation ShoppingCartModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    
    if (self = [super initWithDict:dict])
    {
        self.goodsNnm = [dict[@"num"] intValue];
        
        self.imageName = dict[@"pic"];
        
        self.goodsTitle = dict[@"pname"];
        
        self.goodsPrice = dict[@"price"];
        
        self.cartId = dict[@"id"];
        
        self.selectState = [dict[@"selectState"]boolValue];
        
        self.realStock = dict[@"real_stock"];
        
        self.productSpec = dict[@"product_spec"];
    }
    return self;
}


@end
