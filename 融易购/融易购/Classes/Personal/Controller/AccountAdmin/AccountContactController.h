//
//  AccountContactController.h
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountContactController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong)UINavigationController *accountContactNavController;

@property (nonatomic,strong)NavigationBar *accountContactNavBar;

@property (nonatomic,strong)NSString *accountSexUserId;

@property (nonatomic,strong)UIButton *accountSexBtn1;

@property (nonatomic,strong)UIButton *accountSexBtn2;

@property (nonatomic,strong)NSArray * sendRequestArr;

@end
