//
//  ClassGoodsView.h
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassGoodsBtn;

@interface ClassGoodsView : UIView

@property (nonatomic,strong)UINavigationController *classViewNavController;

@property (nonatomic,strong) UIButton *mainTitle;

@property (nonatomic,strong) NSArray *btnInformation;

@property (nonatomic,strong) NSString *contentStr;

@property (nonatomic,strong)ClassGoodsBtn *classGoodsBtn;


-(void)addViewInformation:(NSArray *)array ContentStr:(NSString *)contentStr NavController:(UINavigationController *)navController;

@end
