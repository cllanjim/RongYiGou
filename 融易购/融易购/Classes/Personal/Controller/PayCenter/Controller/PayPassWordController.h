//
//  PayPassWordController.h
//  RongYiGou
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayPassWordController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong)UINavigationController *payPasswordNavController;

@property (nonatomic,strong)NavigationBar *payPasswordNavBar;

@property (nonatomic,strong)UILabel *payPassWordLabel;

@property (nonatomic,strong)UILabel *payPasswordName;

@property (nonatomic,strong)UITextField *payPassWordTextField1;

@property (nonatomic,strong)UITextField *payPassWordTextField2;

@property (nonatomic,strong)UITextField *payPassWordTextField3;

@property (nonatomic,strong)UITextField *payPassWordTextField4;

@property (nonatomic,strong)UIButton *payPassWordBtton;

@property (nonatomic,strong)NSString *payUserId;

@property (nonatomic,strong)NSArray *payPassWordArr;

@end
