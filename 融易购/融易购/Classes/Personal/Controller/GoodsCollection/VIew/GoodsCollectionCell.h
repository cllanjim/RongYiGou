//
//  GoodsCollectionCell.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCollectionCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *goodsImageView;

@property (nonatomic,strong)UILabel *goodsLabel;

@property (nonatomic,strong)UILabel *goodsPrice;

@property (nonatomic,strong)UILabel *goodsVolume;

@property (nonatomic,strong)UILabel *goodsCollectNumber;

@property (nonatomic,strong)UIButton *selectBtn;

@end
