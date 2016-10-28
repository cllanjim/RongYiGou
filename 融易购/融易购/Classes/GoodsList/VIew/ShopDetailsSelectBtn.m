//
//  ShopDetailsSelectBtn.m
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopDetailsSelectBtn.h"

@implementation ShopDetailsSelectBtn

-(void)addTitle:(NSString *)title Number:(NSString *)number
{
    _title = title;
    
    _number = number;
    
    if ([_number isEqual:@"0"])
    {
        _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        _textLabel.text = _title;
        
        _textLabel.font = kLabelFont;
        
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_textLabel];
    }
    else
    {
        
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, self.frame.size.height/2-5)];
        
        _numLabel.text = _number;
        
        _numLabel.font = kLabelFont;
        
        _numLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_numLabel];
        
        
        _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2-5)];
        
        _textLabel.text = _title;
        
        _textLabel.font = kLabelFont;
        
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_textLabel];
    }
}
@end
