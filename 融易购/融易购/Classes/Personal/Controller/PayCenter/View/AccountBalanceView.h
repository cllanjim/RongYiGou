//
//  AccountBalanceView.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountBalanceView : UIView

@property (nonatomic,strong)NSString *accountName;

@property (nonatomic,strong)NSString *accountType;

@property (nonatomic,strong)NSDictionary *accountBlanceDic;

@property (nonatomic,strong)UILabel *accountNameLabel;

@property (nonatomic,strong)UILabel *accountTypeLabel;

@property (nonatomic,strong)UILabel *accountBalanceLabel;


-(void)addAccountName:(NSString *)name AccountType:(NSString *)type AccountBlance:(NSDictionary *)blanceDic;

@end
