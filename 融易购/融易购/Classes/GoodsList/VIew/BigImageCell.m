//
//  BigImageCell.m
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "BigImageCell.h"


#define kBigImageWidth self.frame.size.width

#define kBigImageHeight self.frame.size.height

@implementation BigImageCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        //商品图片
        [self IconImageView];
        
        //标题
        [self TitleLabel];
        
        //价格
        [self PriceLabel];
        
        //销售量
        [self NumberLabel];
        
        //更多按钮
        [self MoreBtn];
    }
    return self;
}

#pragma  mark-商品图片
-(UIImageView *)IconImageView
{
    if (_iconImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kBigImageWidth, kBigImageHeight*2/3)];
        
        imageView.backgroundColor = [UIColor whiteColor];
        
        imageView.image = [UIImage imageNamed:@"1.png"];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _iconImageView = imageView;
    }
    return _iconImageView;
    
}

#pragma mark-标题
-(UILabel *)TitleLabel
{
    if (_titleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kBigImageHeight*2/3, kBigImageWidth, kBigImageHeight/6)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"原封国行[分期免息]";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}

#pragma mark-价格
-(UILabel *)PriceLabel
{
    if (_priceLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kBigImageHeight*5/6, kBigImageWidth/3, kBigImageHeight/6)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"¥5000";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor redColor];
        
        [self addSubview:label];
        
        _priceLabel = label;
    }
    return _priceLabel;
}

#pragma mark-销售量
-(UILabel *)NumberLabel
{
    if (_numberLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kBigImageWidth/3, kBigImageHeight*5/6, kBigImageWidth/3, kBigImageHeight/6)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"销售1.0万";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:label];
        
        _numberLabel = label;
    }
    return _numberLabel;
}

#pragma mark-更多按钮

-(UIButton *)MoreBtn
{
    if (_moreBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kBigImageWidth*2/3, kBigImageHeight*5/6, kBigImageWidth/3, kBigImageHeight/6)];
        
        btn.backgroundColor = kBgColor;
        
        [self addSubview:btn];
        
        _moreBtn = btn;
    }
    return _moreBtn;
}

@end
