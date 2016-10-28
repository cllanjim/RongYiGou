//
//  CitySelectModel.m
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CitySelectModel.h"

@implementation CitySelectModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.cityId = dict[@"id"];
        
        self.cityName = dict[@"name"];
        
        self.cityPid = dict[@"pid"];
    }
    return self;
}


@end
