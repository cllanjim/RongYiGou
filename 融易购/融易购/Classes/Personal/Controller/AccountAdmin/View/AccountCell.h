//
//  AccountCell.h
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountCell : UITableViewCell

@property (nonatomic,strong)NSDictionary *accountInformationDict;

@property (nonatomic,strong)UILabel *accountTitleLabel;

@property (nonatomic,strong)UILabel *accountTextLabel;

@property (nonatomic,strong)UILabel *accountIcon;

@end
