//
//  AccountCell.m
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountCell.h"

#define kAccountCellHeight 50

@implementation AccountCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //标题
        [self AccountTitleLabel];
        
        //信息
        [self AccountTextLabel];
        
        //指示图标
        [self AccountIcon];
        
    }
    return self;
}
#pragma  mark-标题
-(UILabel *)AccountTitleLabel
{
    if (_accountTitleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, kCellWidth/3, kAccountCellHeight)];
        
        label.text = [_accountInformationDict objectForKey:@"title"];
        
        label.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:label];
        
        _accountTitleLabel = label;
       
    }
    return _accountTitleLabel;
}

#pragma mark-内容
-(UILabel *)AccountTextLabel
{
    if (_accountTextLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth/3, 0, kCellWidth*2/3-40, kAccountCellHeight)];
        
        label.text = [_accountInformationDict objectForKey:@"text"];
        
        label.font = [UIFont systemFontOfSize:15];
        
        label.textColor = [UIColor lightGrayColor];
        
        label.textAlignment = NSTextAlignmentRight;
    
        [self addSubview:label];
        
        _accountTextLabel = label;

    }
    return _accountTextLabel;
}

#pragma mark-图标
-(UILabel *)AccountIcon
{
    if (_accountIcon == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCellWidth-40, 0, 40, kAccountCellHeight)];
        
        label.text = @">";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        
        _accountIcon = label;
    }
    return _accountIcon;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
