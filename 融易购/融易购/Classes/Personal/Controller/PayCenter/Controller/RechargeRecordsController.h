//
//  RechargeRecordsController.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TransactionQueryView;

@interface RechargeRecordsController : UIViewController

@property (nonatomic,strong)UINavigationController *rechargeNavController;

@property (nonatomic,strong)NavigationBar *rechargeNavBar;

@property (nonatomic,strong)TransactionQueryView *transactionView;

@property (nonatomic,strong)NSString *rechUserId;

@property (nonatomic,strong)NSArray *rechArray;

@end
