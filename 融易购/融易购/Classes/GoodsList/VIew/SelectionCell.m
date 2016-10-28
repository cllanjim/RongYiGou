//
//  SelectionCell.m
//  RongYiGou
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SelectionCell.h"

@implementation SelectionCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
