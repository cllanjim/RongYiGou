//
//  ProductDetailsController.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProductDetailsController.h"
#import "NavigationBar.h"
#import "SDCycleScrollView.h"
#import "GoodListBtn.h"
#import "GoodsEvaluate.h"
#import "ShopProfile.h"
#import "MJRefresh.h"
#import "EvaluationListCell.h"
#import "CommodityParameters.h"
#import "SelectionSpecifications.h"
#import "OrderDetailsController.h"
#import "ShopDetailsController.h"
#import "LoginInController.h"
#import "CommonFunc.h"


@interface ProductDetailsController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    float heightY;
    
    NavigationBar *_navigationBar;
    
    UIButton *_navButton;
    
    UIButton *_navRightButton;
    
    UIScrollView *_bottomScrollView;
    
    UIScrollView *_scrollView;
    
    SDCycleScrollView *_sdcycleScrollView;
    
    UIView *_informationView;
    
    UILabel *_informationTitle;
    
    UIButton *_informationShareBtn;
    
    UILabel *_informationPrice;
    
    UILabel *_informationPrompt;
    
    UILabel *_informationGoodsType;
    
    UILabel *_informationPostage;
    
    UILabel *_informationSalesVolume;
    
    UILabel *_informationStoreAddress;
    
    GoodListBtn *_goodListBtn;
    
    GoodListBtn *_goodListBtnColor;
    
    GoodsEvaluate *_goodsEvaluate;
    
    ShopProfile *_shopProfile;
    
    UIImageView *_showImageView;
    
    UIWebView *_webView;
    
    CommodityParameters *_parametersView;
    
    UIView *screenView;
    
    SelectionSpecifications *_specifications;
    
    GlobalInformation *global;
    
}
@end

@implementation ProductDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    global = [GlobalInformation shareManager];
    
    _uesrId = global.userId;
    
    //获取数据
    [self ProductGetData];
    
    //导航条
    [self NavigationBar];
    
    //最底层的UIScrollView
    [self BottomScrollVIew];
    
    //底层滚动视图
    [self ScrollView];
    
    //图片展示区
    [self SDCycleScrollView];
    
    //商品信息展示
    [self InformationView];
    
    //查看产品参数
    [self GoodListBtn];
    
    //商品类型选择
    [self GoodListColor];
    
    //用户评价
    [self GoodsEvaluate];
    
    //店铺详情
    [self ShopProfile];
    
    //继续拖动查看详情
    [self WebView];
    
    //商品评价
    [self EvaluationListTableView];
    
    //底部导航栏
    [self BottomNavigation];
    

    _scrollView.contentSize = CGSizeMake(0, heightY);
    

    _scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //上拉，执行对应的操作---改变底层滚动视图的滚动到对应位置
        //设置动画效果
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
             _bottomScrollView.contentOffset = CGPointMake(0,_scrollView.frame.size.height);

        } completion:^(BOOL finished) {
            //结束加载
            [_scrollView.mj_footer endRefreshing];
        }];
        
        
    }];
    
    //设置UIWebView 有下拉操作
    _webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //下拉执行对应的操作
        _bottomScrollView.contentOffset = CGPointMake(0, 0);
        //结束加载
        [_webView.scrollView.mj_header endRefreshing];
    }];
    
}

#pragma mark-获取数据
-(void)ProductGetData
{

    //获取商品详情
    _productDataArr = [NSArray requestWithPath:@"product_detail.php" params:@{@"content":@{@"request":@{@"filter":@{@"product_id":_StringId}}}} method:@"POST"];

    _productDataDic = _productDataArr[0][@"content"][@"response"][@"rows"];
    
    //获取商品描述
    _detailsDataArr = [NSArray requestWithPath:@"product_detail_desc.php" params:@{@"content":@{@"request":@{@"product_id":_StringId}}} method:@"POST"];
    
    
    NSLog(@"%@",_detailsDataArr[0][@"content"][@"response"][@"desc"]);
    
    NSString *details = [NSString Base64Decode:_detailsDataArr[0][@"content"][@"response"][@"desc"]];
    
    _detailDataString = details;
    

    //获取商品评价
    _evaluateDataArr = [NSArray requestWithPath:@"product_reviews.php" params:@{@"content":@{@"request":@{@"product_id":_StringId}}} method:@"POST"];
    
}

