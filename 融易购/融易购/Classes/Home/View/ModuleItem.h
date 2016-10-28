//
//  ModuleItem.h
//  RongYiGou
//
//  Created by mac on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailsController.h"

@interface ModuleItem : UIButton

@property (nonatomic,strong)UIImageView *goodImage;

@property (nonatomic,strong)UILabel *goodTitle;

@property (nonatomic,strong)UILabel *goodPrice;

@property (nonatomic,weak)NSDictionary *ModuleDataDic;

@property (nonatomic,strong)UIViewController *viewController;


-(void)addData:(NSDictionary *)dataDic Controller:(UIViewController *)controller;
@end
