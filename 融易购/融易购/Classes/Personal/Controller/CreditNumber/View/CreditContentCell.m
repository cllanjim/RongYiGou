//
//  CreditContentCell.m
//  RongYiGou
//
//  Created by mac on 16/1/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CreditContentCell.h"


#define kCreditHeight 60

@implementation CreditContentCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        //修改信息
        [self CreditInformation];
        //修改额度
        [self CreditRevise];
        //修改日期
        [self CreditReciseDate];
        
    }
    return self;
}

#pragma mark-授信额度更改信息
-(UILabel *)CreditInformation
{
    if (_creditInformation == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kCellWidth*8/10-10, kCreditHeight/2)];
        
        label.text = @"管理员ID:27将初始授信10修改为5";
                
        label.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:label];
        
        _creditInformation = label;
    }
    return _creditInformation;
}

#pragma mark- 授信额度更改日期
-(UILabel *)CreditReciseDate
{
    if (_creditReviseDate == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, kCreditHeight/2, kCellWidth*8/10-10, kCreditHeight/2)];
        
        label.text = @"2015-12-13 17:33:35";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _creditReviseDate = label;
    }
    return _creditReviseDate;
}

#pragma mark-授信数量增减明细
-(UILabel *)CreditRevise
{
    if (_creditRevise == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*8/10, 10, kCellWidth*2/10-5, kCreditHeight-20)];
        
        label.text = @"+10";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _creditRevise = label;
    }
    return _creditRevise;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
