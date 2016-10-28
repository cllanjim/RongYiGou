//
//  EmailNumberController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailNumberController : UIViewController

@property (nonatomic,strong)NavigationBar *emailNumberNavBar;

@property (nonatomic,strong)UINavigationController *emailNumberNavController;

@property (nonatomic,strong)NSString *emailNumberUserId;

@property (nonatomic,strong)UILabel *emailNumberLabel;

@property (nonatomic,strong)UITextField *emailNumberTextField;

@property (nonatomic,strong)UIButton *emailNumberButton;

@property (nonatomic,strong)NSArray *emailNumberDataArr;

@end
