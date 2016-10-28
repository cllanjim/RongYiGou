//
//  Dock.m
//  12.1 SinaWeibo
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"

@interface Dock()
{
    DockItem *_selectedItem;
}
@end

@implementation Dock

-(void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title
{
    //1 、创建Item
    DockItem *item = [[DockItem alloc]init];
    
    //文字
    [item setTitle:title forState:UIControlStateNormal];
    
    //图标
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    
    //选中图标
    [item setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    //监听item的点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    // 2、添加item
    [self addSubview:item];
    
    int count = (int)self.subviews.count;
    
    //默认选中第一个item
    if (count == 1)
    {
        [self itemClick:item];
    }
    
    
    //3、调整所有的item的frame
    CGFloat height = self.frame.size.height;   //高度
    
    CGFloat width = self.frame.size.width/count;   //宽度
    
    for (int i = 0; i < count; i ++)
    {
        DockItem *dockItem = self.subviews[i];
        
        dockItem.tag = i;
        
        dockItem.frame = CGRectMake(width *i, 0, width, height);
    }
 
}

#pragma mark-Dock点击事件的响应方法
-(void)itemClick: (DockItem *)item
{
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)])
    {
        //将选中的——selectedItem的tag值和item的tag值传回到控制器
        [_delegate dock:self itemSelectedFrom:(int)_selectedItem.tag to:(int)item.tag];
    }
    
    //取消选中当前选中的item
    _selectedItem.selected = NO;
    
    //选中点击的item
    item.selected = YES;
    
    //赋值
    _selectedItem = item;
    
    
}

@end
