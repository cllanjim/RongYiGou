//
//  WithdrawalsController.h
//  RongYiGou
//
//  Created by mac on 16/3/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WithdrawalsController : UIViewController

@property (nonatomic,strong)UINavigationController *rechargeNavController;

@property (nonatomic,strong)NavigationBar *rechargeNavBar;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSDictionary *withDataDic;

@property (nonatomic,strong)NSString *withPayEmail;

@property (nonatomic,strong)NSString *withType;

@property (nonatomic,strong)NSArray *withArr;

@end