#pragma mark-导航条
-(NavigationBar *)NavigationBar
{
    if (_navigationBar == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
    
        bar.animated = YES;
        
        [bar addNavigationBar:nil NavigationController:self.navigationController];
        
        [self.view addSubview:bar];

        _navigationBar = bar;
    }
    
    //添加[商品.详情.评价]点击栏
    [self NavButton];
    
    //添加导航栏右侧按钮
    [self NavRightButton];
    
    return _navigationBar;
}
#pragma mark-添加[商品.详情.评价]点击栏
-(UIButton *)NavButton
{
    if (_navButton == nil)
    {
        NSArray *array = [[NSArray alloc]initWithObjects:@"商品",@"详情",@"评价", nil];
        
        for (int i = 0; i < 3; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_navigationBar.frame.size.width/10+10 + i *((_navigationBar.frame.size.width*4/5-20)/3), 20, (_navigationBar.frame.size.width*4/5 - 40)/3, _navigationBar.frame.size.height-20)];
            
            btn.tag = i +100;
            
            btn.backgroundColor = [UIColor lightGrayColor];
            
            btn.titleLabel.font = kLabelFont;
            
            [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
            
            [btn setTitle:@"" forState:UIControlStateHighlighted];
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_navigationBar addSubview:btn];
            
            _navButton = btn;
        }
    }
    return _navButton;
}

#pragma mark-商品.详情.评价按钮的响应方法
-(void)BtnClick: (UIButton *)sender
{
    switch (sender.tag)
    {
        case 100:
        {
            _evaluationListTableView.hidden = YES;
            
            _bottomScrollView.contentOffset = CGPointMake(0, 0);
    
        }
            break;
        case 101:
        {
            _evaluationListTableView.hidden = YES;
            
             _bottomScrollView.contentOffset = CGPointMake(0,_scrollView.frame.size.height);
        
        }
            break;
        case 102:
        {
            _evaluationListTableView.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}



#pragma mark-添加导航栏右侧按钮
-(UIButton *)NavRightButton
{
    if (_navRightButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_navigationBar.frame.size.width*9/10-10, 20, _navigationBar.frame.size.width/10+10, _navigationBar.frame.size.height-20)];
        
        btn.backgroundColor = [UIColor darkGrayColor];
        
        [btn setTitle:@"..." forState:UIControlStateNormal];
        
        [_navigationBar addSubview:btn];
        
        _navRightButton = btn;
    }
    return _navRightButton;
}

#pragma mark-最底层的UIScrollView
-(UIScrollView *)BottomScrollVIew
{
    if (_bottomScrollView == nil)
    {
        UIScrollView *bottomScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, kWidth, kHeight-50-44)];
        
        bottomScr.contentSize = CGSizeMake(kWidth, (kHeight-50-44) * 2);
        //设置分页效果
        bottomScr.pagingEnabled = YES;
        
        bottomScr.scrollEnabled = NO;
        
        [self.view addSubview:bottomScr];
        
        _bottomScrollView = bottomScr;
    }
    return _bottomScrollView;
}

#pragma mark-底部滚动视图
-(UIScrollView *)ScrollView
{
    if (_scrollView == nil)
    {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, kWidth, kHeight-50-44)];
        
        scroll.delegate = self;
        
        scroll.showsVerticalScrollIndicator = NO;
        
        [_bottomScrollView addSubview:scroll];
        
        _scrollView = scroll;
    }
    return _scrollView;
}

#pragma mark-图片轮播展示
-(SDCycleScrollView *)SDCycleScrollView
{
    if (_sdcycleScrollView == nil)
    {
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 5,_scrollView.frame.size.width,_scrollView.frame.size.height/2) imageURLStringsGroup:_productDataDic[@"pic_more"]];
        
        cycleScrollView.autoScroll = NO;
        
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        
        [_scrollView addSubview:cycleScrollView];
        
        _sdcycleScrollView = cycleScrollView;
        
        heightY += _sdcycleScrollView.frame.size.height + 5;

    }
    return _sdcycleScrollView;
}

