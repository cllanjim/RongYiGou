//
//  PayCenterController.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayCenterController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UINavigationController *payCenterNav;

@property (nonatomic,strong)NavigationBar *payCenterNavBar;

@property (nonatomic,strong)UITableView *payCenterTableView;

@property (nonatomic,strong)NSString *payCenterUserId;

@end
