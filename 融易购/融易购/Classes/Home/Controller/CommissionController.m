//
//  CommissionController.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CommissionController.h"
#import "NavigationBar.h"



@interface CommissionController ()
{
    NavigationBar *_navigation;
}
@end

@implementation CommissionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    //添加自定义导航条
    
    [self Navigation];
    
    
    
    
}
-(NavigationBar *)Navigation
{
    if (_navigation == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        nav.backgroundColor =kBgColor;
        
        nav.animated = YES;
        
        [nav addNavigationBar:@"佣金前置商品" NavigationController:self.navigationController];
        
        [self.view addSubview:nav];
        
        _navigation = nav;
    }
    return _navigation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
