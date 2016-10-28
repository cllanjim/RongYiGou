//
//  WBNavigationController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "WBNavigationController.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //appearance 方法返回一个导航栏的外观对象
    //修改了这个外观对象，相当于修改了整个项目的外观
    
    UINavigationBar * bar = [UINavigationBar appearance];
    
    //设置导航栏的背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏文字的主题
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]}];
    
    //修改所有UIBarButtonItem的外观
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    //修改Item的背景图片
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    //修改item上面的文字样式
    
//    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor darkGrayColor],UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]};
    
    
//    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
//    
//    [barItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    
    
    //设置状态栏的样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

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
