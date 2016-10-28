//
//  CommodityParameters.h
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailsController.h"

@interface CommodityParameters : UIView
{
    ProductDetailsController *product;
}

@property (nonatomic,strong)UILabel *title;

@property (nonatomic,strong)UITableView *content;

@property (nonatomic,strong)NSArray *commodDataArr;

-(void)addCommodityParameters:(NSArray *)information;

@end
