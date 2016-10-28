//
//  ShopDetailsSelectBtn.h
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopDetailsSelectBtn : UIButton

@property (nonatomic,strong)NSString *title;

@property (nonatomic,strong)NSString *number;

@property (nonatomic,strong)UILabel *textLabel;

@property (nonatomic,strong)UILabel *numLabel;

-(void)addTitle:(NSString *)title Number:(NSString *)number;

@end
