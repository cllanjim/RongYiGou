//
//  RechargeController.h
//  RongYiGou
//
//  Created by mac on 16/3/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RechargeController : UIViewController

@property (nonatomic,strong)UINavigationController *rechargeNavController;

@property (nonatomic,strong)NavigationBar *rechargeNavBar;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSDictionary *rechrgeDataDic;

@property (nonatomic,strong)NSString *rechrgePayEmail;

@property (nonatomic,strong)NSString *rechrgeType;

@property (nonatomic,strong)NSArray *rechrgeArr;



@end
