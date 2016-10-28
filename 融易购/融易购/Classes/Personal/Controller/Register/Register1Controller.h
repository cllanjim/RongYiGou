//
//  Register1Controller.h
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register1Controller : UIViewController

@property (nonatomic,strong)UINavigationController *navigationController;

@property (nonatomic,strong)NavigationBar *navigationBar;

@property(nonatomic,strong)UITextField * numberTextfield;

@property (nonatomic,strong)UIButton * numberBtn;

@property (nonatomic,strong)UIButton *nextBtn;

@property (nonatomic,strong)NSString *verCodeStr;

@end
