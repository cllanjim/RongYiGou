//
//  GoodsEvaluate.h
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsEvaluate : UIView

@property(nonatomic,strong)UILabel *title;

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *userName;

@property(nonatomic,strong)UILabel *userText;

@property(nonatomic,strong)UILabel *orderTime;

@property(nonatomic,strong)UILabel *orderParameter;

@property (nonatomic,strong)NSDictionary *goodsDataDic;

@property (nonatomic,strong)NSString *goodsNumber;

-(void)addWithContent: (NSDictionary *)content Number:(NSString *)num;

@end
