//
//  OrderGoodsInformation.m
//  RongYiGou
//
//  Created by mac on 16/2/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderGoodsInformation.h"

@implementation OrderGoodsInformation

-(void)addOrderGoodsInformation:(NSDictionary *)goodsInformation
{
    
    _getGoodsDataDic = goodsInformation;
    
    //1.商品图片
    [self OrderGoodsImageView];
    //2.商品标题
    [self OrderGoodsTitle];
    //3.商品配置
    [self OrderGoodsSpec];
    //4.商品价格
    [self OrderGoodsPrice];
    //5.商品数量
    [self OrderGoodsNumber];
}

#pragma mark-商品图片
-(UIImageView *)OrderGoodsImageView
{
    if (_orderGoodsImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height , self.frame.size.height)];
        
//        imageView.image = [UIImage imageNamed:@"1.png"];
        
        [imageView sd_setImageWithURL:_getGoodsDataDic[@"goodImage"]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _orderGoodsImageView = imageView;
    }
    return _orderGoodsImageView;
}

#pragma mark-商品标题
-(UILabel *)OrderGoodsTitle
{
    if (_orderGoodsTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height, 0, self.frame.size.width/2, self.frame.size.height/2)];
        
        label.text = _getGoodsDataDic[@"goodTitle"];
        
        label.numberOfLines = 2;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _orderGoodsTitle = label;
    }
    return _orderGoodsTitle;
}

#pragma  mark-商品配置
-(UILabel *)OrderGoodsSpec
{
    if (_orderGoodsSpec == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height, self.frame.size.height/2, self.frame.size.width/2, self.frame.size.height/2)];
        
        label.numberOfLines = 0;
        
        label.text = _getGoodsDataDic[@"goodConfig"];
        
        label.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:label];
        
        _orderGoodsSpec = label;
    }
    
    return _orderGoodsSpec;
}

#pragma mark-商品价格
-(UILabel *)OrderGoodsPrice
{
    if (_orderGoodsPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2 +self.frame.size.height, 0, self.frame.size.width/2-self.frame.size.height, self.frame.size.height/2)];
        
        label.text = [NSString stringWithFormat:@" ¥ %@",_getGoodsDataDic[@"goodPrice"]];
        
        label.textColor = [UIColor redColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _orderGoodsPrice = label;
    }
    return _orderGoodsPrice;
}


#pragma mark-商品数量

-(UILabel *)OrderGoodsNumber
{
    if (_orderGoodsNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2 +self.frame.size.height, self.frame.size.height/2, self.frame.size.width/2-self.frame.size.height, self.frame.size.height/2)];
        
        label.text = [NSString stringWithFormat:@" X %@",_getGoodsDataDic[@"goodNumber"]];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _orderGoodsNumber = label;
    }
    return _orderGoodsNumber;
}



@end