#pragma mark-商品信息简介
-(UIView *)InformationView
{
    if (_informationView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, heightY, kWidth,_scrollView.frame.size.height/5 )];
        
        view.backgroundColor = kBgColor;
        
        [_scrollView addSubview:view];
        
        _informationView = view;
        
         heightY += _informationView.frame.size.height + 5;

    }
    
    //标题
    [self InformationTitle];
    
    //分享按钮
    [self InformationShareBtn];
    
    //价格
    [self InformationPrice];
    
    //价格提示(预定商品才会有)
    [self InformationPrompt];
    
    //商品种类
    [self InformationGoodsType];
    
    //邮费.销售量.地区
    [self InformationLabel];
    
    return _informationView;
}

#pragma mark-商品信息-标题
-(UILabel *)InformationTitle
{
    if (_informationTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, _informationView.frame.size.width*4/5-10, _informationView.frame.size.height/3)];
        
        label.text = _productDataDic[@"name"];
        
        label.numberOfLines = 2;
        
        label.font =kLabelFont;
        
        [_informationView addSubview:label];
        
        _informationTitle = label;
    }
    return _informationTitle;
}


#pragma mark-商品信息-分享
-(UIButton *)InformationShareBtn
{
    if (_informationShareBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_informationView.frame.size.width*4/5, 0, _informationView.frame.size.width/5, _informationView.frame.size.height/3)];
        
        [btn setTitle:@"分享" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        
        [_informationView addSubview:btn];
        
        _informationShareBtn = btn;
    }
    return _informationShareBtn;
}


#pragma mark-商品信息-价格
-(UILabel *)InformationPrice
{
    if (_informationPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, _informationView.frame.size.height/3, _informationView.frame.size.width/4-5, _informationView.frame.size.height/3)];
        
        if ([_productDataDic[@"price"]isEqual:@""])
        {
            label.text = @"";
        }
        else
        {
            label.text = [NSString stringWithFormat:@"¥%@",_productDataDic[@"price"]];
        }
    
        
        label.textColor = [UIColor redColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [_informationView addSubview:label];
        
        _informationPrice = label;
    }
    return _informationPrice;
}

#pragma mark-商品信息-提示语
-(UILabel *)InformationPrompt
{
    if (_informationPrompt == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_informationView.frame.size.width/4, _informationView.frame.size.height/2.5, _informationView.frame.size.width/4, _informationView.frame.size.height/5)];
        if ([_productDataDic[@"type"]isEqual:@"3"])
        {
             label.text = @"预付10%保证金";
        }
               
        label.font = [UIFont systemFontOfSize:11];
        
        label.textAlignment = NSTextAlignmentNatural;
        
        [_informationView addSubview:label];
    }
    return _informationPrompt;
}

#pragma mark-商品信息-商品类型
-(UILabel *)InformationGoodsType
{
    if (_informationGoodsType == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_informationView.frame.size.width/2, _informationView.frame.size.height/3, _informationView.frame.size.width/2-10, _informationView.frame.size.height/3)];
        

        if ([_productDataDic[@"type"] isEqual:@"0"])
        {
             label.text = @"定价销售商品";
        }
        else if ([_productDataDic[@"type"]isEqual:@"3"])
        {
             label.text = @"预定商品";
        }
        else if ([_productDataDic[@"type"]isEqual:@"4"])
        {
             label.text = @"佣金前置商品";
        }
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [_informationView addSubview:label];
        
        _informationGoodsType = label;
    }
    return _informationGoodsType;
}

#pragma mark-商品信息-邮费.销售量.店铺地址

-(UILabel *)InformationLabel
{
    if (_informationPostage == nil)
    {
        for (int i = 0; i < 3; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20 +i *(_informationView.frame.size.width-40)/3 , _informationView.frame.size.height*2/3, (_informationView.frame.size.width-40)/3, _informationView.frame.size.height/3)];
            
            label.tag = i +10;
            
            switch (label.tag)
            {
                case 10:
                {
                    if ([_productDataDic[@"freight_type"]isEqual:@"0"])
                    {
                        label.text = @"邮费:卖家承担";
                    }
                    else if([_productDataDic[@"freight_count"]isEqual:@"1"])
                    {
                        label.text = @"邮费:买家承担";
                    }
                    else
                    {
                        label.text = @"邮费:待定";
                    }
                }
                    break;
                case 11:
                {
                    label.text = [NSString stringWithFormat:@"月销售%@笔",_productDataDic[@"sales"]];
                    label.textAlignment = NSTextAlignmentCenter;
                }
                    break;
                case 12:
                    
                {
                    if (![_productDataDic[@"city_name"] isEqualToString:@""])
                    {
                        label.text = _productDataDic[@"city_name"];
                        
                        label.textAlignment = NSTextAlignmentRight;
                    }
                    else
                    {
                       label.text =@"未知地址";
                        
                       label.textAlignment = NSTextAlignmentRight;
                    }
                }
                    
                    break;
                    
                default:
                    break;
            }
            
            label.font = kLabelFont;
            
            [_informationView addSubview:label];
        }
    }
    return _informationPostage;
}

