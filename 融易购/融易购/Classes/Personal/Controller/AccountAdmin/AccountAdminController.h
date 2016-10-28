//
//  AccountAdminController.h
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountAdminController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)NSString *UserId;

@property (nonatomic,strong)UINavigationController *accountNavController;

@property (nonatomic,strong)NavigationBar *accountNavBar;

@property (nonatomic,strong)UITableView *accountTableView;

@property (nonatomic,strong)UIImagePickerController *accountImagePicker;

@property (nonatomic,strong)NSArray *accountGetDataArr;

@property (nonatomic,strong)NSDictionary *accountGetDataDic;

@end
