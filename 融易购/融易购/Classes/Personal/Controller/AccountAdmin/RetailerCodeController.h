//
//  RetailerCodeController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetailerCodeController : UIViewController


@property (nonatomic,strong)NavigationBar *retilerCodeNavBar;

@property (nonatomic,strong)UINavigationController *retilerCodeNavController;

@property (nonatomic,strong)NSString *retilerUserId;

@property (nonatomic,strong)UILabel *retilerLabel;

@property (nonatomic,strong)UITextField *retilerTextField;

@property (nonatomic,strong)UIButton *retilerButton;

@property (nonatomic,strong)NSArray *sendDataArr;

@end
