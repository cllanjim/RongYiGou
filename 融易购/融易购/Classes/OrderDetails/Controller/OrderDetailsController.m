//
//  OrderDetailsController.m
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderDetailsController.h"
#import "OrderInformationView.h"
#import "ShowAddressController.h"

@interface OrderDetailsController ()
{
    float YHeight;
    
    UILabel *_addressName;
    
    UILabel *_addressNumber;
    
    UILabel *_addressAddress;
    
    UILabel *_addressIcon;
    
    UILabel *_CRMTitle;
    
    UIButton *_CRMBtn;
    
    UIButton *_selectBtn;
    
    UILabel *_orderSettleText;
    
    UIButton *_orderSettleBtn;
}
@end

@implementation OrderDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    
  
    //1.添加导航栏
    [self OrderNavBar];
    
    //0.底部滚动视图
    [self OrderScrollView];
    
    //2.收货地址
    [self OrderAddressBtn];
    
    //3.是否划拨CRM仓库
    [self OrderCRMView];
    
    //4.订单信息
    [self OrderInformation];
    
    //5.底部结算栏
    [self OrderSettleView];
    
    
    _orderScrollView.contentSize = CGSizeMake(self.view.frame.size.width, YHeight);
    
}

#pragma  mark-添加导航栏
-(NavigationBar *)OrderNavBar
{
    if (_orderNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [nav addNavigationBar:@"确认订单" NavigationController:_orderNavController];
        
        nav.animated = YES;
        
        [self.view addSubview:nav];
        
        _orderNavBar = nav;
        
    }
    return _orderNavBar;
}

#pragma  mark-底部滚动视图
-(UIScrollView *)OrderScrollView
{
    if (_orderScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        [self.view addSubview:scrollView];
        
        _orderScrollView = scrollView;
    }
    
    return _orderScrollView;
}


#pragma mark-收货地址
-(UIButton *)OrderAddressBtn
{
    if (_orderAddressBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight/8)];
        
        btn.backgroundColor = kBgColor;
        
        [btn addTarget:self action:@selector(OrderAddressBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_orderScrollView addSubview:btn];
        
        _orderAddressBtn = btn;
        
        YHeight += kHeight/8;
    }
    
    //1.收货人姓名
    [self AddressName];
    
    //2.电话号码
    [self AddressNumber];
    //3.收货地址
    [self AddressAddress];
    //4.指示图标
    [self AddressIcon];
    return _orderAddressBtn;
}

#pragma  mark-收货人姓名
-(UILabel *)AddressName
{
    if (_addressName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderAddressBtn.frame.size.width/20, 5, _orderAddressBtn.frame.size.width/3, _orderAddressBtn.frame.size.height/3-5)];
        
        label.text = @"收货人:欧阳吐司";
        
        label.font = kLabelFont;
        
        [_orderAddressBtn addSubview:label];
        
        _addressName = label;
    }
    return _addressName;
}


#pragma mark-收货人电话号码
-(UILabel *)AddressNumber
{
    if (_addressNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderAddressBtn.frame.size.width/2, 5, _orderAddressBtn.frame.size.width/2.5, _orderAddressBtn.frame.size.height/3-5)];
        
        label.text = @"电话号码:99899889988";
        
        label.font = kLabelFont;
        
        [_orderAddressBtn addSubview:label];
        
        _addressNumber = label;
    }
    return _addressNumber;
}

#pragma  mark-收货人地址
-(UILabel *)AddressAddress
{
    if (_addressAddress == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderAddressBtn.frame.size.width/20, _orderAddressBtn.frame.size.height/3, _orderAddressBtn.frame.size.width*17/20, _orderAddressBtn.frame.size.height*2/3-5)];
        
        label.numberOfLines = 2;
        
        label.text = @"收货地址:福建省福州市台江区鳌峰路海峡电子产业基地A区八楼易乐购";
        
        label.font = kLabelFont;
        
        [_orderAddressBtn addSubview:label];
        
        _addressAddress = label;
        
    }
    return _addressAddress;
}


#pragma mark-指示图标
-(UILabel *)AddressIcon
{
    if (_addressIcon == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderAddressBtn.frame.size.width*18/20, 5, _orderAddressBtn.frame.size.width*2/20, _orderAddressBtn.frame.size.height-10)];
        
        label.text = @">";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:20];
        
        label.textColor = [UIColor lightGrayColor];
        
        [_orderAddressBtn addSubview:label];
        
        _addressIcon = label;
    }
    return _addressIcon;
}

