//
//  ShippingCartRank.h
//  RongYiGou
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShippingCartRank : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIImageView *rackIconImageView;

@property (nonatomic,strong)UILabel *rackPriceLabel;

@property (nonatomic,strong)UILabel *rackStockLabel;

@property (nonatomic,strong)UILabel *rackRackLabel;

@property (nonatomic,strong)UITableView *rackRackTableView;

/*****************接受外部传值************************/

@property (nonatomic,strong)NSString *rackPrice;

@property (nonatomic,strong)NSString *rackStock;

@property (nonatomic,strong)NSString *rackIconImage;

@property (nonatomic,strong)NSArray *rackDataArr;

/*****************接受外部传值************************/

@property (nonatomic,strong)UIButton *selectBtn;


-(void)addGoodsRank:(NSString *)price Stock:(NSString *)stock Icon:(NSString *)image Spec:(NSArray *)spec;

@end
