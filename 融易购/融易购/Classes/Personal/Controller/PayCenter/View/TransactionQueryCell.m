//
//  RechargeRecordsCell.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TransactionQueryCell.h"

#define kRechCellHeight 80

@implementation TransactionQueryCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //创建时间
//        [self RechTime];
        
        _rechTime = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kCellWidth/6, kRechCellHeight)];
        
        //        label.text = @"2016-01-23";
        
        _rechTime.textAlignment = NSTextAlignmentCenter;
        
        _rechTime.textColor = [UIColor greenColor];
        
        _rechTime.numberOfLines = 2;
        
        _rechTime.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:_rechTime];
        
        //名称/交易号
//        [self RechName];
        
        _rechName = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/6, 0, kCellWidth/3, kRechCellHeight)];
        
        //        label.text = @"资金充值交易号 440106016530201601131638381310";
        
        _rechName.numberOfLines = 0;
        
        _rechName.font = [UIFont systemFontOfSize:11];
        
        _rechName.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_rechName];
        
        
        
        //账户类型
//        [self RechType];
        
        
        _rechType = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/2, 0, kCellWidth/6, kRechCellHeight)];
        
        //        label.text = @"对私";
        
        _rechType.numberOfLines = 2;
        
        _rechType.font = [UIFont systemFontOfSize:11];
        
        _rechType.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_rechType];
        
        
        
        
        //金额
//        [self RechAmount];
        
        
        _rechAmount= [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*2/3, 0, kCellWidth/6, kRechCellHeight)];
        
        //        label.text = @"+1199.00";
        
        _rechAmount.textColor = [UIColor redColor];
        
        _rechAmount.numberOfLines = 2;
        
        _rechAmount.font = [UIFont systemFontOfSize:11];
        
        _rechAmount.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_rechAmount];
        
        
        
        //状态
//        [self RechState];
        
        
        _rechState= [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*5/6, 0, kCellWidth/6, kRechCellHeight)];
        
        //        label.text = @"成功";
        
        _rechState.numberOfLines = 2;
        
        _rechState.font = [UIFont systemFontOfSize:11];
        
        _rechState.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_rechState];
        
        
    }
    return self;
}

#pragma mark-创建时间
-(UILabel *)RechTime
{
    if (_rechTime == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kCellWidth/6, kRechCellHeight)];
        
//        label.text = @"2016-01-23";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor greenColor];
        
        label.numberOfLines = 2;
        
        label.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:label];
    }
    return _rechTime;
}

#pragma mark-名称/交易号
-(UILabel *)RechName
{
    if (_rechName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/6, 0, kCellWidth/3, kRechCellHeight)];
        
//        label.text = @"资金充值交易号 440106016530201601131638381310";
        
        label.numberOfLines = 0;
        
        label.font = [UIFont systemFontOfSize:11];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
    }
    return _rechName;
}

#pragma mark-对方
-(UILabel *)RechType
{
    if (_rechType == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/2, 0, kCellWidth/6, kRechCellHeight)];
        
//        label.text = @"对私";
        
        label.numberOfLines = 2;
        
        label.font = [UIFont systemFontOfSize:11];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
    }
    return _rechType;
}


#pragma mark-金额
-(UILabel *)RechAmount
{
    if (_rechAmount == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*2/3, 0, kCellWidth/6, kRechCellHeight)];
        
//        label.text = @"+1199.00";
        
        label.textColor = [UIColor redColor];
        
        label.numberOfLines = 2;
        
        label.font = [UIFont systemFontOfSize:11];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
    }
    return _rechAmount;
}


#pragma mark-状态
-(UILabel *)RechState
{
    if (_rechState == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth*5/6, 0, kCellWidth/6, kRechCellHeight)];
        
//        label.text = @"成功";
        
        label.numberOfLines = 2;
        
        label.font = [UIFont systemFontOfSize:11];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
    }
    return _rechState;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
