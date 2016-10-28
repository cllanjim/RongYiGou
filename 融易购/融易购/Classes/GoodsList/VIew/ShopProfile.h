//
//  ShopProfile.h
//  RongYiGou
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopProfile : UIView
{
    UILabel *_newGoodsNumber;
    
    UILabel* _followPersonNumber;
    
    UILabel *_shopInformation;
    
    UIButton * _buttonFunction;
    
    
}

@property (nonatomic,strong)UINavigationController *shopProNavController;

@property (nonatomic,strong)UIImageView *iconImage;

@property (nonatomic,strong)UILabel *title;

@property (nonatomic,strong)UILabel* goodsNumber;

@property (nonatomic,strong)NSDictionary *shopDataDic;

-(void)AddShopProfile: (NSDictionary *)information NavController:(UINavigationController *)navContorller;

@end
