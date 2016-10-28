//
//  CountySelectModel.m
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CountySelectModel.h"

@implementation CountySelectModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.countyId = dict[@"id"];
        
        self.countyName = dict[@"name"];
        
        self.countyPid = dict[@"pid"];
    }
    return self;
}


@end
