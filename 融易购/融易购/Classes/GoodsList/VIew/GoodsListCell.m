//
//  GoodsListCell.m
//  RongYiGou
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodsListCell.h"
#import "Masonry.h"

#define kGoodListCellHeight 100

@implementation GoodsListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //商品简略图
        [self IconImage];
        
        //标题
        [self TitleLabel];
        
        //销售量
        [self SalesVolumeLabel];
        
        //店铺名字
        [self ShopName];
        
        //价格
        [self Price];
        
        //地址
        [self ShopAddress];
        
       //屏幕适配
        [self ScreenAdaptation];
        
        
    }
    return self;
}

#pragma mark-商品简略图
-(UIImageView *)IconImage
{
    if (_iconImage == nil)
    {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,  self.frame.size.height-10, self.frame.size.height-10)];
        
        image.backgroundColor = kBgColor;
        
        //设置图片的样式
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        image.image = [UIImage imageNamed:@"1.png"];
        
        [self addSubview:image];
        
        _iconImage = image;
    }
    return _iconImage;
}

#pragma mark-标题;
-(UILabel *)TitleLabel
{
    if (_titleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height, 5, self.frame.size.width-self.frame.size.height, self.frame.size.height/3)];
        
        label.backgroundColor = kBgColor;
        
        label.numberOfLines = 2;
        
        label.font = kLabelFont;
        
        label.text = @"在iphone1-iphone3gs时代 window的size固定为(320,480) 我们只需要简单计算一下相对位置就好了";
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}

#pragma mark-销售量
-(UILabel *)SalesVolumeLabel
{
    if (_salesVolumeLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height, self.frame.size.height/3+10, self.frame.size.width/5, self.frame.size.height*2/9)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"月销售:1000";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:label];
        
        _salesVolumeLabel = label;
    }
    return _salesVolumeLabel;
}

#pragma mark-店铺名称
-(UILabel *)ShopName
{
    if (_shopName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/5 +self.frame.size.height + 5, self.frame.size.height/3+10, self.frame.size.width-self.frame.size.width/5-self.frame.size.height-20, self.frame.size.height*2/9)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"福建易乐购网络科技有限公司";
        
        label.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:label];
        
        _shopName = label;
    }
    return _shopName;
}

#pragma mark-价格
-(UILabel *)Price
{
    if (_price == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height, self.frame.size.height*2/3+20, self.frame.size.width/4, self.frame.size.height*3/9)];
        
        label.backgroundColor = kBgColor;
        
        label.text= @"¥5000";
        
        label.textColor = [UIColor redColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _price = label;
    }
    return _price;
}

#pragma mark-地址
-(UILabel *)ShopAddress
{
    if (_shopAddress == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height+self.frame.size.width/4+5, self.frame.size.height*2/3+20, self.frame.size.width/5, self.frame.size.height*3/9)];
        
        label.backgroundColor = kBgColor;
        
        label.text = @"福州";
        
        [self addSubview:label];
        
        _shopAddress = label;
    }
    return _shopAddress;
}

#pragma mark-屏幕适配
-(void)ScreenAdaptation
{
    //缩略图
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(5);
        make.width.equalTo(@(kGoodListCellHeight-10));
        make.height.equalTo(@(kGoodListCellHeight-10));
        
    }];
    
    //标题
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(_iconImage.mas_right).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.height.equalTo(@(kGoodListCellHeight*2/5));

        
    }];

    //销售量
    
    [_salesVolumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(0);
        make.left.equalTo(_iconImage.mas_right).with.offset(5);
        make.width.equalTo(@(self.frame.size.width/4));
        make.height.equalTo(@(kGoodListCellHeight/5));
        
    }];
    
    //店铺名称
    
    [_shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(0);
        make.left.equalTo(_salesVolumeLabel.mas_right).with.offset(0);
        make.right.equalTo(self).with.offset(-5);
        make.height.equalTo(@(kGoodListCellHeight/5));
        
    }];
    
    //价格
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_salesVolumeLabel.mas_bottom).with.offset(0);
        make.left.equalTo(_iconImage.mas_right).with.offset(5);
        make.bottom.equalTo(self).with.offset(-5);
        make.width.equalTo(@(self.frame.size.width/4));
        
    }];
    
    
    //地址
    
    [_shopAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_salesVolumeLabel.mas_bottom).with.offset(0);
        make.left.equalTo(_price.mas_right).with.offset(0);
        make.bottom.equalTo(self).with.offset(-5);
        make.right.equalTo(self).with.offset(-5);
        
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
