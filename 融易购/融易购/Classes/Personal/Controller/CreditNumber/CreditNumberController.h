//
//  CreditNumberController.h
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditNumberController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NavigationBar *creditNavBar;

@property(nonatomic,strong)UIView *creditShowNumber;

@property (nonatomic,strong)UILabel *creditShowContent;

@property (nonatomic,strong)UITableView *creditContent;

@property (nonatomic,strong)NSArray *creditGetDataArr;

@property (nonatomic,strong)NSDictionary *creditGetDataDic;

@end
