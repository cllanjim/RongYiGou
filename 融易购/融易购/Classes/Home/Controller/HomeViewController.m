//
//  HomeViewController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import <QuartzCore/QuartzCore.h>
#import "Module.h"
#import "SearchViewController.h"
#import "CommissionController.h"
#import "ReserveController.h"
#import "ModuleTool.h"
#import "MJRefresh.h"
#import "AdContetnController.h"
#import "AdInformationController.h"
#import "NSArray+MJ.h"
#import "GlobalInformation.h"
#import "LoginInController.h"
#import "GoodListController.h"


#define kSearchHeight 30

@interface HomeViewController ()<SDCycleScrollViewDelegate>
{
    CGFloat heightY;
    
    NSArray *btnTextArray;
    
    int btnTextIndex;
    
    Module *_module;
    
    NSArray *ModuleNameArr;
    
    NSDictionary *dataDic;
    
    UITapGestureRecognizer *_adTextTap;
    
    NSMutableArray *imageArray;
    
    UILabel *_notworkLabel;
    
    UIView *_bottomView;
    
    UIImageView *_adImageView;
    
    GlobalInformation *global;
   
}

@property (nonatomic,strong)UIView *notworkView;

@property (nonatomic,strong)UIScrollView *scrollView;

@property (nonatomic,strong)UIImageView *LOGOImage;

@property (nonatomic,strong)UIButton *searchButton;

@property (nonatomic,strong)UIButton *searchBnt;

@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;

@property (nonatomic,strong)UIButton *prefectureBtn;

@property (nonatomic,strong)Module *module;

@property (nonatomic,strong)BBCyclingLabel *scrollUpLabel;

@property (nonatomic,strong)NSArray *receiveArray;

@property (nonatomic,strong)NSDictionary *receiveDic;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    global = [GlobalInformation shareManager];
    
    self.UserId = global.userId;
    
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0f green:236/255.0f blue:243/255.0f alpha:1];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    imageArray = [[NSMutableArray alloc]initWithCapacity:3];
    
    //1.加载数据
    [self LoadData];
 
    //2.设置页面属性
    [self bulidUI];
    
    //3.设置刷新控件
    [self MJRefresh];
    
}

#pragma mark-设置刷新控件
-(void)MJRefresh
{
    _scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self LoadData];
        
        [self bulidUI];
        
        [_scrollView.mj_header endRefreshing];
    }];
}


#pragma mark-加载数据

-(void)LoadData
{
    NSString *Str=@"index.php";

    _receiveArray = [NSArray requestWithPath:Str params:nil method:@"POST"];
    
    
    NSLog(@"%@",_receiveArray);
    
        _receiveDic = [[[_receiveArray objectAtIndex:0]objectForKey:@"content"] objectForKey:@"response"];
        
        
        //获取轮播图片
        for (int i = 0; i < [[_receiveDic objectForKey:@"advs_list"] count]; i ++)
        {
            [imageArray addObject:[[[_receiveDic objectForKey:@"advs_list"]objectAtIndex:i] objectForKey:@"picName"]];
        }
    
}

#pragma mark-创建UI
-(void)bulidUI
{
    
    //底层图片
    [self BottomView];
    //LOGO 图标
    [self LOGOImage];
    
    //搜索框
    [self SearchButton];
    
    //搜索按钮
    [self SearchBnt];
    
    //底层ScrollView
    [self ScrollView];

    if (_receiveArray == nil)
    {
        //加载网络未连接页面
        [self NotworkView];
        
        NSLog(@"11111网络未连接");
    }
    else
    {
        
        //轮播图
        [self ScrollViewImage];
        
        //广告栏
        
        btnTextArray = [NSArray arrayWithArray:[_receiveDic objectForKey:@"announcementlist"]];
        
        [self AdTextBnt];
        
        //广告栏点击手势
        [self AdTextTap];
        
        
        
        //佣金前置专区和订货会专区
        [self PrefectureButton];
        
        //商品分区展示
        /*
         需要传入的数据
         1.类别名称
         2.商品数据(数组的形式)
         */
        
//        ModuleNameArr = [[NSArray alloc]initWithObjects:@"手机通讯",@"手机配件",@"智能设备", nil];
        
        [self AddModule];
        
        _scrollView.contentSize = CGSizeMake(0, heightY+44+20+kSearchHeight);
    }
    
}

#pragma mark-网络数据未连接
-(UIView *)NotworkView
{
    if (_notworkView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        
        [_scrollView addSubview:view];
        
        _notworkView = view;
    }
    
    //文字说明
    [self NotworkLabel];
    
    return _notworkView;
}

