//
//  ModuleTool.h
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//


/********************************
 *
 *
 *    发送请求,解析数据
 *
 *
 *******************************/

#import <Foundation/Foundation.h>

@class ModuleData;

//ModuleData 装的都是ModuleData对象
typedef void(^ModuleDataSuccessBlock)(NSArray *moduleData);
typedef void(^ModuleDataFailureBlock)(NSError *error);

@interface ModuleTool : NSObject

+(void)moduleWithSuccess:(ModuleDataSuccessBlock)success Failure:(ModuleDataFailureBlock)failure;

@end
