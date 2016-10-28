//
//  ShowAddressController.h
//  RongYiGou
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowAddressController : UIViewController

@property (nonatomic,strong)UINavigationController *showAddressNavController;

@property (nonatomic,strong)NavigationBar *showAddressNavBar;

@property (nonatomic,strong)UITableView *showAddressTableView;

@property (nonatomic,strong)UIButton *showAddressAddAddressBtn;

@property (nonatomic,strong)NSString *showUserId;

@property (nonatomic,strong)NSArray *showAddressGetDataArr;

@end
