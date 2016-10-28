//
//  ProvinceSelectModel.h
//  RongYiGou
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceSelectModel : NSObject

@property (nonatomic,strong)NSString * provinceId;

@property (nonatomic,strong)NSString *provinceName;

@property (nonatomic,strong)NSString *provincePid;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
