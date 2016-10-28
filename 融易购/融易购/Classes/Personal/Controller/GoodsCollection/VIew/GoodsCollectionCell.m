//
//  GoodsCollectionCell.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsCollectionCell.h"

@implementation GoodsCollectionCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        //商品图片
        [self GoodsImageView];
        
        //商品标题
        [self GoodsLabel];
        
        //商品价格
        [self GoodsPrice];
        
        //勾选按钮
        [self SelectBtn];
        
        //销量
        [self GoodsVolume];
        
        //评论数
        [self GoodsCollectNumber];
    }
    return self;
}

#pragma mark-商品图片
-(UIImageView *)GoodsImageView
{
    if (_goodsImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/3)];
        
        imageView.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];
        
        imageView.image = [UIImage imageNamed:@"1.png"];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
    }
    return _goodsImageView;
}

#pragma mark -商品标题
-(UILabel *)GoodsLabel
{
    if (_goodsLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*2/3, self.frame.size.width, self.frame.size.height/6)];
        
        label.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];

        
        label.text = @"最新版的IPhone5Se";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _goodsLabel = label;
    }
    return _goodsLabel;
}

#pragma mark-商品价格
-(UILabel *)GoodsPrice
{
    if (_goodsPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*5/6, self.frame.size.width/2, self.frame.size.height/6)];
        
        label.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];

        
        label.text = @"¥2900";
        
        label.textColor = [UIColor redColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _goodsPrice = label;
    }
    return _goodsPrice;
}

#pragma mark-商品销量
-(UILabel *)GoodsVolume
{
    if (_goodsVolume == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height*5/6, self.frame.size.width/2, self.frame.size.height/12)];
        
        label.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];

        
        label.text = @"销量:10000";
        
        label.font = [UIFont systemFontOfSize:10];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _goodsVolume = label;
    }
    return _goodsVolume;
}

#pragma mark-商品收藏量
-(UILabel *)GoodsCollectNumber
{
    if (_goodsCollectNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height*11/12, self.frame.size.width/2, self.frame.size.height/12)];
        
        label.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];

        
        label.text = @"收藏:10000";
        
        label.font = [UIFont systemFontOfSize:10];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _goodsCollectNumber = label;
    }
    return _goodsCollectNumber;
}


#pragma mark -勾选按钮
-(UIButton *)SelectBtn
{
    if (_selectBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        [btn setImage:[UIImage imageNamed:@"复选框-未选中.png"] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        _selectBtn = btn;
    }
    return _selectBtn;
}

@end
