//
//  CountySelectModel.h
//  RongYiGou
//
//  Created by mac on 16/3/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountySelectModel : NSObject

@property (nonatomic,strong)NSString * countyId;

@property (nonatomic,strong)NSString *countyName;

@property (nonatomic,strong)NSString *countyPid;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
