//
//  PersonController.h
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface PersonController : UIViewController

@property (nonatomic,strong)NavigationBar *navigationBar;

@property (nonatomic,strong)UIButton *navBarSetBtn;

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)NSString *UserName;

@end
