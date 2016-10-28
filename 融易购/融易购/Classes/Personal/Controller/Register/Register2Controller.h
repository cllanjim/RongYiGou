//
//  Register2Controller.h
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"

@interface Register2Controller : UIViewController

@property (nonatomic,strong)UINavigationController *navigationController;

@property (nonatomic,strong)NavigationBar *navigationBar;

@property (nonatomic,strong)UITextField *accountName;

@property (nonatomic,strong)UITextField *passwordTextfield;

@property (nonatomic,strong)UITextField *equalPasswordTextfield;

@property (nonatomic,strong)UIButton *nextBtn;

@property (nonatomic,strong)RegisterView *reg2RegisterView;

@end
