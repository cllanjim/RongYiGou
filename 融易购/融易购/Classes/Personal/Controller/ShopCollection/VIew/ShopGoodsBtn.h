//
//  ShopGoodsBtn.h
//  RongYiGou
//
//  Created by mac on 16/3/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopGoodsBtn : UIButton

@property (nonatomic,strong)UIImageView *goodsBtnICon;

@property (nonatomic,strong)UILabel * goodsBtnText;

@property (nonatomic,strong)NSDictionary *goodsDataDic;

-(void)AddImageAndText:(NSDictionary *)dataDic;

@end
