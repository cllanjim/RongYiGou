//
//  AccountRetailerController.h
//  RongYiGou
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountRetailerController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong)UINavigationController *accountRetailerNavController;

@property (nonatomic,strong)NavigationBar *accountRetailNavBar;

@property (nonatomic,strong)NSString *accountRetailUserId;

@property (nonatomic,strong)UILabel *accountRetaillabel;

@property (nonatomic,strong)UITextField *accountRetailTextField;

@property (nonatomic,strong)UIButton *accountRetailBtn;

@property (nonatomic,strong)NSArray *accountRetailDataArr;

@end
