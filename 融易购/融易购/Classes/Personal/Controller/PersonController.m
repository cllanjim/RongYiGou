//
//  PersonController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PersonController.h"
#import "OrderView.h"
#import "Login/LoginInController.h"
#import "CreditNumberController.h"
#import "ShopCollectionController.h"
#import "GoodsCollectionController.h"
#import "PayCenterController.h"
#import "AccountAdminController.h"
#import "LoginInController.h"


@interface PersonController ()
{
    float heightY;
    
    UIScrollView *_bottomScrollView;
    
    UIView *_userView;
    
    UIImageView *_userImage;
    
    UIButton *_userName;
    
    UIImageView *_userGrade;
    
    UIButton * _userAddress;
    
    UIButton *_followBtn;
    
    NSArray *arrayBtn;
    
    UIView *_payCenterView;
    
    UILabel *_payCenterTitle;
    
    UIImageView *_payCenterIcon;
    
    UIButton *_payCenterMore;
    
    UILabel *_payPublicAccount;
    
    UILabel *_payPrivateAccount;
    
    UIView *_orderList;
    
    NSArray *orderTypeArray;
    
    NSArray *orderTypeIconArray;
    
    NSArray *orderStateArray;
    
    NSArray *orderStateIconArray;
    
    GlobalInformation *global ;

}
@end

@implementation PersonController


-(void)viewWillAppear:(BOOL)animated
{
    global = [GlobalInformation shareManager];
    
    _UserId = global.userId;
    
    _UserName = global.AccountName;
    
    
    if (_UserName.length != 0)
    {
        [_userName setTitle:_UserName forState:UIControlStateNormal];
    }
    else
    {
        [_userName setTitle:@"点击登录" forState:UIControlStateNormal];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    arrayBtn = [[NSArray alloc]initWithObjects:@"关注商品",@"关注店铺",@"授信额度", nil];
    
    orderTypeArray = [[NSArray alloc]initWithObjects:@"普通订单",@"预付订单",@"佣金前置订单",@"补差订单", nil];
    
    orderTypeIconArray = [[NSArray alloc]initWithObjects:@"order_putong.png",@"order_yuding.png",@"order_yongj.png",@"order_bucha.png", nil];
    
    
    
     NSArray *arr1 = [[NSArray alloc]initWithObjects:@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后", nil];
    
     NSArray *arr2 = [[NSArray alloc]initWithObjects:@"待付款",@"已预订",@"已还款", nil];
    
     NSArray *arr3 = [[NSArray alloc]initWithObjects:@"待付款",@"待发货",@"待收货",@"待评价",@"待补差", nil];
    
     NSArray *arr4 = [[NSArray alloc]initWithObjects:@"待补差",@"已补差",@"待罚款", nil];
    
    
      orderStateArray = [[NSArray alloc]initWithObjects:arr1,arr2,arr3,arr4, nil];
    
    
    
    
    NSArray *iconArray1 = [[NSArray alloc]initWithObjects:@"daifuk.png",@"daidah.png",@"daishouh.png",@"daipingj.png",@"shouh.png", nil];
    
    NSArray *iconArray2 = [[NSArray alloc]initWithObjects:@"daifuk.png",@"yiyud.png",@"yihuank.png", nil];
    
     NSArray *iconArray3 = [[NSArray alloc]initWithObjects:@"daifuk.png",@"daidah.png",@"daishouh.png",@"daipingj.png",@"daibuc.png", nil];
    
     NSArray *iconArray4 = [[NSArray alloc]initWithObjects:@"daibuc.png",@"yibuc.png",@"daifak.png", nil];
    
    orderStateIconArray = [[NSArray alloc]initWithObjects:iconArray1,iconArray2,iconArray3,iconArray4, nil];
    
   

    
    
    //添加导航条
    [self NavigationBar];
    
    //底层滚动视图

    [self BottomScrollView];

    //账户信息展示页面
    [self AccountInformationDisplay];
    
    //关注商品 关注店铺 授信额度
    
    [self FllowBnt];
    
    //支付中心
    [self PayCenter];
    
    //订单查询 (普通订单 预付订单 佣金前置订单 补差订单)
    [self OrderList];
    
    
    _bottomScrollView.contentSize = CGSizeMake(0, heightY+44);
}


#pragma mark-添加导航条
-(NavigationBar *)NavigationBar
{
    if (_navigationBar == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        bar.backgroundColor = kBgColor;
    
        [bar addNavigationBar:@"个人中心" NavigationController:nil];
        
        [self.view addSubview:bar];
        
        bar.backButton.hidden = YES;
        
        bar.titleLabel.textColor = [UIColor blackColor];
        
        _navigationBar = bar;
    }
    
    //导航条上按钮
    [self NavBarSetBtn];
    return _navigationBar;
}

#pragma mark-导航条上的设置按钮
-(UIButton *)NavBarSetBtn
{
    if (_navBarSetBtn == nil)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_navigationBar.frame.size.width*8.5/10, 30, 29, 29)];
        
        [button setImage:[UIImage imageNamed:@"set.png"] forState:UIControlStateNormal];
        
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_navigationBar addSubview:button];
        
        _navBarSetBtn = button;
    }
    return _navBarSetBtn;
}


