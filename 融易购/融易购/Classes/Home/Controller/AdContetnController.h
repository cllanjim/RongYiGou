//
//  AdContetnController.h
//  RongYiGou
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdContetnController : UIViewController


@property (nonatomic,strong)NSString *adContentId;

@property (nonatomic,strong)NSString *adContentTitle;

@property (nonatomic,strong)UINavigationController *adContentNavController;

@property (nonatomic,strong)NavigationBar *adContentNavBar;

@property (nonatomic,strong)NSArray *adContentArray;

@property (nonatomic,strong)NSString *adContentUserId;

@property (nonatomic,strong)UIWebView *webView;

@end
