//
//  GlobalInformation.h
//  RongYiGou
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalInformation : NSObject

@property(nonatomic,assign)BOOL whetherLogin;

@property(nonatomic,strong)NSString *userId;

@property (nonatomic,strong)NSString *AccountName;

@property (nonatomic,strong)NSString *AccountPassWord;


+(id)shareManager;

@end
