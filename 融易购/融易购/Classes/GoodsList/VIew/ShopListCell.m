//
//  ShopListCell.m
//  RongYiGou
//
//  Created by mac on 16/1/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopListCell.h"
#import "Masonry.h"


#define kShopListHeight 150

@implementation ShopListCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //店铺icon
        [self IconImageView];
        
        //店铺名称
        [self TitleLabel];

    }
    return self;
    
}
#pragma mark-店铺icon
-(UIImageView *)IconImageView
{
    if (_iconImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, kCellWidth/5-5, kShopListHeight/3-5)];
    
        imageView.image = [UIImage imageNamed:@"img6.png"];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _iconImageView = imageView;
    }
    return _iconImageView;
}

#pragma mark-店铺名称
-(UILabel *)TitleLabel
{
    if (_titleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/5, 5, kCellWidth*4/5-5, kShopListHeight/6-5)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"易乐购网络科技有限公司";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}

#pragma mark-店铺信用等级
-(UILabel *)CreditLabel
{
    if (_creditLabel == nil)
    {
        for (int i = 0; i < 3; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/5 + i * (kCellWidth*4/5-5)/3 , kShopListHeight/6, (kCellWidth*4/5-5)/3, kShopListHeight/6)];
            
            label.tag = 10 + i;
            
            label.backgroundColor = kBgColor;
            
            label.textAlignment = NSTextAlignmentCenter;
            
            label.font = kLabelFont;
            
            label.textColor = [UIColor redColor];
            
            switch (label.tag ) {
                case 10:
                {
                    label.text =[NSString stringWithFormat:@"描述: %@",_goodsDic[@"a"]];
                    
                }
                    break;
                case 11:
                {
                    label.text = [NSString stringWithFormat:@"服务: %@",_goodsDic[@"b"]];
                }
                    break;
                case 12:
                {
                    label.text = [NSString stringWithFormat:@"物流: %@",_goodsDic[@"c"]];
                }
                    
                default:
                    break;
            }
            
            [self addSubview:label];
            
            _creditLabel = label;
        }
    }
    return _creditLabel;
}

#pragma mark-店铺商品
-(UIButton *)GoodsBtn
{
    if (_goodsBtn == nil)
    {
        for (int i = 0; i < [_goodsDic[@"product_list"]count] && i < 3; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5 +(i *(kCellWidth-5)/3), kShopListHeight/3+5, (kCellWidth-20)/3, kShopListHeight*2/3-5)];
            
            btn.tag = 200 + i;
            
            btn.backgroundColor = kBgColor;
            
            [self addSubview:btn];
            
            _goodsBtn = btn;
            
            //商品Icon
            [self GoodsBtnImageView:(int)btn.tag];
            
            //商品标题
            [self GoodsBtnLabel:(int)btn.tag];
            
            //商品价格
            [self GoodsPrice:(int)btn.tag];

        }
    }
    return _goodsBtn;

}

#pragma mark-商品图片
-(UIImageView *)GoodsBtnImageView:(int)tag
{
 
    NSInteger inter = tag-200;
    
    if (_goodsBtnImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _goodsBtn.frame.size.width, _goodsBtn.frame.size.height*6/10)];
        
        [imageView sd_setImageWithURL:_goodsDic[@"product_list"][inter][@"pic"]];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_goodsBtn addSubview:imageView];
        
        _goodsBtnImageView = imageView;
    }
    return _goodsBtnImageView;
}


#pragma mark-商品标题
-(UILabel *)GoodsBtnLabel:(int)tag
{
    
    NSInteger inter = tag-200;
    
    if (_goodsBtnLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _goodsBtn.frame.size.height*6/10, _goodsBtn.frame.size.width, _goodsBtn.frame.size.height*2/10)];
        
        label.backgroundColor = kBgColor;
        
        label.font = kLabelFont;
        
        label.text = _goodsDic[@"product_list"][inter][@"name"];
        
        [_goodsBtn addSubview:label];
        
        _goodsBtnLabel = label;
    }
    return _goodsBtnLabel;
}

#pragma mark-商品价格
-(UILabel *)GoodsPrice:(int)tag
{
    NSInteger inter = tag-200;
    
    if (_goodsPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _goodsBtn.frame.size.height*8/10, _goodsBtn.frame.size.width, _goodsBtn.frame.size.height*2/10)];
        
        label.backgroundColor = kBgColor;
        
        label.font = kLabelFont;
        
        label.text =[NSString stringWithFormat:@"¥%@",_goodsDic[@"product_list"][inter][@"price"]];
        
        [_goodsBtn addSubview:label];
    }
    return _goodsPrice;
}

-(void)AddGoodsData:(NSDictionary *)goodsDic
{
    _goodsDic = goodsDic;
    
    
    //店铺信用等级
    [self CreditLabel];
    
    //店铺商品
    [self GoodsBtn];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
