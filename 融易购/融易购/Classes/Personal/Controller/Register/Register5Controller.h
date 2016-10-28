//
//  Register5Controller.h
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"

@interface Register5Controller : UIViewController

@property (nonatomic,strong)NSString *reg5AccountName;

@property (nonatomic,strong)NSString *reg5AccountPassWord;

@property (nonatomic,strong)NSDictionary *reg5AddressDictionary;

@property (nonatomic,strong)NSString *reg5PersonName;

@property (nonatomic,strong)NSString *reg5PersonNumber;

@property (nonatomic,strong)UINavigationController *reg5NavController;

@property (nonatomic,strong)NavigationBar *reg5NavBar;

@property (nonatomic,strong)RegisterView * reg5RegisterView;

@property (nonatomic,strong)UIButton *reg5IconBtn;

@property (nonatomic,strong)UIButton *reg5IdBtn;

@property (nonatomic,strong)UIButton *reg5TypeBtn;

@property (nonatomic,strong)UIButton *reg5TaxBtn;

@property (nonatomic,strong)UIButton *reg5rganizationBtn;

@property (nonatomic,strong)UIButton *reg5PermitBtn;

@property (nonatomic,strong)UIButton *reg5NextBtn;

@end
