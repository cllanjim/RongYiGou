//
//  GoodListBtn.h
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodListBtn : UIButton

@property (nonatomic,strong)UILabel *title;

@property(nonatomic,strong)UIImageView *iconImage;

-(void)addTitle:(NSString *)title;
@end
