//
//  AdvanceOrderController.h
//  RongYiGou
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLScrollViewer;

@interface AdvanceOrderController : UIViewController

@property (nonatomic,strong)NSArray *advanceOrderArr;

@property (nonatomic,strong)NSArray *advanceTableViewArr;

@property (nonatomic,strong)UINavigationController *advanceOrderNavController;

@property (nonatomic,strong)NavigationBar *advanceNavBar;

@property (nonatomic,strong)XLScrollViewer *advaceOrderScrollView;


@end
