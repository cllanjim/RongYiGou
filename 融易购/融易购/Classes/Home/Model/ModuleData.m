//
//  ModuleData.m
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ModuleData.h"

@implementation ModuleData
-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.elgQq = dict[@"elg_qq"];
        
        self.response = dict[@"response"];
    }
    return self;
}
@end
