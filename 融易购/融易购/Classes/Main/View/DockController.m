//
//  DockController.m
//  12.1 SinaWeibo
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DockController.h"


#define kDockHeight 44
@interface DockController ()<DockDelegate>

@end

@implementation DockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1 、添加Dock（View）
    [self addDock];
}

#pragma mark-添加Dock
-(void)addDock
{
    Dock *dock = [[Dock alloc]init];
    
    dock.frame = CGRectMake(0, self.view.frame.size.height-kDockHeight, self.view.frame.size.width, kDockHeight);
    
    dock.delegate = self;
    
    [self.view addSubview:dock];
    
    _dock = dock;
}


#pragma mark-dock的代理方法（接收传回的数据）
-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{
    if (to < 0 || to > self.childViewControllers.count)
    {
        return;
    }
    
    //0、移除旧控制器的view
    UIViewController *oldvc = self.childViewControllers[from];
    
    [oldvc.view removeFromSuperview];
    
    
    //1、取出即将显示的控制器
    UIViewController *newVc = self.childViewControllers[to];
    
    CGFloat width = self.view.frame.size.width;
    
    CGFloat height = self.view.frame.size.height - kDockHeight;
    
    newVc.view.frame = CGRectMake(0, 0, width, height);
    
    
    // 2、添加新的控制器的view到Mainconteroller上面
    [self.view addSubview:newVc.view];
    
    
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
