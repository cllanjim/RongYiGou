//
//  RrovinceSelectController.h
//  RongYiGou
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RrovinceSelectController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UINavigationController *provinceSelectNavController;

@property (nonatomic,strong)NavigationBar *  provinceSelsctNavBar;

@property (nonatomic,strong)UITableView *provinceShowTableView;

@property (nonatomic,strong)UITableView *provinceSelectTableView;

@property (nonatomic,strong)NSArray *provinceSelectDataArray;

@property (nonatomic,strong)NSMutableArray *selectModelArr;

@property (nonatomic,strong)NSMutableArray *showModelArr;

@property (nonatomic,strong)NSString *ControllerId;

@end
