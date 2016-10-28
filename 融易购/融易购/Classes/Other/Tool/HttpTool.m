//
//  HttpTool.m
//  新浪微博
//
//  Created by apple on 13-10-30.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
//#import "Weibocfg.h"



//http://test.senyig.com/appapi/mobileapi/index.php

//http://114.215.206.152/Information/     getHomeImages?index=0&limit=5


@implementation HttpTool
+ (void)requestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure method:(NSString *)method
{

    NSString *URL = [NSString stringWithFormat:@"%@%@",kBaseURL,path];
    
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString  *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",str);
    
//    // 拼接传进来的参数
//    if (params) {
//        [allParams setDictionary:params];
//    }
//
//    
//    NSLog(@"%@",allParams);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:URL parameters:str progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject == nil) return ;
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error == nil) return ;
        
        failure(error);
        
    }];
    
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    [self requestWithPath:path params:params success:success failure:failure method:@"POST"];
}

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    [self requestWithPath:path params:params success:success failure:failure method:@"GET"];
}
@end
