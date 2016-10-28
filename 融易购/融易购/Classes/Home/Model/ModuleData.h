//
//  ModuleData.h
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleData : NSObject

@property (nonatomic,strong)NSString *elgQq;

@property (nonatomic,strong)NSDictionary *response;

@property (nonatomic,strong)NSArray *advsList;  //首页广告列表

@property(nonatomic,strong)NSArray *productList;  //产品列表

@property(nonatomic,strong)NSArray *announcementlist; //公告列表

-(id)initWithDict:(NSDictionary *)dict;
@end
