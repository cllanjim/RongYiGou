//
//  PayBoundController.h
//  RongYiGou
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationBar;

@interface PayBoundController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong)UINavigationController *payBoundNavController;

@property (nonatomic,strong)NavigationBar *payBoundNavBar;

@property(nonatomic,strong)UILabel *payBoundLabel;

@property (nonatomic,strong)UILabel *payBoundName;

@property(nonatomic,strong)UITextField *payBoundTextField1;

@property(nonatomic,strong)UITextField *payBoundTextField2;

@property (nonatomic,strong)UIButton *payBoundButton;

@property (nonatomic,strong)NSString *payUserId;

@property (nonatomic,strong)NSArray *payBoundArr;

@end
