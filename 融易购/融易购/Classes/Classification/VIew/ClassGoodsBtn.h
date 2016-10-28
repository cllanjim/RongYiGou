//
//  ClassGoodsBtn.h
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassGoodsBtn : UIButton

@property (nonatomic,strong)UINavigationController *classBtnNavController;

@property (nonatomic,strong)NSString *contentStrId;

@property (nonatomic,strong)NSDictionary *contentBrandDic;

@property (nonatomic,strong)UIImageView *classGoodsImageView;

@property (nonatomic,strong)UILabel *classGoodsLabel;

-(void)addInformation:(NSDictionary *)titleDic ContentStr:(NSString *)contentStr NavController:(UINavigationController *)navController;

@end
