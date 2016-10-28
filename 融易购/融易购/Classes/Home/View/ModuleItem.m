//
//  ModuleItem.m
//  RongYiGou
//
//  Created by mac on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ModuleItem.h"

#define kModuleWidth self.frame.size.width

#define kModuleHeight self.frame.size.height

#define kRatio  0.4

@interface ModuleItem()
{
    NSString *_image;
    
    NSString *_title;
    
    NSString *_price;
    
}
@end

@implementation ModuleItem

-(void)addData:(NSDictionary *)dataDic Controller:(UIViewController *)controller
{
    _ModuleDataDic = dataDic;
    
    _viewController = controller;
    
    //1.商品展示的图片
    [self GoodImage];
    
    //2.商品展示的标题
    [self GoodTitleLabel];
    
    //3.商品展示的价格
    [self GoodPriceLabel];
    
    //按钮点击事件
    [self addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark-界面跳转
-(void)BtnClick
{
    ProductDetailsController *productDetails=[ProductDetailsController new];
    
    productDetails.StringId = _ModuleDataDic[@"id"];
    
    productDetails.productDetailNavController = _viewController.navigationController;
    
    [_viewController.navigationController pushViewController:productDetails animated:YES];
}

#pragma mark-创建商品图片
-(UIImageView *)GoodImage
{
    if (_goodImage == nil)
    {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kModuleWidth, kModuleHeight*(1-kRatio))];
        
        [imageview sd_setImageWithURL:[NSURL URLWithString:_ModuleDataDic[@"pic"]]];
        
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageview];
        
        _goodImage = imageview;
                                                                              
    }
    return _goodImage;
}


#pragma mark-商品标题
-(UILabel *)GoodTitleLabel
{
    if (_goodTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _goodImage.frame.size.height, kModuleWidth, kModuleHeight*0.2)];
        
        label.textColor = [UIColor grayColor];
        
        label.text = _ModuleDataDic[@"name"];
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _goodTitle = label;
    }
    
    return _goodTitle;
}

#pragma mark-商品价格
-(UILabel *)GoodPriceLabel
{
    if (_goodPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,kModuleHeight*0.8, kModuleWidth, kModuleHeight*0.2)];
        
        label.textColor = [UIColor redColor];
        
        label.text = _ModuleDataDic[@"price"];
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _goodPrice = label;
    }
    return _goodPrice;
}


@end
