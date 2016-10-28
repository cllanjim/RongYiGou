//
//  LoginInController.h
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"
#import "AuthcodeView.h"

@class LoginInTitleBtn,AuthcodeView;

@interface LoginInController : UIViewController<UITextFieldDelegate,AuthcodeViewDelegate>

@property (nonatomic,strong)NavigationBar *bar;

@property (nonatomic,strong)UITextField *accountNameTextfield;

@property (nonatomic,strong)UITextField *passwordTextfield;

@property (nonatomic,strong)UITextField *verificationCodeTextField;

@property (nonatomic,strong)UIButton *loginBtn;

@property (nonatomic,strong)UIButton *registerBtn;

@property (nonatomic,strong)UIButton *forgetPasswordBtn;

@property (nonatomic,strong)LoginInTitleBtn *accountTitleBtn;

@property (nonatomic,strong)LoginInTitleBtn *passwordTitleBtn;

@property (nonatomic,strong)LoginInTitleBtn *verificationTitleBtn;

@property (nonatomic,strong)AuthcodeView *authCodeView;

@property (nonatomic,strong)NSString *authCodeString;

@end