#pragma mark-编辑收货地址
-(void)OrderAddressBtnClick
{
    ShowAddressController *show = [ShowAddressController new];
    
    show.showAddressNavController = self.orderNavController;
    
    show.showUserId = self.orderUserId;
    
    [_orderNavController pushViewController:show animated:YES];
}

#pragma mark-是否划拨CRM仓库
-(UIView *)OrderCRMView
{
    if (_orderCRMView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, kHeight/8, kWidth, 31)];
        
        view.backgroundColor = [UIColor lightGrayColor];
        
        [_orderScrollView addSubview:view];
        
        _orderCRMView = view;
        
        YHeight += 31;
    }
    
    //1.标题
    [self CRMTitle];
    //2.判断按钮
    [self CRMBtn];
    return _orderCRMView;
}

#pragma mark-CRM标题
-(UILabel *)CRMTitle
{
    if (_CRMTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/20, 0, kWidth*7/20, _orderCRMView.frame.size.height)];
        
        label.text = @"是否划拨CRM仓库";
    
        label.font = kLabelFont;
        
        [_orderCRMView addSubview:label];
        
        _CRMTitle = label;
    }
    return _CRMTitle;
}

#pragma mark-CRM单选按钮
-(UIButton *)CRMBtn
{
    if (_CRMBtn == nil)
    {
        for (int i = 0; i < 2; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*8/20 + i * kWidth/6, 5, _orderCRMView.frame.size.height-10, _orderCRMView.frame.size.height-10)];
            
            btn.tag = 100 + i;
            
            btn.backgroundColor = [UIColor orangeColor];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateSelected];
            
            btn.layer.cornerRadius =(_orderCRMView.frame.size.height-10)/2;
            
            [btn addTarget:self action:@selector(CRMBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_orderCRMView addSubview:btn];
            
            _CRMBtn = btn;
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*9.5/20 + i * kWidth/6, 5, _orderCRMView.frame.size.height-10, _orderCRMView.frame.size.height-10)];
        
            label.tag = 10+i;
            
            switch (label.tag)
            {
                case 10:
                {
                    label.text = @"是";
                }
                    break;
                case 11:
                {
                    label.text = @"否";
                }
                    break;
                    
                default:
                    break;
            }
            
            label.font = kLabelFont;
            
            [_orderCRMView addSubview:label];
            
        }
        
    }
    return _CRMBtn;
}

#pragma mark-是否划拨CRM仓库,单选响应
-(void)CRMBtnClick: (UIButton *)sender
{
    if (sender != _selectBtn)
    {
        _selectBtn.selected = NO;
        
        _selectBtn = sender;
    }
    _selectBtn.selected = YES;
}

#pragma mark-结算信息
-(OrderInformationView *)OrderInformation
{
    if (_orderInformation == nil)
    {
        for (int i = 0; i < _orderDetailArr.count ; i ++)
        {
            OrderInformationView *order = [[OrderInformationView alloc]initWithFrame:CGRectMake(0, YHeight, kWidth, 500)];
            
            [order AddOrderInformationView:_orderDetailArr[i]];
            
            [_orderScrollView addSubview:order];
            
            _orderInformation = order;
            
            YHeight += 350;
        }
    }
    return _orderInformation;
}

#pragma mark-底部结算栏
-(UIView *)OrderSettleView
{
    if (_orderSettleView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-88, self.view.frame.size.width, 44)];
        
        view.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:view];
        
        _orderSettleView = view;
    }
    
    //1.商品结算数量和金额
    [self OrderSettleText];
    
    //2.提交订单按钮
    [self OrderSettleBtn];
    
    
    return _orderSettleView;
}

#pragma mark-商品结算数量和金额
-(UILabel *)OrderSettleText
{
    if (_orderSettleText == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_orderSettleView.frame.size.width/4, 0, _orderSettleView.frame.size.width/2, _orderSettleView.frame.size.height)];
        
        label.text = @"共4件,总金额¥131956.00";
        
        label.font = kLabelFont;
        
        [_orderSettleView addSubview:label];
        
        _orderSettleText = label;
    }
    return _orderSettleText;
}

#pragma mark-提交订单按钮
-(UIButton *)OrderSettleBtn
{
    if (_orderSettleBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_orderSettleView.frame.size.width*3/4, 0, _orderSettleView.frame.size.width/4, _orderSettleView.frame.size.height)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"提交订单" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [_orderSettleView addSubview:btn];
        
        _orderSettleBtn = btn;
    }
    return _orderSettleBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