#pragma mark-底层ScrollView
-(UIScrollView *)BottomScrollView
{
    if (_bottomScrollView == nil)
    {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)];
        
        scroll.showsVerticalScrollIndicator = NO;
        
        scroll.bounces = NO;
        
        [self.view addSubview:scroll];
        
        _bottomScrollView = scroll;
    }
    return _bottomScrollView;
}

#pragma mark-账户信息展示页面
-(void)AccountInformationDisplay
{
        //底层View
    [self BottomView];
    
        //用户头像
    [self UserImage];
        
        //用户名称
    [self UserName];
        
        //用户信用等级
    [self UserGrade];
        
        //账户管理 收货地址 按钮
    [self UserAddress];
    
    heightY +=_userView.frame.size.height;
    
}

#pragma mark-底层View
-(UIView *)BottomView
{
    if (_userView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight/7)];
        
        view.backgroundColor = [UIColor redColor];
        
        [_bottomScrollView addSubview:view];
        
        _userView = view;
    }
    return _userView;
}


#pragma mark-用户头像
-(UIImageView *)UserImage
{
    if (_userImage == nil)
    {
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, _userView.frame.size.width/4, _userView.frame.size.width/4)];
        
        imageview.layer.cornerRadius =_userView.frame.size.width/8;
        
        imageview.image = [UIImage imageNamed:@"head.png"];
        
        imageview.contentMode = UIViewContentModeScaleAspectFill;
        
        
        imageview.backgroundColor = [UIColor lightGrayColor];
        
        [_userView addSubview:imageview];
    }
    return _userImage;
}


#pragma mark-用户名称
-(UIButton *)UserName
{
    if (_userName == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_userView.frame.size.width/4+20, 10, _userView.frame.size.width/5, _userView.frame.size.height/6)];
        
        [btn setTitle:@"点击登录" forState:UIControlStateNormal];
     
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn addTarget:self action:@selector(LoginbtnClcik) forControlEvents:UIControlEventTouchUpInside];
        
        [_userView addSubview:btn];
        
        _userName = btn;
    }
    return _userName;
}


#pragma mark-跳转到登录界面
-(void)LoginbtnClcik
{
    
    if (_UserId.length != 0)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"账户已经登录";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [self.navigationController pushViewController:login animated:YES];
    }
    
    
}


#pragma mark-账户等级
-(void)UserGrade
{
    if (_userGrade == nil)
    {
        
        /*******************************************************
        for (int i = 0; i<3; i ++)
        {
            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(_userView.frame.size.width/4+20+(i*_userView.frame.size.height/5), _userView.frame.size.height/6+20, _userView.frame.size.height/6, _userView.frame.size.height/6)];
            
            image.backgroundColor = [UIColor grayColor];
            
            [_userView addSubview:image];
            
            _userGrade = image;
        }
         *****************************************************/
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_userView.frame.size.width/3+20, _userView.frame.size.height/6+20, _userView.frame.size.width/5, _userView.frame.size.height/6)];
        
        label.text = @"青铜达人";
        
        label.textColor = [UIColor whiteColor];
        
        label.font = kLabelFont;
        
        [_userView addSubview:label];
        
    }
}

#pragma mark-账户管理和收货地址
-(UIButton *)UserAddress
{
    if (_userAddress == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_userView.frame.size.width/2, _userView.frame.size.height*3/4, _userView.frame.size.width/2, _userView.frame.size.height/4)];
        
        [btn setTitle:@"账户管理、收获地址 >" forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(UserAddressBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_userView addSubview:btn];
        
        _userAddress = btn;
    }
    return _userAddress;
}

