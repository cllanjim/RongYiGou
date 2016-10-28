//
//  NSString+MJ.h
//  RongYiGou
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJ)

+(NSString *)deleteSpace:(NSString *)string;

+(NSString *)deleteWrap:(NSString *)string;

+(NSString *)md5HexDigest:(NSString *)input;

+(NSString *)timeConversion: (NSString *)string;

+(NSString *)Base64Decode:(NSString *)string;

@end