#pragma mark-添加查看商品参数
-(GoodListBtn *)GoodListBtn
{
    if (_goodListBtn == nil)
    {
        GoodListBtn *btn = [[GoodListBtn alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/15)];
        
        btn.tag = 110;
        
        [btn addTarget:self action:@selector(parameterBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [btn addTitle:@"产品参数"];
        
        [_scrollView addSubview:btn];
        
        _goodListBtn = btn;
        
        heightY +=btn.frame.size.height;
    }
    
    //产品参数详情
    [self CommodityParameters];
    
    return _goodListBtn;

}

#pragma mark-查看商品参数的响应事件
-(void)parameterBtnClick
{
    
     if (![_productDataDic[@"product_extfiled"][@"property"] isEqual:@""])
     {
         _parametersView.hidden = NO;
    
          screenView.hidden = NO;
    
         _bottomNavigationView.hidden = YES;
     }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"没有参数";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    
}

#pragma mark-产品参数详细页面
-(CommodityParameters *)CommodityParameters
{
    if (_parametersView == nil)
    {
        screenView = [[UIView alloc]initWithFrame:self.view.frame];
        
        screenView.hidden = YES;
        
        screenView.backgroundColor = [UIColor colorWithRed:73/255.0 green:83/255.0 blue:86/255.0 alpha:0.8];
        
        [self.view addSubview:screenView];
        
        CommodityParameters *parameters = [[CommodityParameters alloc]initWithFrame:CGRectMake(0, kHeight/2-44, kWidth, kHeight/2)];
        
        NSLog(@"%@",_productDataDic[@"product_extfiled"][@"property"]);
        
        if (![_productDataDic[@"product_extfiled"][@"property"] isEqual:@""])
        {
            [parameters addCommodityParameters:_productDataDic[@"product_extfiled"][@"property"]];
        }
  
        parameters.hidden = YES;
        
        [screenView addSubview:parameters];
        
        _parametersView = parameters;
    }
    
    //关闭按钮
    [self Close];
    
    return _parametersView;
}

#pragma mark-关闭按钮
-(UIButton *)Close
{
    if (_close == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, _parametersView.frame.size.height*8.5/10, _parametersView.frame.size.width, _parametersView.frame.size.height*1.5/10)];
        
        btn.backgroundColor = [UIColor lightGrayColor];
        
        [btn setTitle:@"关闭" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(btnClcik) forControlEvents:UIControlEventTouchUpInside];
        
        [_parametersView addSubview:btn];
        
        _close = btn;
    }
    return _close;
}


#pragma mark-关闭按钮的响应方法
-(void)btnClcik
{
    _parametersView.hidden = YES;
    
    screenView.hidden = YES;
    
    _bottomNavigationView.hidden = NO;
}



#pragma mark-添加选择产品规格
-(GoodListBtn *)GoodListColor
{
    if (_goodListBtnColor == nil)
    {
        GoodListBtn *btn = [[GoodListBtn alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/15)];
        
        btn.tag = 111;
        
        [btn addTitle:@"请选择颜色分类/尺寸"];
        
        [btn addTarget:self action:@selector(GoodListColorClick) forControlEvents:UIControlEventTouchUpInside];
    
        [_scrollView addSubview:btn];
        
        _goodListBtnColor = btn;
        
        heightY +=btn.frame.size.height +5;
    }
    
    //选择产品规格
    [self SelectionSpecifications];
    
    return _goodListBtnColor;
    
}

