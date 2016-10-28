//
//  CashRecordsController.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TransactionQueryView;

@interface CashRecordsController : UIViewController

@property (nonatomic,strong)UINavigationController *cashRecordNavController;

@property (nonatomic,strong)NavigationBar *cashRecordNavBar;

@property (nonatomic,strong)TransactionQueryView *cashRecordView;

@property (nonatomic,strong)NSString *cashUserId;

@property (nonatomic,strong)NSArray *cashGetDataArr;

@end
