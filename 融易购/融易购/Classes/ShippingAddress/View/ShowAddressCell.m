//
//  ShowAddressCell.m
//  RongYiGou
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShowAddressCell.h"

#define kshowAddressCellHeight 83

@interface ShowAddressCell()
{
    float size;
}
@end

@implementation ShowAddressCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        size = 40;
        
        //收货人姓名
        [self ShowAddressName];
        
        //收货人电话号码
        [self ShowAddressNumber];
        
        //收货地址
        [self ShowAddressAddress];
        
        //默认字样
        [self ShowAddressDefault];
    
        //控件适配
        [self ControlAdapter];
    }
    return self;
}

#pragma mark-收货人姓名
-(UILabel *)ShowAddressName
{
    if (_showAddressName == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
        label.text = @"收货人:欧阳兔兔";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _showAddressName = label;
    }
    return _showAddressName;
}

#pragma mark-收货人电话号码
-(UILabel *)ShowAddressNumber
{
    if (_showAddressNumber == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
        label.text = @"电话号码:99899889988";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _showAddressNumber = label;
    }
    return _showAddressNumber;
}

#pragma mark-收货地址
-(UILabel *)ShowAddressAddress
{
    if (_showAddressAddress == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
        label.text = @"收货地址:福建省福州市台江区鳌峰路海峡电子产业基地A区八楼易乐购";
        
        label.font = kLabelFont;
        
        label.numberOfLines = 2;
        
        [self addSubview:label];
        
        _showAddressAddress = label;
    }
    return _showAddressAddress;
}

#pragma mark-默认字样
-(UILabel *)ShowAddressDefault
{
    if (_showAddressDefault == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
        label.text = @"[默认]";
        
        label.font = kLabelFont;
        
        label.hidden = YES;
        
        label.textColor = [UIColor redColor];
        
        [self addSubview:label];
        
        _showAddressDefault = label;
    }
    return _showAddressDefault;
}

#pragma mark-控件适配
-(void)ControlAdapter
{
    //收货姓名
    
    [_showAddressName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(0);
        make.width.equalTo(@(kCellWidth/2));
        make.height.equalTo(@(kshowAddressCellHeight/2));
        
    }];
    
    //收货号码
    [_showAddressNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(_showAddressName.mas_right).with.offset(0);
        make.width.equalTo(@(kCellWidth/2));
        make.height.equalTo(@(kshowAddressCellHeight/2));
        
    }];
    
    //默认标志
    [_showAddressDefault mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_showAddressName.mas_bottom).with.offset(0);
        make.left.equalTo(self).with.offset(5);
        make.width.equalTo(@(size));
        make.bottom.equalTo(self).with.offset(0);
        
    }];
    
    
    //收货地址
    [_showAddressAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_showAddressName.mas_bottom).with.offset(0);
        make.left.equalTo(self).with.offset(size+5);
        make.bottom.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-5);

    }];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
