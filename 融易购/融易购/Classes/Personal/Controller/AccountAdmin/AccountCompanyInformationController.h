//
//  AccountCompanyInformationController.h
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountCompanyInformationController : UIViewController

@property (nonatomic,strong)NSArray *accountCompanyArr;

@property (nonatomic,strong)UINavigationController *accountCompanyNavController;

@property (nonatomic,strong)NavigationBar *accountCompanyNavBar;

@property (nonatomic,strong)UIScrollView *accountCompanyScrollView;

@property (nonatomic,strong)UILabel *companyName;

@property (nonatomic,strong)UILabel *companyAddress;

@property (nonatomic,strong)UILabel *compyAddress1;

@property (nonatomic,strong)UILabel *companyPerson;

@property (nonatomic,strong)UILabel *companyPhoneNumber;

@property (nonatomic,strong)UIImageView *companyID0;

@property (nonatomic,strong)UIImageView *companyID1;

@property (nonatomic,strong)UIImageView *companyID2;

@property (nonatomic,strong)UIImageView *companyID3;



@end
