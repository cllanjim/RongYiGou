//
//  NSArray+MJ.m
//  RongYiGou
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSArray+MJ.h"
#import "NSString+MJ.h"

@implementation NSArray (MJ)

+(NSArray *)requestWithPath:(NSString *)path params:(NSDictionary *)params method:(NSString *)method
{
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",kBaseURL,path];
    
    NSString *paramsStr;
    
    NSData *paramsData;
    
    NSLog(@"%@",params);
    
    if (params)
    {
        paramsData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
        
        paramsStr = [[NSString alloc]initWithData:paramsData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",paramsStr);
    
    }

    NSURL *url=[NSURL URLWithString:URLStr];
    
    //  2.创建请求对象
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:method];
    
    [request setHTTPBody:[paramsStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    //    3.发送请求
    //发送同步请求，在主线程执行
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
    
    
    NSJSONSerialization *json;
    
    if (data != nil)
    {
        //数据解析
       json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
    }
    
    NSLog(@"%@",json);

    return (NSArray *)json;


}




@end
