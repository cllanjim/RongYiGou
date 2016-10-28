//
//  ProvinceSelectModel.m
//  RongYiGou
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ProvinceSelectModel.h"

@implementation ProvinceSelectModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.provinceId = dict[@"id"];
        
        self.provinceName = dict[@"name"];
        
        self.provincePid = dict[@"pid"];
    }
    return self;
}

@end
