//
//  AdContetnController.m
//  RongYiGou
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AdContetnController.h"
#import "LoginInController.h"
#import "NSString+MJ.h"

@interface AdContetnController ()

@end

@implementation AdContetnController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    //发送网络请求获取数据
    [self GetDate];
    
    //添加导航条
    [self AdContentNavBar];
    
    //内容
    [self WebView];
    
}

#pragma mark-发送网络请求获取数据
-(void)GetDate
{
    GlobalInformation *global = [GlobalInformation shareManager];
    
    _adContentUserId = global.userId;
    
    NSLog(@"%@",_adContentUserId);
    
    _adContentArray = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"announcement",@"uid":_adContentUserId,@"aid":_adContentId}}} method:@"POST"];
    
    NSLog(@"%@",_adContentArray);
 
}

#pragma mark-添加导航条
-(NavigationBar *)AdContentNavBar
{
    if (_adContentNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:_adContentTitle NavigationController:_adContentNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _adContentNavBar = navBar;
    }
    return _adContentNavBar;
}

#pragma mark-内容
-(UIWebView *)WebView
{
    if (_webView == nil)
    {
        
        NSLog(@"%@",_adContentArray[0][@"content"][@"response"][@"announcement"][0][@"content"]);
        
        NSString *content = [NSString Base64Decode:_adContentArray[0][@"content"][@"response"][@"announcement"][0][@"content"]];
        
        
        
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
        
        [webView loadHTMLString:content baseURL:nil];
        
        [self.view addSubview:webView];
        
        _webView = webView;
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
