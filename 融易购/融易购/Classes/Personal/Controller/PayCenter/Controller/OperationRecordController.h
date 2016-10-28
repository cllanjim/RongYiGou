//
//  OperationRecordController.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TransactionQueryView;

@interface OperationRecordController : UIViewController

@property (nonatomic,strong)UINavigationController *operationNavController;

@property (nonatomic,strong)NavigationBar *operationNavBar;

@property (nonatomic,strong)TransactionQueryView *operationView;

@property (nonatomic,strong)NSString *operationUserId;

@property (nonatomic,strong)NSArray *operationArr;

@end
