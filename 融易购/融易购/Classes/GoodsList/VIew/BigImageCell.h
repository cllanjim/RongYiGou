//
//  BigImageCell.h
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *iconImageView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *priceLabel;

@property (nonatomic,strong)UILabel *numberLabel;

@property (nonatomic,strong)UIButton * moreBtn;

@end
