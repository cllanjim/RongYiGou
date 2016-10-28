//
//  GoodsEvaluate.m
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsEvaluate.h"
#import "ProductDetailsController.h"

@interface GoodsEvaluate()
{
    float HeightY;
}
@end

@implementation GoodsEvaluate

-(void)addWithContent:(NSDictionary *)content Number:(NSString *)num
{
    
    _goodsDataDic = content;
    
    _goodsNumber = num;
    
    //商品评价标题
    [self TitleLabel];

    //头像
    [self IconimageView];
    
    //用户名称
    [self UserName];
    
    //评价内容
    [self UserText];
    
    //订单时间
    [self OrderTime];
    
    //订单配置
    [self OrderParameter];
    
  
}

#pragma mark-商品标题
-(UILabel *)TitleLabel
{
    if (_title == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, self.frame.size.width/2-30,self.frame.size.height/7-10)];
        
        label.text = @"商品评价(0)";
        
        label.text = [NSString stringWithFormat:@"商品评价(%@)",_goodsNumber];
        
        label.font =kLabelFont;
        
        [self addSubview:label];
        
        HeightY += label.frame.size.height +15;
        
        _title = label;
    }
    return _title;
}

#pragma mark-头像
-(UIImageView *)IconimageView
{
    if (_iconImageView == nil)
    {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, HeightY, self.frame.size.width/10-10, self.frame.size.width/10-10)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        if (!_goodsDataDic)
        {
            [image sd_setImageWithURL:_goodsDataDic[@"user_logo"]];
        }
       
        
        [self addSubview:image];
    
        _iconImageView = image;
    }
    return _iconImageView;
}

#pragma mark-用户名称
-(UILabel *)UserName
{
    if (_userName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/10 + 10,HeightY, self.frame.size.width/2, self.frame.size.width/10-10)];
        
        if (!_goodsDataDic)
        {
            label.text =_goodsDataDic[@"user_name"];
        }
        
        
        label.font = kLabelFont;
        
        HeightY += label.frame.size.height;
        
        [self addSubview:label];
        
        _userName = label;
    }
    return _userName;
}


#pragma mark-用户评价
-(UILabel *)UserText
{
    if (_userText == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, HeightY, self.frame.size.width-20, self.frame.size.height/4)];
        
        if (!_goodsDataDic)
        {
            label.text = _goodsDataDic[@"review_content"];
        }
        
        label.font = kLabelFont;
        
        label.numberOfLines = 2;
        
        [self addSubview:label];
        
        HeightY += label.frame.size.height;
        
        _userName = label;
    }
    return _userName;
}


#pragma mark-评价时间
-(UILabel *)OrderTime
{
    if (_orderTime == nil)
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, HeightY, self.frame.size.width/3, self.frame.size.height/8)];
            
        label.font = [UIFont systemFontOfSize:10];
        
        if (!_goodsDataDic)
        {
             label.text = _goodsDataDic[@"review_date"];
        }
        
        label.textAlignment = NSTextAlignmentCenter;
            
        [self addSubview:label];
        
    }
    return _orderTime;
}

#pragma mark-参数
-(UILabel *)OrderParameter
{
    if (_orderParameter == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/3, HeightY, self.frame.size.width*2/3, self.frame.size.height/8)];
        
        label.font = [UIFont systemFontOfSize:10];
        
//        label.text = @"网络类型:4G 机身颜色:银色 机身内存:16G";
        
        [self addSubview:label];

        HeightY += label.frame.size.height +5;

    }
    return _orderParameter;
}

@end