#pragma mark-进入账户管理和收货地址
-(void)UserAddressBtnClick
{
    _UserId = global.userId;
    
    if (_UserId.length == 0)
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
    else
    {
        AccountAdminController *account = [AccountAdminController new];
        
        account.UserId = _UserId;
        
        account.accountNavController = self.navigationController;
        
        [self.navigationController pushViewController:account animated:YES];
    }
    
}

#pragma mark-关注商品、店铺，授信额度
-(UIButton *)FllowBnt
{
    if (_followBtn == nil)
    {
        for (int i = 0; i <3; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i * (kWidth/3)) ,heightY, kWidth/3, kHeight/8)];
            
            btn.backgroundColor = [UIColor redColor];
            
            btn.tag = 100 + i ;
            
            [btn addTarget:self action:@selector(BtnClcik:) forControlEvents:UIControlEventTouchUpInside];
            
            [_bottomScrollView addSubview:btn];
            
            UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, btn.frame.size.height/4, btn.frame.size.width, btn.frame.size.height/4)];
            
            numberLabel.text = @"1000";
            
            numberLabel.textAlignment = NSTextAlignmentCenter;
            
            numberLabel.textColor = [UIColor whiteColor];
            
            [btn addSubview:numberLabel];
            
            UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, btn.frame.size.height/2, btn.frame.size.width, btn.frame.size.height/4)];
            
            textLabel.textColor = [UIColor whiteColor];
            
            textLabel.textAlignment = NSTextAlignmentCenter;
            
            textLabel.text = [arrayBtn objectAtIndex:i];
            
            [btn addSubview:textLabel];
            
            _followBtn = btn;
        }
        
        heightY += kHeight/8 +1;
    }
    return _followBtn;
}

#pragma mark-关注商品、店铺，授信额度 按钮的响应方法
-(void)BtnClcik: (UIButton *)sender
{
    
    _UserId = global.userId;
    
    switch (sender.tag)
    {
        case 100:
        {
            
            if (_UserId.length == 0)
            {
                LoginInController *login = [LoginInController new];
                
                [self presentViewController:login animated:YES completion:nil];
            }
            else
            {
                GoodsCollectionController *goods = [GoodsCollectionController new];
                
                goods.UserId = _UserId;
                
                [self.navigationController pushViewController:goods animated:YES];
            }
            
            
        }
            break;
        case 101:
        {
            if (_UserId.length == 0)
            {
                LoginInController *login = [LoginInController new];
                
                [self presentViewController:login animated:YES completion:nil];
            }
            else
            {
                ShopCollectionController *shop = [ShopCollectionController new];
                
                 shop.UserId = _UserId;
                
                [self.navigationController pushViewController:shop animated:YES];
            }
            
        }
            break;
        case 102:
        {
            if (_UserId.length == 0)
            {
                LoginInController *login = [LoginInController new];
                
                [self presentViewController:login animated:YES completion:nil];
            }
            else
            {
                 CreditNumberController *credit = [CreditNumberController new];
            
                 credit.UserId = _UserId; 
                
                 [self.navigationController pushViewController:credit animated:YES];
            }

        }
            break;
            
        default:
            break;
    }
}


#pragma mark-支付中心
-(void)PayCenter
{
    //底层View
    [self PayCenterView];
    
    //Icon
    [self PayCenterIcon];
    
    //标题
    [self PayCenterTitle];
    
    //更多
    [self PayCenterMore];
    
    //对公账户
    [self PayPublicAccount];
    
    //对私账户
    [self PayPrivateAccount];
}

#pragma mark-底层View
-(UIView*)PayCenterView
{
    if (_payCenterView == nil)
    {
        UIView *View = [[UIView alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/8)];
        
        View.backgroundColor = [UIColor whiteColor];
        
        [_bottomScrollView addSubview:View];
        
        _payCenterView = View;
        
        heightY +=kHeight/8+2;
    }
    return _payCenterView;
}

#pragma mark-图标
-(UIImageView *)PayCenterIcon
{
    if (_payCenterIcon == nil)
    {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, _payCenterView.frame.size.height*2/5)];
        
        image.image = [UIImage imageNamed:@"order_pay.png"];
        
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [_payCenterView addSubview:image];
        
        _payCenterIcon = image;
    }
    return _payCenterIcon;
}

