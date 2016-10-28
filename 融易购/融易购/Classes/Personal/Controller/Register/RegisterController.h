//
//  RegisterController.h
//  RongYiGou
//
//  Created by mac on 16/1/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface RegisterController : UIViewController

@property (nonatomic,strong)UINavigationController *navigationController;

@property (nonatomic,strong)UILabel *numberLabel;

@property (nonatomic,strong)UITextField *numberTextField;

@property (nonatomic,strong)UIButton *nextBtn;

@property (nonatomic,strong)UIButton *selectBtn;

@property (nonatomic,strong)UIButton *informationBtn;

@property (nonatomic,strong)NavigationBar *navigationBar;

@property (nonatomic,assign)BOOL selectTag;

@property (strong,nonatomic)MBProgressHUD *HUD;

@end
