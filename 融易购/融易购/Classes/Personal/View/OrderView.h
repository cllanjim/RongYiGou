//
//  OrderView.h
//  RongYiGou
//
//  Created by mac on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderView : UIView

-(void)queryOrder:(NSString *)type OrderTypeIcon:(NSString *)icon Orderstate:(NSArray *)state OrderStateIcon:(NSArray *)stateIcon NavigationController:(UINavigationController *)navController ViewController:(UIViewController *)viewController;


@property (nonatomic,strong)UINavigationController *navController;

@property (nonatomic,strong)UIViewController *viewController;

@property (nonatomic,strong) NSString * OdrerTypeStr;

@property (nonatomic,strong)NSString *orderUserId;

@end
