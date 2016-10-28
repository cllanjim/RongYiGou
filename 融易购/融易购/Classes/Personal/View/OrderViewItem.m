//
//  OrderViewItem.m
//  RongYiGou
//
//  Created by mac on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderViewItem.h"
#import "OrderListController.h"
#import "GlobalInformation.h"
#import "LoginInController.h"

@interface OrderViewItem()
{
    NSString *_state;
    
    NSString *_stateIcon;
    
    GlobalInformation *global;
}
@end

@implementation OrderViewItem

-(void)AddOrderItem: (NSString *)state Icon:(NSString *)icon NavigationController:(UINavigationController *)navController OrderType:(NSString *)orderType ViewController:(UIViewController *)viewController
{
    _state = state;
    
    _stateIcon = icon;
    
    _orderViewItemNavController = navController;
    
    _orderTypeStr = orderType;
    
    _orderViewController = viewController;
    
    global = [GlobalInformation shareManager];
    
    //小图标
    
    _orderStateIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height*3.5/5)];
    
    _orderStateIcon.image = [UIImage imageNamed:_stateIcon];
    
    _orderStateIcon.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:_orderStateIcon];
    
    //订单展示条
    _orderState = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*3.5/5, self.frame.size.width, self.frame.size.height*1.5/5)];
    
    _orderState.text = _state;
    
    _orderState.textAlignment = NSTextAlignmentCenter;
    
    _orderState.textColor = [UIColor grayColor];
    
    _orderState.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:_orderState];
    
    //点击按钮进入对应的订单列表
    [self addTarget:self action:@selector(orderViewItemClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)orderViewItemClick
{
    _orderUserId = global.userId;
    
    if (_orderUserId.length != 0)
    {
        OrderListController *orderList = [OrderListController new];
        
        orderList.orderStateArr = _orderStateArr;
        
        orderList.orderTypeBtnTitleStr = _orderState.text;
        
        orderList.orderListNavController = self.orderViewItemNavController;
        
        orderList.orderType = _orderTypeStr;
        
        [_orderViewItemNavController pushViewController:orderList animated:YES];
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [_orderViewController presentViewController:login animated:YES completion:nil];
    }
    
    
}


@end
