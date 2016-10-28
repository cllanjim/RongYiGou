//
//  GoodsListCell.h
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsListCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconImage;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *salesVolumeLabel;

@property (nonatomic,strong)UILabel *shopName;

@property(nonatomic,strong)UILabel *price;

@property (nonatomic,strong)UILabel *shopAddress;

@end
