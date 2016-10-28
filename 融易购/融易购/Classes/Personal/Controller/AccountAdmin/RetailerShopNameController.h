//
//  RetailerShopNameController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetailerShopNameController : UIViewController

@property (nonatomic,strong)NavigationBar *retilerShopNameNavBar;

@property (nonatomic,strong)UINavigationController *retilerShopNameNavController;

@property (nonatomic,strong)NSString *retilerShopNameUserId;

@property (nonatomic,strong)UILabel *retilerShopNameLabel;

@property (nonatomic,strong)UITextField *retilerShopNameTextField;

@property (nonatomic,strong)UIButton *retilerShopNameButton;

@property (nonatomic,strong)NSArray *shopNameDataArr;

@end
