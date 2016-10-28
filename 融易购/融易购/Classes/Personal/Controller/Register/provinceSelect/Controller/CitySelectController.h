//
//  CitySelectController.h
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitySelectController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSString *CitySelectId;

@property (nonatomic,strong)NSString *CitySelectName;

@property (nonatomic,strong)UINavigationController *citySelectNavController;

@property (nonatomic,strong)NavigationBar *citySelectNavBar;

@property (nonatomic,strong)UITableView *cityShowTableView;

@property (nonatomic,strong)UITableView *citySelectTableView;

@property (nonatomic,strong)NSArray * cityGetdataArr;

@property (nonatomic,strong)NSMutableArray *cityInforArr;

@property (nonatomic,strong)NSString *ControllerId;

@end