#pragma mark-显示产品规格
-(void)GoodListColorClick
{
    
    if ([_productDataDic[@"product_extfiled"][@"matel"]count])
    {
        _specifications.hidden = NO;
        
        screenView.hidden = NO;
        
        _bottomNavigationView.hidden = YES;
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"没有规格可选";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    
}

#pragma mark-选择产品规格
-(SelectionSpecifications *)SelectionSpecifications
{
    if (_specifications == nil)
    {
        SelectionSpecifications *selection = [[SelectionSpecifications alloc]initWithFrame:CGRectMake(0, kHeight/4, kWidth, kHeight*3/4-44)];
        
        selection.hidden = YES;
        
        if ([_productDataDic[@"product_extfiled"][@"matel"]count])
        {
           [selection addSpecification:_productDataDic Controller:self];
        }
        
        [self.view addSubview:selection];
        
        _specifications = selection;
    }
    
    //添加关闭按钮
    [self SelectClose];
    
    return _specifications;
}

#pragma mark-添加关闭按钮
-(UIButton *)SelectClose
{
    if (_selectClose == nil)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_specifications.frame.size.width*9/10, 0, _specifications.frame.size.width/10, _specifications.frame.size.width/10)];
        
        [button setTitle:@"X" forState:UIControlStateNormal];
        
        [button setTitle:@"" forState:UIControlStateHighlighted];
        
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(selectBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_specifications addSubview:button];
        
        _selectClose = button;
    }
    return _selectClose;
}

#pragma mark-关闭按钮的响应方法
-(void)selectBtnClick
{
    _specifications.hidden = YES;
    
    screenView.hidden = YES;
    
    _bottomNavigationView.hidden = NO;
}

#pragma mark-商品评价
-(GoodsEvaluate *)GoodsEvaluate
{
    if (_goodsEvaluate == nil)
    {
        
        if ([_productDataDic[@"product_reviews"]count])
        {
            GoodsEvaluate *goods = [[GoodsEvaluate alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/4)];
            
            goods.backgroundColor = kBgColor;
            
            NSLog(@"%@",_productDataDic[@"product_reviews"]);
            
            if ([_productDataDic[@"product_reviews"]count])
            {
                [goods addWithContent:nil Number:_productDataDic[@"review_count"]];
            }
            else
            {
                [goods addWithContent:_productDataDic[@"product_reviews"]Number:_productDataDic[@"review_count"]];
            }
            
            [goods addWithContent:_productDataDic[@"product_reviews"]Number:_productDataDic[@"review_count"]];
            
            [_scrollView addSubview:goods];
            
            _goodsEvaluate = goods;
            
            heightY += _goodsEvaluate.frame.size.height + 5;
        }
        else
        {
             UILabel *goods = [[UILabel alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/15)];
            
            goods.backgroundColor = kBgColor;
            
            goods.text = @"暂无商品评价";
            
            goods.font = [UIFont systemFontOfSize:14];
            
            [_scrollView addSubview:goods];
            
            heightY += goods.frame.size.height + 5;
        }

    }
    
    
    //查看全部按钮
    [self ViewAllEvaluate];
    
    return _goodsEvaluate;
}

#pragma mark-查看全部评价按钮
-(UIButton *)ViewAllEvaluate
{
    if (_viewAllEvaluate == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, _goodsEvaluate.frame.size.height*3/4+5, _goodsEvaluate.frame.size.width-200, _goodsEvaluate.frame.size.height/6)];
        
        btn.backgroundColor = [UIColor grayColor];
        
        [btn setTitle:@"查看全部评价" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(viewAllEvaluateClcik) forControlEvents:UIControlEventTouchUpInside];
        
        btn.titleLabel.font = kLabelFont;
        
        [_goodsEvaluate addSubview:btn];
    }
    return _viewAllEvaluate;
}

#pragma mark-查看全部商品评价
-(void)viewAllEvaluateClcik
{
    _evaluationListTableView.hidden = NO;
}

#pragma mark-店铺展示
-(ShopProfile *)ShopProfile
{
    if (_shopProfile == nil)
    {
        ShopProfile *shop = [[ShopProfile alloc]initWithFrame:CGRectMake(0, heightY, kWidth, kHeight/5)];
        
        [shop AddShopProfile:_productDataDic[@"shop_info"] NavController:self.navigationController];
        
        [_scrollView addSubview:shop];
        
        _shopProfile = shop;
    }
    
    heightY +=_shopProfile.frame.size.height;
    
    return _shopProfile;
}

