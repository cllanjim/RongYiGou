//
//  CommodityParametersCell.m
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CommodityParametersCell.h"

@implementation CommodityParametersCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //标题
        [self Title];
        
        //内容
        [self Content];
    }
    return self;
}

#pragma mark-标题
-(UILabel *)Title
{
    if (_title == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, self.frame.size.width/3-30, self.frame.size.height-10)];
        
        label.text = @"品牌";
        
        label.textColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:196/255.0 alpha:1];
        
        [self addSubview:label];
    }
    return _title;
}

#pragma mark-内容
-(UILabel *)Content
{
    if (_content == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/3, 5, self.frame.size.width*2/3, self.frame.size.height-10)];
        
        label.text = @"小米(MI)";
        
        [self addSubview:label];
    }
    return _content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
