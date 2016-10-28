//
//  AddAddressController.h
//  RongYiGou
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountySelectController.h"

@interface AddAddressController : UIViewController<CountySelectDelegate>

@property (nonatomic,strong)NSString *addUserId;

@property (nonatomic,strong)UINavigationController *addAddressNavController;

@property (nonatomic,strong)NavigationBar *addAddressNavBar;

@property (nonatomic,strong)UIScrollView *addAddressScrollView;

@property(nonatomic,strong)UILabel *addAddressLabel;

@property (nonatomic,strong)UITextField *addAddressTextField;

@property (nonatomic,strong)UITextField *addTextFieldName;

@property (nonatomic,strong)UITextField *addtextFieldNumber;

@property (nonatomic,strong)UIButton *addButtonProvince;

@property (nonatomic,strong)UITextField *addTextFieldCity;

@property (nonatomic,strong)UITextField *addtextFieldCounty;

@property (nonatomic,strong)UITextField *addTextFieldOtherAddress;

@property (nonatomic,strong)UITextField *addtextFieldPostCode;

@property (nonatomic,strong)UITextField *addtextFieldCRM;

@property (nonatomic,strong)UIButton *addAddressButton;

@property (nonatomic,strong)NSString *defaultAddressStr;

@property (nonatomic,strong)NSArray *sendRequestArr;

@property (nonatomic,strong)NSDictionary *areaAddressDic;

@end