#pragma mark-标题
-(UILabel *)PayCenterTitle
{
    if (_payCenterTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 0,_payCenterView.frame.size.width/2-10,_payCenterView.frame.size.height*2/5)];
        
        label.backgroundColor = [UIColor whiteColor];
        
        label.text = @"支付中心";
        
        label.textColor = [UIColor grayColor];
        
        label.font = [UIFont systemFontOfSize:15];
        
        [_payCenterView addSubview:label];
        
        _payCenterTitle = label;
    }
    return _payCenterTitle;
}


#pragma mark-更多
-(UIButton *)PayCenterMore
{
    if (_payCenterMore == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_payCenterView.frame.size.width/2, 0,_payCenterView.frame.size.width/2,_payCenterView.frame.size.height*2/5)];
        
        [btn setTitle:@"充值、提现、交易明细 >" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [btn addTarget:self action:@selector(PayCenterMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_payCenterView addSubview:btn];
        
        _payCenterMore = btn;
    }
    return _payCenterMore;
}

-(void)PayCenterMoreBtnClick
{

    _UserId = global.userId;
    
    if (_UserId.length == 0)
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
    else
    {
        PayCenterController *pay = [PayCenterController new];
        
        pay.payCenterNav = self.navigationController;
        
        pay.payCenterUserId = _UserId;
        
        [self.navigationController pushViewController:pay animated:YES];
    }

}


#pragma mark-对公账户
-(UILabel *)PayPublicAccount
{
    if (_payPublicAccount == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _payCenterView.frame.size.height*2/5, _payCenterView.frame.size.width/2,  _payCenterView.frame.size.height*3/5)];
        
        [_payCenterView addSubview:label];
        
        UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, label.frame.size.width, label.frame.size.height/2)];
        
        numberLabel.backgroundColor = kBgColor;
        
        numberLabel.text = @"1000.00";
        
        numberLabel.font = kLabelFont;
        
        numberLabel.textAlignment = NSTextAlignmentCenter;
        
        numberLabel.textColor = [UIColor redColor];
        
        [label addSubview:numberLabel];
        
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, label.frame.size.height/2, label.frame.size.width, label.frame.size.height/2)];
        
        textLabel.backgroundColor = kBgColor;
        
        textLabel.text = @"对公账户";
        
        textLabel.font = kLabelFont;
        
        textLabel.textColor = [UIColor grayColor];
        
        textLabel.textAlignment = NSTextAlignmentCenter;
        
        [label addSubview:textLabel];
        
        _payPublicAccount = label;

    }
    return _payPublicAccount;
}

#pragma mark-对私账户
-(UILabel *)PayPrivateAccount
{
    if (_payPrivateAccount == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_payCenterView.frame.size.width/2, _payCenterView.frame.size.height*2/5, _payCenterView.frame.size.width/2,  _payCenterView.frame.size.height*3/5)];
        
        [_payCenterView addSubview:label];
        
        _payPrivateAccount = label;
        
        
        UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, label.frame.size.width, label.frame.size.height/2)];
        
        numberLabel.backgroundColor = kBgColor;
        
        numberLabel.text = @"1000.00";
        
        numberLabel.font = kLabelFont;
        
        numberLabel.textAlignment = NSTextAlignmentCenter;
        
        numberLabel.textColor = [UIColor redColor];
        
        [label addSubview:numberLabel];
        
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, label.frame.size.height/2, label.frame.size.width, label.frame.size.height/2)];
        
        textLabel.backgroundColor = kBgColor;
        
        textLabel.text = @"对私账户";
        
        textLabel.font = kLabelFont;
        
        textLabel.textColor = [UIColor grayColor];
        
        textLabel.textAlignment = NSTextAlignmentCenter;
        
        [label addSubview:textLabel];

        
    }
    return _payPrivateAccount;
}

#pragma mark-订单查询列表
-(UIView *)OrderList
{
    if (_orderList == nil)
    {
        for (int i = 0; i < orderTypeArray.count; i ++)
        {
            OrderView *orderView = [[OrderView alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/5)];
            
            orderView.tag = 200 + i;
            
            orderView.backgroundColor = kBgColor;
            
            [orderView queryOrder:[orderTypeArray objectAtIndex:i]
             
             OrderTypeIcon:[orderTypeIconArray objectAtIndex:i] Orderstate:[orderStateArray objectAtIndex:i] OrderStateIcon:[orderStateIconArray objectAtIndex:i] NavigationController:self.navigationController ViewController:self];
            
            [_bottomScrollView addSubview:orderView];
            
            _orderList = orderView;
            
            heightY +=kHeight/5+2;
        }
    }
    return _orderList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
