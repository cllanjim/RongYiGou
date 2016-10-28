//
//  OrderDetailsController.h
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationBar,OrderInformationView;

@interface OrderDetailsController : UIViewController

@property (nonatomic,strong)UINavigationController *orderNavController;

@property (nonatomic,strong)NavigationBar *orderNavBar;

@property (nonatomic,strong)UIScrollView *orderScrollView;

@property (nonatomic,strong)UIButton *orderAddressBtn;

@property (nonatomic,strong)UIView *orderCRMView;

@property (nonatomic,strong)UIView *orderInformationView;

@property (nonatomic,strong)OrderInformationView *orderInformation;

@property (nonatomic,strong)UIView *orderSettleView;

@property (nonatomic,strong)NSString *orderUserId;

@property (nonatomic,strong)NSArray *orderDetailArr; //接受传回的数据

@end
