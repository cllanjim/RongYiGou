//
//  QQNumberController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQNumberController : UIViewController


@property (nonatomic,strong)NavigationBar *QQNumberNavBar;

@property (nonatomic,strong)UINavigationController *QQNumberNavController;

@property (nonatomic,strong)NSString *QQNumberUserId;

@property (nonatomic,strong)UILabel *QQNumberLabel;

@property (nonatomic,strong)UITextField *QQNumberTextField;

@property (nonatomic,strong)UIButton *QQNumberButton;

@property (nonatomic,strong)NSArray *QQNumberDataArr;

@end
