//
//  OrderView.m
//  RongYiGou
//
//  Created by mac on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderView.h"
#import "OrderViewItem.h"
#import "OrderListController.h"
#import "AdvanceOrderController.h"
#import "CommissionOrderController.h"
#import "MakeupController.h"
#import "GlobalInformation.h"
#import "LoginInController.h"

@interface OrderView()
{
    NSString *_typeIcon;
    
    NSString *_typeStr;
    
    NSArray *_state;
    
    NSArray *_stateIcon;
    
    GlobalInformation *global;
}

@property (nonatomic,strong)UIImageView *typeImageView;

@property(nonatomic,strong)UILabel *type;

@property(nonatomic,strong)UIButton *more;

@property(nonatomic,strong)OrderViewItem *orderViewItem;

@end


@implementation OrderView

-(void)queryOrder:(NSString *)type OrderTypeIcon:(NSString *)icon Orderstate:(NSArray *)state OrderStateIcon:(NSArray *)stateIcon NavigationController:(UINavigationController *)navController ViewController:(UIViewController *)viewController
{
    _typeStr = type;
    
    _typeIcon = icon;
    
    _state = state;
    
    _stateIcon = stateIcon;
    
    _navController = navController;
    
    _viewController = viewController;
    
    global = [GlobalInformation shareManager];
    

    //订单类型图标
    [self TypeImageView];
    
    //订单类型
    [self OrderType];
    
    //查看全部
    [self OrderMore];
    
    //订单查询
    [self OrderViewItem];
}

#pragma mark-订单类型图标
-(UIImageView *)TypeImageView
{
    if (_typeImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, self.frame.size.height/4)];
        
        imageView.backgroundColor = [UIColor whiteColor];
        
        imageView.image = [UIImage imageNamed:_typeIcon];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _typeImageView = imageView;
    }
    return _typeImageView;
}

#pragma mark-订单类型
-(UILabel *)OrderType
{
    if (_type == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, self.frame.size.width/2-40, self.frame.size.height/4)];
        
        label.backgroundColor = [UIColor whiteColor];
        
        label.text = _typeStr;
        
        if ([_typeStr isEqual:@"普通订单"])
        {
            _OdrerTypeStr = @"common";
        }
        else if([_typeStr isEqual:@"预付订单"])
        {
            _OdrerTypeStr = @"meeting";
        }
        else if ([_typeStr isEqual:@"佣金前置订单"])
        {
            _OdrerTypeStr = @"makeup";
        }
        else if ([_typeStr isEqual:@"补差订单"])
        {
            _OdrerTypeStr = @"morder";
        }
        
        label.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:label];
    }
    
    return _type;
}

#pragma mark-查看全部订单按钮
-(UIButton *)OrderMore
{
    if (_more == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height/4)];
        
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setTitle:@"查看全部订单 >" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [btn addTarget:self action:@selector(OrderMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    }
    return _more;
}

#pragma mark-查看全部订单响应按钮
-(void)OrderMoreBtnClick
{
    
    _orderUserId = global.userId;
    
    
    if (_orderUserId.length != 0)
    {
        OrderListController *orderList = [OrderListController new];
        
        orderList.orderStateArr = _state;
        
        orderList.orderTypeBtnTitleStr = _typeStr;
        
        orderList.orderListNavController = _navController;
        
        orderList.orderType = _OdrerTypeStr;
        
        [_navController pushViewController:orderList animated:YES];
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [_viewController presentViewController:login animated:YES completion:nil];
    }
    
    
}


#pragma mark-订单查询
-(OrderViewItem *)OrderViewItem
{
    if (_orderViewItem == nil)
    {
        for (int i = 0; i < _state.count; i ++)
        {
            OrderViewItem *order = [[OrderViewItem alloc]initWithFrame:CGRectMake(10 + (i * self.frame.size.width/5.1), self.frame.size.height/3.5, self.frame.size.width/6, self.frame.size.height*3/5)];
        
            order.orderStateArr = _state;
            
            [order AddOrderItem:[_state objectAtIndex:i] Icon:[_stateIcon objectAtIndex:i] NavigationController:_navController OrderType:_OdrerTypeStr ViewController:_viewController];
            
            order.orderState.text = [_state objectAtIndex:i];
            
            [self addSubview:order];
        }
    }
    return _orderViewItem;
}


@end
