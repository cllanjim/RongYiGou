//
//  ShopCartModel.h
//  RongYiGou
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopOrderModel.h"

@interface ShoppingCartModel : ShopOrderModel

@property (strong,nonatomic)NSString *imageName; //商品图片

@property (nonatomic,strong)NSString *goodsTitle; //商品标题

@property (nonatomic,strong)NSString *goodsPrice; //商品价格

@property (nonatomic,strong)NSString *cartId;    //购物车ID

@property (nonatomic,assign)BOOL selectState;  //是否选中

@property (nonatomic,assign)int goodsNnm;   //商品数量

/*购物车内商品的规格*/

@property (nonatomic,strong)NSString *realStock;    //商品库存

@property (nonatomic,strong)NSArray *productSpec; //产品规格


-(instancetype)initWithDict:(NSDictionary *)dict;



@end
