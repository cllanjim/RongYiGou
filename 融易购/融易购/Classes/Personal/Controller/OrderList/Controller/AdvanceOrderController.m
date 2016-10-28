//
//  AdvanceOrderController.m
//  RongYiGou
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AdvanceOrderController.h"
#import "XLScrollViewer.h"


@interface AdvanceOrderController ()

@end

@implementation AdvanceOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _advanceTableViewArr = @[[TableView1 new],[TableView1 new],[TableView1 new],[TableView1 new]];
    
    _advanceOrderArr = [[NSArray alloc]initWithObjects:@"全部",@"待付款",@"已预订",@"已还款", nil];
    
    //添加导航条
    [self AdvanceNavBar];
    
    
    //添加订单导航按钮
    [self AdvaceOrderScrollView];
}

#pragma mark-添加导航条
-(NavigationBar *)AdvanceNavBar
{
    if (_advanceNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"预付订单" NavigationController:_advanceOrderNavController];
        
        [self.view addSubview:navBar];
        
        _advanceNavBar = navBar;
    }
    return _advanceNavBar;
}

#pragma mark-滚动导航条
-(XLScrollViewer *)AdvaceOrderScrollView
{
    if (_advaceOrderScrollView == nil)
    {
        XLScrollViewer *scrollView = [XLScrollViewer scrollWithFrame:CGRectMake(0, 69, kWidth, kHeight-69) withViews:_advanceTableViewArr withButtonNames:_advanceOrderArr withThreeAnimation:211];
        
        scrollView.xl_topBackColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        scrollView.xl_isMoveSlider = YES;
        
        scrollView.xl_sliderHeight = 8 ;
        
        scrollView.xl_sliderColor = [UIColor redColor];
        
        scrollView.xl_buttonColorNormal = [UIColor blackColor];
        
        scrollView.xl_buttonColorSelected = [UIColor redColor];
        
        scrollView.xl_buttonFont = 15;
        
        // self.scroll.xl_buttonToSlider = 30;
        
        // self.scroll.xl_sliderHeight =30;
        
        scrollView.xl_topHeight =40;
        
        // self.scroll.xl_isSliderCorner =YES;
        
        scrollView.xl_buttonToSlider = 3;
        
        //        scrollView.xl_topBackImage = [UIImage imageNamed:@"1.png"];
        
        [self.view addSubview:scrollView];
    }
    return _advaceOrderScrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
