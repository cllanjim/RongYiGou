//
//  AccountInformationController.h
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountInformationController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *accountInforationArr;

@property (nonatomic,strong)UINavigationController *accountInformationNavController;

@property (nonatomic,strong)NavigationBar *accountNavBar;

@property (nonatomic,strong)UITableView *accountTableView;
@end
