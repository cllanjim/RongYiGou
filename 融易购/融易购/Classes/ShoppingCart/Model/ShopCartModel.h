//
//  ShopCartModel.h
//  RongYiGou
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopOrderModel.h"

@interface ShopCartModel : ShopOrderModel

@property (strong,nonatomic)NSString *imageName;

@property (nonatomic,strong)NSString *goodsTitle;

@property (nonatomic,strong)NSString *goodsPrice;

@property (nonatomic,assign)BOOL selectState;

@property (nonatomic,assign)int goodsNnm;

-(instancetype)initWithDict:(NSDictionary *)dict;




@end
