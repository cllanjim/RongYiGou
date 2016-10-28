//
//  WeChatNumberController.h
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeChatNumberController : UIViewController


@property (nonatomic,strong)NavigationBar *weChatNavBar;

@property (nonatomic,strong)UINavigationController *weChatNavController;

@property (nonatomic,strong)NSString *weChatUserId;

@property (nonatomic,strong)UILabel *weChatLabel;

@property (nonatomic,strong)UITextField *weChatTextField;

@property (nonatomic,strong)UIButton *weChatButton;

@property (nonatomic,strong)NSArray *weChatDataArr;

@end
