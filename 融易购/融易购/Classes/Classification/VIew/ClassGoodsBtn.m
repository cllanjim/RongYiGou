//
//  ClassGoodsBtn.m
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ClassGoodsBtn.h"
#import "GoodListController.h"

// 文字的高度比例
#define kTitleRatio 0.3

@implementation ClassGoodsBtn

-(void)addInformation:(NSDictionary *)titleDic ContentStr:(NSString *)contentStr NavController:(UINavigationController *)navController
{
    _classBtnNavController = navController;
    
    _contentStrId = contentStr;
    
    _contentBrandDic = titleDic;
    
   
    //添加内部imageView
    [self ClassGoodsImageView];
    
    //内部标题
    [self ClassGoodsLabel];

    
    [self addTarget:self action:@selector(ClassGoodsBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(UIImageView *)ClassGoodsImageView
{
    if (_classGoodsImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height *0.7)];

        [imageView sd_setImageWithURL:_contentBrandDic[@"logo"]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
    }
    return _classGoodsImageView;
}

-(UILabel *)ClassGoodsLabel
{
    if (_classGoodsLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,  self.frame.size.height*0.7,  self.frame.size.width,  self.frame.size.height*0.3)];
        
        label.text = _contentBrandDic[@"name"];
        
        label.font = [UIFont systemFontOfSize:6];
        
        label.numberOfLines = 0;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
    }
    return _classGoodsLabel;
    
}
#pragma mark-按钮的响应方法(跳转到搜索页面)
-(void)ClassGoodsBtnClcik: (UIButton *)sender
{
    GoodListController *goodList = [GoodListController new];
    
    goodList.goodsListCatId = _contentStrId;
    
    goodList.goodsListBrand =_contentBrandDic[@"name"];
    
    [_classBtnNavController pushViewController:goodList animated:YES];
}

@end
