//
//  CountySelectController.h
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountySelectController;

@protocol CountySelectDelegate <NSObject>


@optional
-(void)CountySelect:(CountySelectController *)countySelect Address:(NSDictionary *)address;

-(void)CountySelectAddress:(CountySelectController *)countySelect Address:(NSDictionary *)address;

@end

@interface CountySelectController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSString *provinceName;

@property (nonatomic,strong)NSString *provinceId;

@property (nonatomic,strong)NSString *cityName;

@property (nonatomic,strong)NSString *cityId;

@property (nonatomic,strong)UINavigationController *countyNavController;

@property (nonatomic,strong)NavigationBar *countyNavBar;

@property (nonatomic,strong)UITableView *countySelectTableView;

@property (nonatomic,strong)UITableView *countShowTableView;

@property (nonatomic,strong)NSArray *countGetDataArr;

@property (nonatomic,strong)NSMutableArray *countInforArr;

@property (nonatomic,strong)id<CountySelectDelegate> delegate;

@property (nonatomic,strong)NSString *ControllerId;


@end
