//
//  ShopGoodsBtn.m
//  RongYiGou
//
//  Created by mac on 16/3/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopGoodsBtn.h"

@implementation ShopGoodsBtn

-(void)AddImageAndText:(NSDictionary *)dataDic
{
    
    _goodsDataDic = dataDic;
    
    //添加图片
    [self GoodsBtnICon];
    
    //添加文字内容
    [self GoodsBtnText];
    
}

#pragma mark-店铺商品图片
-(UIImageView *)GoodsBtnICon
{
    if (_goodsBtnICon == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.7)];
        
        if ([_goodsDataDic[@"image"]isEqual:@""])
        {
            [imageView sd_setImageWithURL:_goodsDataDic[@"image"]];
        }
        
        [self addSubview:imageView];
        
        _goodsBtnICon = imageView;
    }
    return _goodsBtnICon;
}


#pragma mark-店铺商品文字
-(UILabel *)GoodsBtnText
{
    if (_goodsBtnText == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*0.7, self.frame.size.width, self.frame.size.height*0.3)];
        
        label.backgroundColor = [UIColor lightGrayColor];
        
         if ([_goodsDataDic[@"name"]isEqual:@""])
         {
             label.text = _goodsDataDic[@"name"];
         }
        
        [self addSubview:label];
        
        _goodsBtnText = label;
        
    }
    return _goodsBtnText;
}


@end
