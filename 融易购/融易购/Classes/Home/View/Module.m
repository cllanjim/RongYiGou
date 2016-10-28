//
//  Module.m
//  RongYiGou
//
//  Created by mac on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Module.h"
#import "ModuleItem.h"
#include "GoodListController.h"
#import "Dock.h"


#define kEdgeWidth 10

#define kModuleWidth self.frame.size.width

#define kModuleHeight self.frame.size.height


@interface Module()
{
    UIButton *_moduleName;
    
    UIButton *_moduleMore;
    
    UIViewController *_controller;
    
    ModuleItem *item;
    
    UILabel *_moduleIcon;
}

@property (nonatomic,strong)NSString *moduleNameStr;

@property (nonatomic,strong)NSDictionary *moduleContentDic;

@property (nonatomic,strong)ModuleItem *moduleItem;

@end

@implementation Module

-(void)addGoodContent:(NSDictionary *)content Controller:(UIViewController *)controller
{
    
    _moduleContentDic = content;
    
    NSLog(@"%@",_moduleContentDic);
    
    _controller = controller;

    
    //创建Item
    [self ModuleItem];
    
    //模块小图标
    [self ModuleIcon];
    
    //模块名称
    [self ModuleBntName];
    
    //更多按钮
    [self ModuleBntMore];

    
    
    
}

#pragma mark-模块小图标
-(UILabel *)ModuleIcon
{
    if (_moduleIcon == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kEdgeWidth, kEdgeWidth/2, kEdgeWidth/2, kModuleHeight/8)];
        
        label.backgroundColor = [UIColor redColor];
        
        [self addSubview:label];
        
        _moduleIcon = label;
    }
    return _moduleIcon;
}


#pragma mark-模块名称
-(UIButton *)ModuleBntName
{
    if (_moduleName == nil)
    {
        UIButton *name = [[UIButton alloc]initWithFrame:CGRectMake(kEdgeWidth, kEdgeWidth/2,kModuleWidth/4, kModuleHeight/8)];
        
        [name setTitle:_moduleContentDic[@"name"] forState:UIControlStateNormal];
        
        [name setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        name.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:name];
        
        _moduleName = name;
        
    }
    return _moduleName;
}

#pragma mark-更多

-(UIButton *)ModuleBntMore
{
    if (_moduleMore == nil)
    {
        UIButton *bnt = [[UIButton alloc]init];
        
        [bnt setTitle:@"更多>>" forState:UIControlStateNormal];
        
        [bnt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        bnt.titleLabel.font = [UIFont systemFontOfSize:15];
        
        bnt.frame = CGRectMake(kModuleWidth*4/5-kEdgeWidth, kEdgeWidth/2, kModuleWidth/5, kModuleHeight/8);
        
        [bnt addTarget:self action:@selector(bntClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bnt];
        
        _moduleMore = bnt;
    }
    return _moduleMore;
}

#pragma mark-更多按钮的响应方法
-(void)bntClick
{
    GoodListController *goodList = [GoodListController new];
    
    goodList.moduleGoodsListSearchTitle = _moduleName.currentTitle;
    
    goodList.moduleGoodsListArr = _moduleContentDic[@"pro_list"];
    
    [_controller.navigationController pushViewController:goodList animated:YES];
}


#pragma mark-创建Item

-(ModuleItem *)ModuleItem
{
    if (_moduleItem == nil)
    {
        CGFloat itemWidth = (kModuleWidth-kEdgeWidth*4)/3;
        
        CGFloat itemHeight = kModuleHeight*7/8-kEdgeWidth*2;
        
        NSLog(@"%f%f",kModuleHeight,itemHeight);
        
        for (int i = 0; i < 3; i ++)
        {
            item = [[ModuleItem alloc]initWithFrame:CGRectMake(kEdgeWidth+i * itemWidth+(i *kEdgeWidth),kModuleHeight/8+kEdgeWidth, itemWidth, itemHeight)];
            
            item.tag = i + 10;
            
             item.backgroundColor = [UIColor whiteColor];
            
            [item addData:_moduleContentDic[@"pro_list"][i] Controller:_controller];
            
             [self addSubview:item];
            
             _moduleItem = item;
        }
    }
    return _moduleItem;
}


@end
