//
//  GlobalInformation.m
//  RongYiGou
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GlobalInformation.h"

@implementation GlobalInformation

+(id)shareManager
{
    static GlobalInformation *global = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
    
        global = [[self alloc]init];
    
    });
    return global;
}

@end
