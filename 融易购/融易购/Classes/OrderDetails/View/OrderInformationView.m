//
//  OrderInformationView.m
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderInformationView.h"
#import "OrderGoodsInformation.h"

@interface OrderInformationView()
{
    float YHeight;
    
    UIImageView *_orderShopImageView;
    
    UILabel *_orderShopNameLabel;
    
    UILabel *_orderMessageTitle;
    
    UITextField *_orderMessageTextField;
    
    UILabel *_orderSettleMentNumber;
    
    UILabel *_orderSettleMentSumPrice;
}

@end

@implementation OrderInformationView

-(void)AddOrderInformationView:(NSArray *)informationArr
{
    
    _GetOrderInformationArr = informationArr;
    
    //1.店铺信息
    [self OrderShopView];
    //2.订单信息
    [self OrderGoodsInformation];
    //3.买家留言
    [self OrderMessage];
    //4.商品结算
    [self OrderSettleMent];
}
#pragma  mark-添加店铺信息
-(UIView *)OrderShopView
{
    if (_orderShopView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kCellWidth, self.frame.size.height/10)];
        
        [self addSubview:view];
        
        _orderShopView = view;
        
        YHeight += self.frame.size.height/10;
    }
    
    //1.店铺LOGO
    [self OrderShopImageView];
    
    //2.店铺名称
    [self OrderShopNameLabel];
    
    return _orderShopView;
}

#pragma mark-店铺LOGO
-(UIImageView *)OrderShopImageView
{
    if (_orderShopImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, _orderShopView.frame.size.height-10, _orderShopView.frame.size.height-10)];
        
//        imageView.image = [UIImage imageNamed:@"1.png"];
        
        [imageView sd_setImageWithURL:_GetOrderInformationArr[0][@"companyLogo"]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_orderShopView addSubview:imageView];
        
        _orderShopImageView = imageView;
    }
    return _orderShopImageView;
}

#pragma mark-店铺名称 
-(UILabel *)OrderShopNameLabel
{
    if (_orderShopNameLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderShopView.frame.size.height+5, 5, _orderShopView.frame.size.width*2/3, _orderShopView.frame.size.height-10)];
        
        label.text = _GetOrderInformationArr[0][@"companyName"];
        
        label.font = kLabelFont;
        
        [_orderShopView addSubview:label];
        
        _orderShopNameLabel = label;
    }
    return _orderShopNameLabel;
}

#pragma mark-商品订单
-(OrderGoodsInformation *)OrderGoodsInformation
{
    if (_orderGoodsInformation == nil)
    {
        for (int i = 0; i < _GetOrderInformationArr.count; i ++)
        {
            OrderGoodsInformation *orderGoods = [[OrderGoodsInformation alloc]initWithFrame:CGRectMake(0,YHeight,self.frame.size.width, self.frame.size.height/5)];
            
            [orderGoods addOrderGoodsInformation:_GetOrderInformationArr[i]];
            
            [self addSubview:orderGoods];
            
            _orderGoodsInformation  = orderGoods;
            
            YHeight += self.frame.size.height/5;
        }
    }
    return _orderGoodsInformation;
}

#pragma mark-买家留言
-(UIView *)OrderMessage
{
    if (_orderMessage == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, YHeight, self.frame.size.width, self.frame.size.height/10)];
        
        [self addSubview:view];
        
        _orderMessage = view;
        
        YHeight += self.frame.size.height/10;
    }
    
    //1.标题
    [self OrdersrMessageTitle];
    //2.客户留言
    [self OrdersMessageTextFields];
    
    return _orderMessage;
}

#pragma mark-买家留言标题
-(UILabel *)OrdersrMessageTitle
{
    if (_orderMessageTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _orderMessage.frame.size.width/3, _orderMessage.frame.size.height)];
        
        label.text = @"买家留言:";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [_orderMessage addSubview:label];
        
        _orderMessageTitle = label;
    }
    return _orderMessageTitle;
}

#pragma mark-留言输入框
-(UITextField *)OrdersMessageTextFields
{
    if (_orderMessageTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_orderMessage.frame.size.width/3, 0,  _orderMessage.frame.size.width*2/3, _orderMessage.frame.size.height)];
        
        textField.placeholder = @"选填,可填写您与买家达成一致的要求";
        
        textField.font = kLabelFont;
        
        [_orderMessage addSubview:textField];
        
        _orderMessageTextField = textField;
    }
    return _orderMessageTextField;
}

#pragma mark-商品结算
-(UIView *)OrderSettleMent
{
    if (_orderSettleMent == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,YHeight, self.frame.size.width, self.frame.size.height/10)];
        
        [self addSubview:view];
        
        _orderSettleMent = view;
    }
    
    //1.商品数量
    [self OrderSettleMentNumber];
    //2.商品总价
    [self OrderSettleMentSumPrice];
    return _orderSettleMent;
}
#pragma mark-商品数量
-(UILabel *)OrderSettleMentNumber
{
    if (_orderSettleMentNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderSettleMent.frame.size.width/3, 0, _orderSettleMent.frame.size.width/3, _orderSettleMent.frame.size.height)];
        
        label.text = [NSString stringWithFormat:@"共 %@ 件商品",_GetOrderInformationArr[0][@"goodNumber"]];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [_orderSettleMent addSubview:label];
        
        _orderSettleMentNumber = label;
    }
    return _orderSettleMentNumber;
}

#pragma mark-商品总价
-(UILabel *)OrderSettleMentSumPrice
{
    if (_orderSettleMentSumPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderSettleMent.frame.size.width*2/3, 0, _orderSettleMent.frame.size.width/3, _orderSettleMent.frame.size.height)];
        
        label.text = [NSString stringWithFormat: @"合计:¥ %@",_GetOrderInformationArr[0][@"goodSumPrice"]];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [_orderSettleMent addSubview:label];
        
        _orderSettleMentSumPrice = label;
    }
    return _orderSettleMentSumPrice;
}

@end
