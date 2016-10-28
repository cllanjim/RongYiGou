//
//  ProductDetailsController.h
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsController : UIViewController

@property (nonatomic,strong)UINavigationController *productDetailNavController;

@property (nonatomic,strong)NSString *StringId;

@property (nonatomic,strong)UITableView *evaluationListTableView;

@property(nonatomic,strong)UIButton *viewAllEvaluate;

@property (nonatomic,strong)UIButton *close;

@property (nonatomic,strong)UIButton *selectClose;

@property (nonatomic,strong)UIView *bottomNavigationView;

@property (nonatomic,strong)UIButton *enterShop;

@property (nonatomic,strong)UIButton *collectionGoods;

@property (nonatomic,strong)UIButton *shoppingCart;

@property (nonatomic,strong)UIButton *buyImmediate;

@property (nonatomic,strong)NSArray *productDataArr;

@property (nonatomic,strong)NSDictionary *productDataDic;

@property (nonatomic,strong)NSArray *whetherCollectionArr;

@property (nonatomic,strong)NSString *uesrId;

@property (nonatomic,strong)NSArray * detailsDataArr;

@property (nonatomic,strong)NSArray * evaluateDataArr;

@property (nonatomic,strong)NSString *detailDataString;

@property (nonatomic,strong)NSDictionary *sendShippingCartDict;

@property (nonatomic,strong)NSString *specId;  //规格Id

@property (nonatomic,strong)NSString *specText; //产品规格

@property (nonatomic,strong)NSString *productId;  //产品Id

@property (nonatomic,assign)NSString * goodNumber;  //商品数量

@property (nonatomic,assign)int goodSumPrice;  //商品总价格

@property (nonatomic,strong)NSArray *getCartDataArr;  //加入购物车返回数据

@property (nonatomic,strong)NSArray *sendOrderDetailArr; //发送到订单详情的数据


@end
