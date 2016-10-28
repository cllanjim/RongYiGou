//
//  AdInformationController.m
//  RongYiGou
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AdInformationController.h"

@interface AdInformationController ()
{
    NSURLRequest *request;
}
@end

@implementation AdInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *URL = [[NSURL alloc]initWithString:_adInformationString];
    
    request = [[NSURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //添加导航条
    [self AdInformationNavBar];
    
    //添加内容主题
    [self AdInformationWebView];

}

#pragma mark-添加导航条
-(NavigationBar *)AdInformationNavBar
{
    if (_adInformationNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"内容详情" NavigationController:_adInformationNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _adInformationNavBar = navBar;
    }
    return _adInformationNavBar;
}


#pragma mark-添加内容主题
-(UIWebView *)AdInformationWebView
{
    if (_adInformationWebView == nil)
    {
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)];
        
        [webView loadRequest:request];
        
        [self.view addSubview:webView];
        
        _adInformationWebView = webView;
    }
    return _adInformationWebView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
