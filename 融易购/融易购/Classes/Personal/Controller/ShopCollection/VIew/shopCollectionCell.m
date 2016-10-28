//
//  shopCollectionCell.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "shopCollectionCell.h"
#import "ShopGoodsBtn.h"

#define kShopHeight 150

@implementation shopCollectionCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
    
        //店铺LOGO
        [self ShopImageView];
        
        //店铺名字
        [self ShopTitleName];
        
        //店铺地址(省市区)
        [self ShopAddress];
        
        //被收藏的数量
        [self ShopGoodsNumber];
        
        //店铺商品
        [self ShopGoodsBtn];
        
    }
    return self;
}

#pragma mark-店铺LOGO
-(UIImageView *)ShopImageView
{
    if (_shopImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, kCellWidth/5-5, kShopHeight/3-5)];
        
        imageView.image = [UIImage imageNamed:@"1.png"];
        
        imageView.backgroundColor = [UIColor greenColor];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _shopImageView = imageView;
    }
    return _shopImageView;
}

#pragma mark-店铺名称
-(UILabel *)ShopTitleName
{
    if (_shopTitleName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/5, 5, kCellWidth*4/5-5, kShopHeight/6-5)];
        
        label.text = @"福建易乐购网络科技有限公司";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _shopTitleName = label;
    }
    return _shopTitleName;
}

#pragma mark-店铺地址
-(UILabel *)ShopAddress
{
    if (_shopAddress == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/5, kShopHeight/6, (kCellWidth*4/5)/2-5, kShopHeight/6-5)];
        
        label.text = @"福建省福州市台江区";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _shopAddress = label;
    }
    return _shopAddress;
}


#pragma mark-被收藏的数量
-(UILabel *)ShopGoodsNumber
{
    if (_shopGoodsNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*3/5, kShopHeight/6, (kCellWidth*4/5)/2-5, kShopHeight/6-5)];
        
        label.text = @"收藏量:1000";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _shopGoodsNumber = label;
    }
    return _shopGoodsNumber;
}

#pragma mark-店铺商品
-(ShopGoodsBtn *)ShopGoodsBtn
{
    NSLog(@"%@",_shopGoodsDic);
    
    if (_shopGoodsBtn == nil)
    {
        for (int i = 0; i < 4; i ++)
        {
            ShopGoodsBtn *btn = [[ShopGoodsBtn alloc]initWithFrame:CGRectMake(5 +(i *(kCellWidth-5)/4), kShopHeight/3+5, (kCellWidth-20)/4, kShopHeight*2/3-10)];
            
            btn.backgroundColor = kBgColor;
            
            [btn AddImageAndText:_shopGoodsDic];
        
            [self addSubview:btn];
            
            _shopGoodsBtn = btn;
            
        }
    }
    return _shopGoodsBtn;
    
}

-(void)addImageAndText:(NSDictionary *)dataDic
{
    NSLog(@"%@",dataDic);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
