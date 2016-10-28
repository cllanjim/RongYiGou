//
//  Register3Controller.h
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountySelectController.h"

@interface Register3Controller : UIViewController<CountySelectDelegate>

@property (nonatomic,strong)UINavigationController *reg3NavigationController;

@property (nonatomic,strong)UINavigationController *reg3NavigationController1;

@property (nonatomic,strong)NavigationBar *navigationBar;

@property (nonatomic,strong)UIButton *registerButton;

@property (nonatomic,strong)NSString *registerAreaStr;

@property (nonatomic,strong)UITextField *reg3ExpandAddressTextField;

@property (nonatomic,strong)UITextField *reg3CompanyNameTextField;

@property (nonatomic,strong)UIButton *reg3NextBtn;

@property (nonatomic,strong)NSString *reg3AddressStr;

@property (nonatomic,strong)NSDictionary *reg3Dictionary;


@end
