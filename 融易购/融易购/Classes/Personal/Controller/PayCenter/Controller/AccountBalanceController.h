//
//  AccountBalanceController.h
//  RongYiGou
//
//  Created by mac on 16/2/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountBalanceView.h"

@interface AccountBalanceController : UIViewController

@property (nonatomic,strong)UINavigationController *accountBalanceNavController;

@property (nonatomic,strong)NavigationBar *accountBalanceNavBar;

@property (nonatomic,strong)NSString *accountUserId;

@property (nonatomic,strong)UIScrollView *accountBalanceScrollView;

@property (nonatomic,strong)AccountBalanceView *accountBalanceView;

@property (nonatomic,strong)AccountBalanceView *accountBalanceView1;

@property (nonatomic,strong)UIButton *accountButton;

@property (nonatomic,strong) NSArray *accountDataArr;

@property (nonatomic,strong)NSDictionary *accountDataDic;

@end