#pragma mark-继续拖动--UIWebView
-(UIWebView *)WebView
{
    if (_webView == nil)
    {
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,kHeight-50-44, kWidth, kHeight-50-44)];
        
        webView.dataDetectorTypes = UIDataDetectorTypeAll;
        
        [webView loadHTMLString:_detailDataString baseURL:nil];
        
        [_bottomScrollView addSubview:webView];
        
        _webView = webView;
    }
    return _webView;
}

#pragma mark-评价列表(UITableView)
-(UITableView *)EvaluationListTableView
{
    if (_evaluationListTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kWidth, kHeight-50-44)];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView.hidden = YES;
        
        [self.view addSubview:tableView];
        
        _evaluationListTableView = tableView;
    }
    return _evaluationListTableView;
}

#pragma mark-UITableView datasource 和 delegate 方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([_evaluateDataArr[0][@"content"][@"response"][@"review_count"]isEqual:@"0"])
    {
        
        return 1;
    }
    else
    {
        return (int)_evaluateDataArr[0][@"content"][@"response"][@"review_count"];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    EvaluationListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[EvaluationListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if ([_evaluateDataArr[0][@"content"][@"response"][@"review_count"]isEqual:@"0"])
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kCellWidth, 100)];
        
        label.text = @"暂无评价";
        
        label.textColor = [UIColor lightGrayColor]
        ;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [cell addSubview:label];

    }
    else
    {
        
        cell.userName = _evaluateDataArr[0][@"content"][@"response"][@"product_reviews"][indexPath.row][@"user_name"];
        
        cell.content = _evaluateDataArr[0][@"content"][@"response"][@"product_reviews"][indexPath.row][@"review_content"];
        
        cell.time = _evaluateDataArr[0][@"content"][@"response"][@"product_reviews"][indexPath.row][@"review_date"];
        
        cell.userLogo = _evaluateDataArr[0][@"content"][@"response"][@"product_reviews"][indexPath.row][@"user_logo"];
        
    }
    
    
    
    return cell;

}

#pragma mark-底部结算栏(店铺收藏.商品收藏.加入购物车.立即购买)
-(void)BottomNavigation
{
    //底层View
    _bottomNavigationView = [[UIView alloc]initWithFrame:CGRectMake(0, kHeight-88, kWidth, 44)];
    _bottomNavigationView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_bottomNavigationView];
    //进入店铺
    [self EnterShop];
    
    //商品收藏
    [self CollectionGoods];
    
    //加入购物车
    [self ShoppingCart];
    
    //立即购买
    [self BuyImmediate];
}

#pragma mark-进入商店
-(UIButton *)EnterShop
{
    if(_enterShop == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kWidth/7, 44)];
        
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setTitle:@"店铺" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(EnterShopClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomNavigationView addSubview:btn];
        
        _enterShop = btn;
    }
    return _enterShop;
}

#pragma mark-进入店铺按钮的响应方法
-(void)EnterShopClick
{
    ShopDetailsController *shopDetails = [ShopDetailsController new];
    
    shopDetails.shopDetailsNavController = self.productDetailNavController;
    
    [self.productDetailNavController pushViewController:shopDetails animated:YES];
}

#pragma mark-收藏商品
-(UIButton *)CollectionGoods
{
    if(_collectionGoods == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/7, 0, kWidth/7, 44)];
        
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setTitle:@"收藏" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(CollectionGoodsCLick) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomNavigationView addSubview:btn];
        
        _collectionGoods = btn;
    }
    return _collectionGoods;
}
#pragma mark-加入收藏(发送商品收藏的请求)
-(void)CollectionGoodsCLick
{
    
    _uesrId = global.userId;
    
    NSLog(@"%@",_uesrId);
    
    if (_uesrId.length != 0)
    {
        _whetherCollectionArr = [NSArray requestWithPath:@"my_data_add.php" params:@{@"content":@{@"request":@{@"want":@"collectproductadd",@"uid":_uesrId,@"pid":_StringId}}} method:@"POST"];
    
        
        if (_whetherCollectionArr[0][@"content"][@"response"])
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"收藏成功";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
        else if ([_whetherCollectionArr[0][@"faultCode"]isEqualToString:@"1"])
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"已经收藏过了";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];

        }
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
}