#pragma mark-网络数据未连接展示文字
-(UILabel *)NotworkLabel
{
    if (_notworkLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _notworkView.frame.size.height/3, _notworkView.frame.size.width, 30)];
        
        label.text = @"网络连接失败,请检查网络设置后重新加载";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [_notworkView addSubview:label];
        
        _notworkLabel = label;
    }
    return _notworkLabel;
}


#pragma mark-底层滚动视图
-(UIScrollView *)ScrollView
{
    if (_scrollView == nil)
    {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,kSearchHeight+20, kWidth, kHeight)];
        
        scroll.backgroundColor = [UIColor whiteColor];
        
        scroll.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:scroll];
        
        _scrollView = scroll;
        
    }
    return _scrollView;
}

#pragma mark-导航条头部底层
-(UIView *)BottomView
{
    if (_bottomView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, kWidth, kSearchHeight)];
        
        view.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:view];
        
        _bottomView = view;
    }
    return _bottomView;
}

#pragma mark-LOGO图标
-(UIImageView *)LOGOImage
{
    if (_LOGOImage == nil)
    {
        UIImageView *LOGOImage = [[UIImageView alloc]initWithFrame:CGRectMake(3,0, kWidth/3-6,kSearchHeight)];
    
        LOGOImage.backgroundColor = [UIColor clearColor];
        
        LOGOImage.image = [UIImage imageNamed:@"logo.png"];
        
        LOGOImage.contentMode =UIViewContentModeScaleAspectFit;
    
        [_bottomView addSubview:LOGOImage];
        
        _LOGOImage = LOGOImage;
    }
    return _LOGOImage;
}

#pragma mark-搜索框
-(UIButton *)SearchButton
{
    if (_searchButton == nil)
    {
         UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3, 3, kWidth*7/12, kSearchHeight-6)];
        
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setTitle:@"搜索" forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.layer.cornerRadius = 10;
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
       [_bottomView addSubview:btn];
    
       _searchButton = btn;

    }
    return _searchButton;
}

#pragma mark-搜索按钮的响应方法(跳转到搜索页)
-(void)btnClick
{
    SearchViewController *Search = [[SearchViewController alloc]init];
    
    [self.navigationController pushViewController:Search animated:YES];
}


#pragma mark-搜索按钮

-(UIButton *)SearchBnt
{
    if (_searchBnt == nil)
    {
         UIButton *searchBnt = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*11/12,0, kWidth/12, kSearchHeight)];
        
        searchBnt.backgroundColor = [UIColor clearColor
                                     ];
    
        [searchBnt setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    
         [searchBnt addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        searchBnt.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [searchBnt addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
         [_bottomView addSubview:searchBnt];
        
        _searchBnt = searchBnt;

    }
    return _searchBnt;
}



#pragma mark-轮播视图

-(SDCycleScrollView *)ScrollViewImage
{
    if (_cycleScrollView == nil)
    {

        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHeight/4.25) imageURLStringsGroup:imageArray];
    
        cycleScrollView.delegate = self;
    
        cycleScrollView.infiniteLoop = YES;
    
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        
        cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
    
        cycleScrollView.autoScrollTimeInterval = 2;
    
       [_scrollView addSubview:cycleScrollView];
        
        _cycleScrollView = cycleScrollView;
        
        heightY += cycleScrollView.frame.size.height;
    }
    return _cycleScrollView;
}


#pragma mark-系统公告指示栏
-(UIImageView *)AdImageView
{
    if (_adImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, heightY, kWidth/4-20, 30)];
        
        imageView.image = [UIImage imageNamed:@"notice.png"];
        
        imageView.contentMode =UIViewContentModeScaleAspectFit;
        
        [_scrollView addSubview:imageView];
        
        _adImageView = imageView;
    }
    return _adImageView;
}

#pragma mark-广告栏

-(BBCyclingLabel *)AdTextBnt
{
    
     [self AdImageView];
    
    if (_scrollUpLabel == nil)
    {
        BBCyclingLabel *textLabel = [[BBCyclingLabel alloc]initWithFrame:CGRectMake(kWidth/4 + 10, heightY, kWidth*3/4-10, 30)];
        
        textLabel.text = [[btnTextArray objectAtIndex:0]objectForKey:@"title"];
        
        [_scrollView addSubview:textLabel];
        
        textLabel.backgroundColor = [UIColor whiteColor];
        
        textLabel.font = [UIFont systemFontOfSize:15];
        
        textLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1];
        
        textLabel.shadowColor = [UIColor colorWithWhite:1 alpha:0.75];
        
        textLabel.shadowOffset = CGSizeMake(0, 1);
        
        textLabel.numberOfLines = 1;
        
//      textLabel.textAlignment = NSTextAlignmentCenter;
        
        textLabel.transitionDuration = 0.75;
        
        textLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollUp;
        
        textLabel.clipsToBounds = YES;
        

        [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(btnText:) userInfo:nil repeats:YES];
        
        heightY +=textLabel.frame.size.height;
        
        _scrollUpLabel = textLabel;
     }
    return _scrollUpLabel;
}

