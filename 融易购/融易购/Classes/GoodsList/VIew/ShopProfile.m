//
//  ShopProfile.m
//  RongYiGou
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopProfile.h"
#import "ShopDetailsController.h"

@interface ShopProfile()
{
    float HeightY;
    
    NSArray *array;
}

@end

@implementation ShopProfile

-(void)AddShopProfile: (NSDictionary *)information NavController:(UINavigationController *)navController;
{
    
    _shopDataDic = information;
    
    _shopProNavController = navController;
    
    self.backgroundColor = kBgColor;
    
    NSString *AStr = [NSString stringWithFormat:@"描述相符:%@ ",_shopDataDic[@"score"][@"aw"]];
    
    NSString *BStr = [NSString stringWithFormat:@"描述相符:%@ ",_shopDataDic[@"score"][@"bw"]];
    
    NSString *CStr = [NSString stringWithFormat:@"描述相符:%@ ",_shopDataDic[@"score"][@"cw"]];
    
    array = [[NSArray alloc]initWithObjects:AStr,BStr,CStr, nil];
    
    //头像
    [self LOGOImageView];
    
    //名称
    [self Title];
    
    //全部商品数量
    [self GoodsNumber];
    
    //上新商品数量
    [self NewGoodsNumber];
    
    //关注人数
    [self FllowPersonNumber];
    
    //店铺点评
    [self ShopInformation];
    
    //查看分类和进店逛逛按钮
    [self ButtonFunction];
}
#pragma mark-LOGO
-(UIImageView *)LOGOImageView
{
    if (_iconImage == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.height/3-10, self.frame.size.height/3-10)];
        
        imageView.backgroundColor = [UIColor greenColor];
        
        [imageView sd_setImageWithURL:_shopDataDic[@"shop_logo"]];
        
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _iconImage = imageView;
    }
    return _iconImage;
}

#pragma mark-名称
-(UILabel *)Title
{
    if (_title == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height/3 + 10, 20, self.frame.size.width/1.5, self.frame.size.height/3-30)];
      
        if (![_shopDataDic[@"company"]isEqualToString:@""])
        {
             label.text = _shopDataDic[@"company"];
        }
        else
        {
            label.text = @"公司名称未填写";
        }
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _title = label;
    }
    HeightY +=self.frame.size.height/2.3;
    
    return _title;
}

#pragma mark-全部商品
-(void)GoodsNumber
{
    if (_goodsNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, HeightY, self.frame.size.width/4-15, self.frame.size.height/10)];
        

        if (![_shopDataDic[@"count"]isEqualToString:@""])
        {
            label.text = _shopDataDic[@"count"];
        }
        else
        {
            label.text = @"待定";
        }
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        HeightY +=self.frame.size.height/9;
        
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, HeightY,self.frame.size.width/4-15, self.frame.size.height/10)];
        
        label1.text = @"全部商品";
        
        label1.font = kLabelFont;
        
        label1.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label1];
        
        HeightY -=self.frame.size.height/9;
    }
}

#pragma mark-上新
-(void)NewGoodsNumber
{
    if (_newGoodsNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/4+5, HeightY, self.frame.size.width/4-15, self.frame.size.height/10)];
        
        label.text = _shopDataDic[@"shop_new"];
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        HeightY +=self.frame.size.height/9;
        
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/4 +5, HeightY,self.frame.size.width/4-15, self.frame.size.height/10)];
        
        label1.text = @"上新";
        
        label1.font = kLabelFont;
        
        label1.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label1];
        
        HeightY -=self.frame.size.height/9;

    }
}

#pragma mark-关注人数
-(void)FllowPersonNumber
{
    if (_followPersonNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2 + 5, HeightY, self.frame.size.width/4-15, self.frame.size.height/10)];
        
        label.text = _shopDataDic[@"shop_collect"];
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        HeightY +=self.frame.size.height/9;
        
        [self addSubview:label];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2 + 5, HeightY,self.frame.size.width/4-15, self.frame.size.height/10)];
        
        label1.text = @"关注人数";
        
        label1.font = kLabelFont;
        
        label1.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label1];
        
         HeightY -=self.frame.size.height/9;
    }
}

#pragma mark-评价信息
-(void)ShopInformation
{
    if (_shopInformation == nil)
    {
        for (int i = 0; i <3; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width*3/4 -5, HeightY-10, self.frame.size.width/4, self.frame.size.height/10)];
            
            label.font = [UIFont systemFontOfSize:10];
            
            label.text = [array objectAtIndex:i];
            
            label.textAlignment = NSTextAlignmentCenter;

            HeightY +=self.frame.size.height/9;
            
            [self addSubview:label];
        }
    }
}

#pragma mark-查看分类和进店逛逛按钮
-(void)ButtonFunction
{
    if (_buttonFunction == nil)
    {
        for (int i = 0; i <2; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/6 + i *(self.frame.size.width/3), self.frame.size.height*3.8/5, self.frame.size.width/3-10, self.frame.size.height/6)];
            
            btn.backgroundColor =[UIColor lightGrayColor];
            
            btn.tag = i + 1;
            
            btn.titleLabel.font = kLabelFont;
            
            if (btn.tag == 1)
            {
                [btn setTitle:@"查看分类" forState:UIControlStateNormal];
                
                [btn setTitle:@"" forState:UIControlStateHighlighted];
            }
            else if (btn.tag == 2)
            {
                [btn setTitle:@"进店逛逛" forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(BtnEnterShopClick) forControlEvents:UIControlEventTouchUpInside];
                
                [btn setTitle:@"" forState:UIControlStateHighlighted];
            }
            
            [self addSubview:btn];

        }
    }
   
}
#pragma mark-进店逛逛按钮的响应方法
-(void)BtnEnterShopClick
{
    ShopDetailsController *shopDetails = [ShopDetailsController new];
    
    shopDetails.shopDetailsNavController = _shopProNavController;
    
    [_shopProNavController pushViewController:shopDetails animated:YES];
}

@end
