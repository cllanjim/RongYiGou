//
//  PhoneNumberController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumberController : UIViewController


@property (nonatomic,strong)NavigationBar *phoneNumberNavBar;

@property (nonatomic,strong)UINavigationController *phoneNumberNavController;

@property (nonatomic,strong)NSString *phoneNumberUserId;

@property (nonatomic,strong)UILabel *phoneNumberLabel;

@property (nonatomic,strong)UITextField *phoneNumberTextField;

@property (nonatomic,strong)UIButton *phoneNumberButton;

@property (nonatomic,strong)NSArray *phoneNumberDataArr;


@end
