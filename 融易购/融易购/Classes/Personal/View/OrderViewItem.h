//
//  OrderViewItem.h
//  RongYiGou
//
//  Created by mac on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewItem : UIButton

@property (nonatomic,strong)UINavigationController *orderViewItemNavController;

@property (nonatomic,strong)UIViewController *orderViewController;

@property (nonatomic,strong)NSString *orderUserId;

@property(nonatomic,copy)UILabel * orderState;

@property (nonatomic,strong)UIImageView *orderStateIcon;

@property (nonatomic,assign)NSArray *orderStateArr;

@property (nonatomic,strong)NSString *orderTypeStr;

-(void)AddOrderItem: (NSString *)state Icon:(NSString *)icon NavigationController:(UINavigationController *)navController OrderType:(NSString *)orderType ViewController:(UIViewController *)viewController;



@end