#pragma mark-定时器的响应方法(执行动画)
-(void)btnText:(NSTimer *)time
{
    if (btnTextIndex == btnTextArray.count-1)
    {
        btnTextIndex = 0;
    }
    else
    {
        btnTextIndex ++;
    }
    
    [_scrollUpLabel setText:[[btnTextArray objectAtIndex:btnTextIndex] objectForKey:@"title"] animated:YES];
    
}

#pragma mark-广告栏点击手势

-(UITapGestureRecognizer *)AdTextTap
{
    if (_adTextTap == nil)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(AdTextTapClick)];
        
        [_scrollUpLabel addGestureRecognizer:tap];
        
        _adTextTap = tap;
    }
    return _adTextTap;
}

#pragma mark-广告手势的响应方法
-(void)AdTextTapClick
{
    self.UserId = global.userId;
    
    if (_UserId == nil)
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
    else
    {
        AdContetnController *ad = [AdContetnController new];
        
        ad.adContentNavController = self.navigationController;
        
        ad.adContentTitle =_receiveDic[@"announcementlist"][btnTextIndex][@"title"];
        
        ad.adContentId = _receiveDic[@"announcementlist"][btnTextIndex][@"id"];
        
        ad.adContentUserId = self.UserId;
        
        [self.navigationController pushViewController:ad animated:YES];
    }

}

#pragma mark-佣金前置专区和订货会专区

-(UIButton *)PrefectureButton
{
    if (_prefectureBtn == nil)
    {
        for (int i = 0; i < 2; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*(kWidth/2), heightY, kWidth/2, 80)];
            
            btn.tag = i + 1;
            
            if (btn.tag == 1)
            {
                btn.backgroundColor = [UIColor darkGrayColor];
                
                [btn setBackgroundImage:[UIImage imageNamed:@"yongjin.jpg"] forState:UIControlStateNormal];
        
//               [btn setTitle:@"佣金前置专区" forState:UIControlStateNormal];

            }
            else
            {
                 btn.backgroundColor = [UIColor lightGrayColor];
                
                 [btn setBackgroundImage:[UIImage imageNamed:@"dinghuohui.jpg"] forState:UIControlStateNormal];
        
//                [btn setTitle:@"订货会专区" forState:UIControlStateNormal];
            }
            
            [btn addTarget: self action:@selector(PrefectureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_scrollView addSubview:btn];
            
            _prefectureBtn = btn;
           
        }
        
        heightY += _prefectureBtn.frame.size.height;
    }
    
    return _prefectureBtn;
}

#pragma mark-添加商品分区

-(Module *)AddModule
{
    if (_module == nil)
    {
        for (int i = 0; i < 3; i ++)
        {
            Module *mod = [[Module alloc]initWithFrame:CGRectMake(0, heightY+5, kWidth, 150)];
            
            mod.backgroundColor = kBgColor;
        
            [mod addGoodContent:_receiveDic[@"cat_list"][i] Controller:self];
            
            [_scrollView addSubview:mod];
        
            _module = mod;
        
            heightY += mod.frame.size.height+5;

        }
        
    }
    return _module;
}

#pragma mark-专区的响应方法
-(void)PrefectureButtonClick: (UIButton *)sender
{

    if (sender.tag == 1)//佣金前置专区
    {
        if (global.userId != nil)
        {
//           _sendBackDataArr = [NSArray requestWithPath:@"product_list.php" params:@{@"content":@{@"request":@{@"filter":@{@"cat_id":_goodsListCatId,@"brand":_goodsListBrand}}}} method:@"POST"];
            
            GoodListController *commiss = [GoodListController new];
            
            [self.navigationController pushViewController:commiss animated:YES];
        }
        else
        {
            LoginInController *login = [LoginInController new];
            
            [self presentViewController:login animated:YES completion:nil];
        }
    }
    else if (sender.tag == 2)//订货会专区
    {
        
        if (global.userId != nil)
        {
            ReserveController *reserve = [ReserveController new];
            
            [self.navigationController pushViewController:reserve animated:YES];

        }
        else
        {
            LoginInController *login = [LoginInController new];
            
            [self presentViewController:login animated:YES completion:nil];
        }
        
    }
}

#pragma mark-轮播图图片的点击响应事件
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    AdInformationController *ad = [AdInformationController new];
    
    ad.adInformationNavController = self.navigationController;
    
    ad.adInformationString = _receiveDic[@"advs_list"][index][@"url"];
    
    [self.navigationController pushViewController:ad animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
