//
//  TransactionDetailsController.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TransactionQueryView;

@interface TransactionDetailsController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UINavigationController *tranDetailNavController;

@property (nonatomic,strong)NavigationBar *tranDetailNAvBar;

@property (nonatomic,strong)UIView *tranDetailView;

@property (nonatomic,strong)UITableView *tranDetailTableView;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSArray *tranGetDataArr;

@property (nonatomic,strong)NSString *tranClassStr;

@property (nonatomic,strong)NSString *tranTypeStr;

@end
