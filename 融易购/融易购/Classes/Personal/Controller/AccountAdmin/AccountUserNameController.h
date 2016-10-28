//
//  AccountUserNameController.h
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountUserNameController : UIViewController<UITextFieldDelegate>


@property (nonatomic,strong)NSString *accountUserId;

@property (nonatomic,strong)UINavigationController *accountUserNameNavController;

@property (nonatomic,strong)NavigationBar *accountUserNameNavBar;

@property (nonatomic,strong)UILabel *userInformationLanel;

@property (nonatomic,strong)UITextField *userInformationTextField;

@property (nonatomic,strong)UIButton *userInformationBtn;

@property (nonatomic,strong)NSArray *backResultArr;

@end
