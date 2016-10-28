//
//  shopCollectionCell.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopGoodsBtn;

@interface shopCollectionCell : UITableViewCell

@property (nonatomic,strong)UIButton *shopSelectBtn;

@property (nonatomic,strong)UIImageView *shopImageView;

@property (nonatomic,strong)UILabel *shopTitleName;

@property (nonatomic,strong)UILabel *shopGoodsNumber;

@property (nonatomic,strong)UILabel *shopAddress;

@property (nonatomic,strong)ShopGoodsBtn *shopGoodsBtn;

@property (nonatomic,assign)BOOL  whetherSelect;

@property (nonatomic,strong)NSDictionary *shopGoodsDic;

-(void)addImageAndText:(NSDictionary *)dataDic;

@end
