//
//  ShopCartModel.m
//  RongYiGou
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopCartModel.h"

@implementation ShopCartModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if ([self initWithDict:dict])
    {
        self.goodsNnm = [dict[@"num"] intValue];
        
        self.imageName = dict[@"pic"];
        
        self.goodsTitle = dict[@"pname"];
        
        self.goodsPrice = dict[@"price"];
        
        self.selectState = [dict[@"selectState"]boolValue];
    }
    return self;
}


@end
