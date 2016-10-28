//
//  OrderListController.h
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLScrollViewer,OneTableView,TwoTableView,ThreeTableView,FourTableView,FiveTableView;

@interface OrderListController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UINavigationController *orderListNavController;

@property (nonatomic,strong)NavigationBar *orderNavBar;

@property(nonatomic,strong)UIButton * orderTypeBtn;

@property (nonatomic,strong)NSString *orderTypeBtnTitleStr;

@property (nonatomic,strong) UIButton *orderSearchBtn;

@property (nonatomic,strong) UITableView *orderTableView;

@property (nonatomic,strong)XLScrollViewer *orderXlScrollView;

@property (nonatomic,strong)NSArray *orderStateArr;

@property (nonatomic,strong)NSMutableArray *orderStateMutableArr;

@property (nonatomic,strong)NSString *orderType;

@property (nonatomic,strong)NSString *orderUserId;

@property (nonatomic,strong)NSArray *orderGetDataArr1;

@property (nonatomic,strong)NSArray *orderGetDataArr2;

@property (nonatomic,strong)NSArray *orderGetDataArr3;

@property (nonatomic,strong)NSArray *orderGetDataArr4;

@property (nonatomic,strong)NSArray *orderGetDataArr5;

@property (nonatomic,strong)NSArray *orderGetDataArr6;



@end
