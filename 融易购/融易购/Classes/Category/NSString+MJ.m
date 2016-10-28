//
//  NSString+MJ.m
//  RongYiGou
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSString+MJ.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MJ)


#pragma mark-删除字符串中的空格
+(NSString *)deleteSpace:(NSString *)string
{
   NSString *strUrl = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return strUrl;
}

#pragma mark-删除字符串中的换行符
+(NSString *)deleteWrap:(NSString *)string
{
    NSString *strUrl = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return strUrl;
}

#pragma mark-MD5加密
+ (NSString *)md5HexDigest:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark-时间戳转时间
+(NSString *)timeConversion:(NSString *)string
{
    NSString *str=string;//时间戳
    
    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;
}

#pragma mark-base64解码
+(NSString *)Base64Decode:(NSString *)string
{
    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    
    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    return decodeStr;
}

@end
