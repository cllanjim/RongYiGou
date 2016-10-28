//
//  ReserveController.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ReserveController.h"
#import "NavigationBar.h"
#import "SDCycleScrollView.h"
#import "ReserveContentController.h"

@interface ReserveController ()<SDCycleScrollViewDelegate>
{
    NavigationBar *_navigation;
    
    SDCycleScrollView *_orderScrollView;
    
    UIScrollView *_goodsShowScrollView;
    
    UIButton * _goodsShowBtn;
    
    NSMutableArray *iconImageArr;
    
    NSMutableArray *titleArr;
    
}

@end

@implementation ReserveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    iconImageArr = [NSMutableArray arrayWithCapacity:5];
    
    titleArr = [NSMutableArray arrayWithCapacity:5];
    
    //获取数据
    [self GetDataArr];
    
    //添加导航条
     [self Navigation];
    
    //添加滚动视图
    [self ScrollViewImage];
    
    [self GoodsShowScrollView];
    
}

#pragma mark-获取数据
-(void)GetDataArr
{
    _reserveGetDataArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"meeting"}}} method:@"POST"];
    
    _reserveGetDataArr = _reserveGetDataArr[0][@"content"][@"response"][@"meeting_list"];
    
    _reserveGoodGetDataArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"meeting_detail",@"id":_reserveGetDataArr[1][@"id"]}}} method:@"POST"];
    
    NSLog(@"%@",_reserveGetDataArr);
}


#pragma mark-添加导航条
-(NavigationBar *)Navigation
{
    if (_navigation == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        nav.backgroundColor =kBgColor;
        
        [nav addNavigationBar:@"订货会专区" NavigationController:self.navigationController];
        
        [self.view addSubview:nav];
        
        _navigation = nav;
    }
    return _navigation;
}

#pragma mark-添加滚动视图
-(SDCycleScrollView *)ScrollViewImage
{
    if (_orderScrollView == nil)
    {
    
        for (NSDictionary *dict in _reserveGetDataArr)
        {
            [iconImageArr addObject:dict[@"img"]];
            
            [titleArr addObject:dict[@"name"]];
        }
            
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 69, kWidth, kHeight/2) delegate:self placeholderImage:[UIImage imageNamed:@"1.png"]];
        
        cycleScrollView.autoScroll = NO;
        
        cycleScrollView.infiniteLoop = NO;
        
        cycleScrollView.imageURLStringsGroup = iconImageArr;
        
        cycleScrollView.titlesGroup = titleArr;
        
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        
        cycleScrollView.delegate = self;
        
        [self.view addSubview:cycleScrollView];
        
        _orderScrollView = cycleScrollView;

    }
    return _orderScrollView;
}

#pragma mark-滑动图片相应的方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    [_goodsShowBtn removeFromSuperview];
    
    [self GoodsShowBtn:_reserveGetDataArr[index]];
}

#pragma mark-点击图片相应的方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    ReserveContentController * content = [ReserveContentController new];
    
    content.resContentNavController = self.navigationController;
    
    content.resId = _reserveGetDataArr[index][@"id"];
    
    [self.navigationController pushViewController:content animated:YES];
}

#pragma mark-商品展示区
-(UIScrollView *)GoodsShowScrollView
{
    if (_goodsShowScrollView == nil)
    {
        UIScrollView *ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69 +kHeight/2, kWidth, kHeight/5)];
        
        ScrollView.backgroundColor = kBgColor;
        
        [self.view addSubview:ScrollView];
        
         _goodsShowScrollView = ScrollView;
    }
    
    //添加商品展示按钮
    [self GoodsShowBtn:_reserveGetDataArr[0]];
    
    return _goodsShowScrollView;
}

#pragma mark-商品展示按钮
-(void)GoodsShowBtn : (NSDictionary *)dic
{
    if (dic[@"pro"])
    {
        for (int i = 0; i < [dic[@"pro"]count] && i < 4; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5 + i *(_goodsShowScrollView.frame.size.width-5)/4, 10, (_goodsShowScrollView.frame.size.width-5*5)/4, _goodsShowScrollView.frame.size.height-20)];
            
            [btn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:_reserveGetDataArr[i][@"pro"][@"pic"]]] forState:UIControlStateNormal];
            
            btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
            
            btn.backgroundColor = [UIColor lightGrayColor];
            
            [_goodsShowScrollView addSubview:btn];
            
            _goodsShowBtn = btn;
        }
    }
    else
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _goodsShowScrollView.frame.size.width, _goodsShowScrollView.frame.size.height)];
        
        label.textColor = [UIColor whiteColor];
        
        label.text = @"暂无商品";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [_goodsShowScrollView addSubview:label];
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
