//
//  RetailerShopCodeController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetailerShopCodeController : UIViewController

@property (nonatomic,strong)NavigationBar *retilerShopCodeNavBar;

@property (nonatomic,strong)UINavigationController *retilerShopCodeNavController;

@property (nonatomic,strong)NSString *retilerShopUserId;

@property (nonatomic,strong)UILabel *retilerShopLabel;

@property (nonatomic,strong)UITextField *retilerShopTextField;

@property (nonatomic,strong)UIButton *retilerShopButton;

@property (nonatomic,strong)NSArray *retilerSendRequestArr;

@end
