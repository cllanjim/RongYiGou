//
//  Dock.h
//  12.1 SinaWeibo
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 mac. All rights reserved.
//
//底部的工具条

#import <UIKit/UIKit.h>


@class Dock;
@protocol DockDelegate <NSObject>

//添加一个选项卡
@optional
-(void)dock: (Dock *)dock itemSelectedFrom:(int)from to:(int)to;

@end
@interface Dock : UIView

//添加一个选项卡
-(void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title;

//代理
@property (nonatomic,weak)id<DockDelegate>delegate;


@end
