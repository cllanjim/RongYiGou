//
//  AccountInformationCell.m
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountInformationCell.h"

#define kAccountCellHeight 44

@implementation AccountInformationCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //标题信息
        [self AccountTitle];
    
        //展示信息
        [self AccountText];
        
    }
    return self;
}

#pragma mark-标题信息
-(UILabel *)AccountTitle
{
    if (_accountTitle == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, kCellWidth/3,kAccountCellHeight)];
        
        label.text = @"This is title";
        
        label.textAlignment = NSTextAlignmentRight;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _accountTitle = label;
    }
    return _accountTitle;
}

#pragma mark-信息内容
-(UILabel *)AccountText
{
    if (_accountText == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/3+30, 0, kCellWidth/2, kAccountCellHeight)];
        
        label.text = @"this is text";

        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _accountText = label;
    }
    return _accountText;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
