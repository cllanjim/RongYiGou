//
//  ModuleTool.m
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ModuleTool.h"
#import "HttpTool.h"
#import "ModuleData.h"

@implementation ModuleTool

+(void)moduleWithSuccess:(ModuleDataSuccessBlock)success Failure:(ModuleDataFailureBlock)failure
{
    [HttpTool postWithPath:@"index.php" params:nil success:^(id JSON) {
        
        if (success == nil) return;
        
        NSMutableArray *module = [NSMutableArray array];
        
        NSArray *array = [[JSON objectAtIndex:0]objectForKey:@"content"];
        
        for (NSDictionary *dic in array) {
           
            ModuleData *data = [[ModuleData alloc]initWithDict:dic];
            
            [module addObject:data];
        }
        
        success(module);
        
      
    } failure:^(NSError *error) {
        
        if (failure == nil) return;
        
        failure(error);
    }];
}

@end
