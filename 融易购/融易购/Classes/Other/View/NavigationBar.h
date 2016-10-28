//
//  NavigationBar.h
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBar : UIView

@property (nonatomic,strong) UIButton *backButton;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) UINavigationController *navigation;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,assign) BOOL animated;

-(void)addNavigationBar :(NSString *)title NavigationController:(UINavigationController *)navigationController;

@end