#pragma mark-加入购物车
-(UIButton *)ShoppingCart
{
    if(_shoppingCart == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*2/7, 0, kWidth*5/14, 44)];
        
        btn.backgroundColor = [UIColor orangeColor];
        
        [btn setTitle:@"加入购物车" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(ShoppingCartClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomNavigationView addSubview:btn];
        
        _shoppingCart = btn;
    }
    return _shoppingCart;
}

#pragma mark-加入购物车(发送请求,商品加入购物车)
-(void)ShoppingCartClick
{
    
    if (global.userId != nil)
    {
 
        _goodNumber =_specifications.goodsNumber.text;
        
        _productId = _specifications.productId;
        
        _specId = _specifications.specId;
        
 
        if (_goodNumber.length)
        {
            
            if (_productId != nil && _specId != nil)
            {
                _getCartDataArr = [NSArray requestWithPath:@"cart.php" params:@{@"content":@{@"request":@{@"type":@"add_cart",@"uid":global.userId,@"nums":_goodNumber,@"pid":_productId,@"sid":_specId}}} method:@"POST"];
                
                if ([_getCartDataArr[0][@"content"][@"response"]length])
                {
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    
                    hud.mode = MBProgressHUDModeText;
                    
                    hud.labelText = @"已加入购物车";
                    
                    hud.margin = 10.f;
                    
                    hud.removeFromSuperViewOnHide = YES;
                    
                    [hud hide:YES afterDelay:2];

                }
                else
                {
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    
                    hud.mode = MBProgressHUDModeText;
                    
                    hud.labelText = @"加入购物车失败";
                    
                    hud.margin = 10.f;
                    
                    hud.removeFromSuperViewOnHide = YES;
                    
                    [hud hide:YES afterDelay:2];
                }
                
            }
            else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                hud.mode = MBProgressHUDModeText;
                
                hud.labelText = @"请选择商品属性";
                
                hud.margin = 10.f;
                
                hud.removeFromSuperViewOnHide = YES;
                
                [hud hide:YES afterDelay:2];
            }
            
            
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"数量不能为空";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
        
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
    

}

#pragma mark-立即购买
-(UIButton *)BuyImmediate
{
    if(_buyImmediate == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*9/14, 0, kWidth*5/14, 44)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"立即购买" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(BuyImmediateClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomNavigationView addSubview:btn];
        
        _buyImmediate = btn;
    }
    return _buyImmediate;
}

#pragma mark-立即购买按钮的响应方法
-(void)BuyImmediateClick
{
    
    
    if (global.userId != nil)
    {
        _goodNumber =_specifications.goodsNumber.text;  //产品数量
        
        _productId = _specifications.productId;  //产品ID
        
        _specId = _specifications.specId; //规格ID
        
        _specText = _specifications.selectInformation.text;//产品规格
    
        NSLog(@"%@",_productDataDic);
        
        _goodSumPrice = [_goodNumber intValue] * [_productDataDic[@"price"]intValue];
        
        NSString *sumPrice = [NSString stringWithFormat:@"%d",_goodSumPrice];
        
        
        _sendOrderDetailArr = @[
                                @[
                                 @{
                                     @"companyLogo":_productDataDic[@"shop_info"][@"logo"],
                                     
                                     @"companyName":_productDataDic[@"shop_info"][@"company"],
                                     
                                     @"goodTitle":_productDataDic[@"name"],
                                     
                                     @"goodImage":_productDataDic[@"pic"],
                                     
                                     @"goodPrice":_productDataDic[@"price"],
                                     
                                     @"goodConfig":_specText,
                                     
                                     @"goodNumber":_goodNumber,
                                     
                                     @"goodSumPrice":sumPrice
                                }
                            ]
                        ];
        
        if (_goodNumber.length)
        {
            if (_productId != nil && _specId != nil)
            {
                OrderDetailsController *order = [OrderDetailsController new];
                
                order.orderNavController = self.productDetailNavController;
                
                order.orderDetailArr = _sendOrderDetailArr;
                
                [self.productDetailNavController pushViewController:order animated:YES];
            }
            else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                hud.mode = MBProgressHUDModeText;
                
                hud.labelText = @"请选择商品属性";
                
                hud.margin = 10.f;
                
                hud.removeFromSuperViewOnHide = YES;
                
                [hud hide:YES afterDelay:2];
            }
            
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"数量不能为空";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
        
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
