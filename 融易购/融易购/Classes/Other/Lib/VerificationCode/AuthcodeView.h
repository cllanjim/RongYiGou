//
//  AuthcodeView.h
//  IOS 本地动态验证码生成
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AuthcodeView;

@protocol AuthcodeViewDelegate <NSObject>

-(void)authcodeView:(AuthcodeView *)authcodeView AuthCode:(NSString *)code;

@end


@interface AuthcodeView : UIView

@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

@property (nonatomic,weak)id<AuthcodeViewDelegate> delegate;

+(id)GetAuthCode :(CGRect)frame;

@end
