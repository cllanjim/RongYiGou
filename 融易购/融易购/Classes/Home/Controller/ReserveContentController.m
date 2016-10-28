//
//  ReserveContentController.m
//  RongYiGou
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ReserveContentController.h"

@interface ReserveContentController ()
{
    float YHeight;
}
@end

@implementation ReserveContentController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载数据
    [self ResGetData];
    
    //添加导航条
    [self ResContentNavBar];

    
    if (_resContentDic.count)
    {
        //订货会详情
        [self ResContent];
    }
    
}

#pragma mark-加载数据
-(void)ResGetData
{
    _resContentArr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"meeting_detail",@"id":_resId}}} method:@"POST"];
    
    NSLog(@"%@",_resContentArr);
    
    _resContentDic = _resContentArr[0][@"content"][@"response"][@"meeting_info"];
}

#pragma mark-添加导航条
-(NavigationBar *)ResContentNavBar
{
    if (_resContentNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"订货会详情" NavigationController:self.resContentNavController];
        
        [self.view addSubview:navBar];
    }
    
    YHeight +=100;
    
    return _resContentNavBar;
}

#pragma mark-订货会详情
-(void)ResContent
{
    //订货会的名称
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    nameLabel.font = [UIFont systemFontOfSize:20];
    
    nameLabel.text = _resContentDic[@"name"];
    
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:nameLabel];
    
    YHeight += 40;
    
    //上架开始时间
    NSString *str = [NSString deleteSpace:_resContentDic[@"start_shelve_time"]];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    timeLabel.text =[NSString stringWithFormat:@"上架开始时间:     %@",str];
    
    [self.view addSubview:timeLabel];
    
    YHeight += 40;
    
    //上架结束时间
    NSString *endStr = [NSString deleteSpace:_resContentDic[@"end_shelve_time"]];
    
    UILabel *endlabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    endlabel.text = [NSString stringWithFormat:@"上架结束时间:     %@",endStr];
    
    [self.view addSubview:endlabel];
    
    YHeight += 40;
    
    //开始时间
    NSString *StartTimeStr = [NSString deleteSpace:_resContentDic[@"start_time"]];
    
    UILabel *StartTimelabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    StartTimelabel.text = [NSString stringWithFormat:@"订货会开始时间:     %@",StartTimeStr];
    
    [self.view addSubview:StartTimelabel];
    
    YHeight += 40;
    
    //结束时间
    NSString *endTimeStr = [NSString deleteSpace:_resContentDic[@"end_time"]];
    
    UILabel *endTimelabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    endTimelabel.text = [NSString stringWithFormat:@"订货会结束时间:     %@",endTimeStr];
    
    [self.view addSubview:endTimelabel];
    
    YHeight += 40;
    
    
    //买家保证金
    UILabel *baoLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    baoLabel.text = [NSString stringWithFormat:@"买家保证金:     %@",_resContentDic[@"buy_bonn"]];
    
    [self.view addSubview:baoLabel];
    
    YHeight += 40;
    
    
    //买家违约金
    UILabel *weiLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth-60, 30)];
    
    weiLabel.text = [NSString stringWithFormat:@"买家违约金:     %@",_resContentDic[@"buy_agent"]];
    
    [self.view addSubview:weiLabel];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
