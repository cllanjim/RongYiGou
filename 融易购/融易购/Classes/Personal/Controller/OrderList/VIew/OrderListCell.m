//
//  OrderListCell.m
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderListCell.h"

#define kOrderListCellHeight 100

@implementation OrderListCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //商品Icon
        [self OrderGoodsIcon];
        
        //商品标题
        [self OrderGoodsName];
        
        //商品价格
        [self OrderGoodsPrice];
        
        //商品数量
        [self OrderGoodsNumber];
        
    }
    return self;
}

#pragma mark-订单商品头像
-(UIImageView *)OrderGoodsIcon
{
    if (_orderGoodsIcon == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, kOrderListCellHeight-20, kOrderListCellHeight-10)];
        
        imageView.image = [UIImage imageNamed:@"6.png"];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _orderGoodsIcon = imageView;
    }
    return _orderGoodsIcon;
}

#pragma mark-订单商品标题
-(UILabel *)OrderGoodsName
{
    if (_orderGoodsName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kOrderListCellHeight, 5, kCellWidth*3/4-kOrderListCellHeight, (kOrderListCellHeight-10)/2)];
        
        label.text = @"中国五大国有商业银行：中国工商银行、农业银行、中国银行、建设银行、交通银行";
        
        label.font = kLabelFont;
        
        label.numberOfLines = 0;
        
        [self addSubview:label];
        
        _orderGoodsName = label;
    }
    return _orderGoodsName;
}

#pragma mark-订单商品价格
-(UILabel *)OrderGoodsPrice
{
    if (_orderGoodsPrice == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*3/4, 5, kCellWidth/4, (kOrderListCellHeight-10)/4)];
        
        label.text = [NSString stringWithFormat:@"¥ 1000"];
        
         label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _orderGoodsPrice = label;
    }
    return _orderGoodsPrice;
}


#pragma mark-订单商品数量

-(UILabel *)OrderGoodsNumber
{
    if (_orderGoodsNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*3/4, 5 + (kOrderListCellHeight-10)/4, kCellWidth/4, (kOrderListCellHeight-10)/4)];
        
        label.text = [NSString stringWithFormat:@"X 1"];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        
        _orderGoodsNumber = label;
    }
    return _orderGoodsNumber;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
