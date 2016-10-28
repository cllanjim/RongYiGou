//
//  Register4Controller.h
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"

@interface Register4Controller : UIViewController

@property (nonatomic,strong)NSDictionary *reg4AddressDictionary;

@property (nonatomic,strong)UINavigationController *reg4NavController;

@property (nonatomic,strong)NavigationBar *reg4NavBar;

@property (nonatomic,strong)RegisterView *reg4RegisterView;

@property (nonatomic,strong)UITextField *reg4NameTextField;

@property (nonatomic,strong)UITextField *reg4NumberTextField;

@property (nonatomic,strong)UIButton *reg4NextBUtton;

@end
