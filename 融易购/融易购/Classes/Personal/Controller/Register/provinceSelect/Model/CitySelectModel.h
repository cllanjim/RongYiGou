//
//  CitySelectModel.h
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitySelectModel : NSObject

@property (nonatomic,strong)NSString * cityId;

@property (nonatomic,strong)NSString *cityName;

@property (nonatomic,strong)NSString *cityPid;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
