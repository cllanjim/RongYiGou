//
//  MainViewController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "ClassController.h"
#import "PersonController.h"
#import "ShippingCartController.h"
#import "Dock.h"
#import "WBNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //初始化所有的子控制器
    [self addAllChildController];
    
    //初始化DockItem
    [self addDockItem];
}

-(void)addAllChildController
{
    //首页
    HomeViewController *home = [[HomeViewController alloc]init];
    
    WBNavigationController *homeNav = [[WBNavigationController alloc]initWithRootViewController:home];
    
    [self addChildViewController:homeNav];
    
    
    //类别
    ClassController *Class = [[ClassController alloc]init];
    
    WBNavigationController *ClassNav = [[WBNavigationController alloc]initWithRootViewController:Class];
    
    [self addChildViewController:ClassNav];
    
    //购物车
    ShippingCartController *Ship = [[ShippingCartController alloc]init];
    
    WBNavigationController *ShipNav = [[WBNavigationController alloc]initWithRootViewController:Ship];
    
    [self addChildViewController:ShipNav];
    
    //个人中心
    PersonController *Person = [[PersonController alloc]init];
    
    WBNavigationController *PersonNav = [[WBNavigationController alloc]initWithRootViewController:Person];
    
    [self addChildViewController:PersonNav];
}

#pragma mark 添加Dock

-(void)addDockItem
{
    //设置Dock的背景图片
    _dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    
    //往Dock里面填充内容
    [_dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"首页"];
    
    [_dock addItemWithIcon:@"tabbar_message_center.png" selectedIcon:@"tabbar_message_center_selected.png" title:@"类别"];
    
    [_dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png" title:@"购物车"];
    
    [_dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover_selected.png" title:@"我的"];
    
   /*
    
    //往Dock里面填充内容
    [_dock addItemWithIcon:@"ico_sy_h.png" selectedIcon:@"ico_sy.png" title:@"首页"];
    
    [_dock addItemWithIcon:@"ico_fl.png" selectedIcon:@"ico_fl_h.png" title:@"类别"];
    
    [_dock addItemWithIcon:@"ico_gwc.png" selectedIcon:@"ico_gwc_h.png" title:@"购物车"];
    
    [_dock addItemWithIcon:@"ico_wo.png" selectedIcon:@"ico_wo_h.png" title:@"我的"];
    
    */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
