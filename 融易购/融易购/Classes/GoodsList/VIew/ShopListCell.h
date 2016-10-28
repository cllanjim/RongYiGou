//
//  ShopListCell.h
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopListCell : UITableViewCell

@property(nonatomic,strong)UIImageView *iconImageView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *goodsPrice;

@property (nonatomic,strong)UILabel *creditLabel;

@property (nonatomic,strong)UIButton *goodsBtn;

@property (nonatomic,strong)UIImageView *goodsBtnImageView;

@property (nonatomic,strong)UILabel *goodsBtnLabel;

@property (nonatomic,strong)NSDictionary *goodsDic;



-(void)AddGoodsData:(NSDictionary *)goodsDic;

@end
