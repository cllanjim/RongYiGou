//
//  GoodListBtn.m
//  RongYiGou
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GoodListBtn.h"
#import "ProductDetailsController.h"

@interface GoodListBtn()
{
    NSString *_titleText;
    
    UILabel *_iconLabel;
}

@end

@implementation GoodListBtn
-(void)addTitle:(NSString *)title
{
     _titleText= title;
    
     [self setBackgroundColor:kBgColor];
    
    //标题
    [self Title];
    
    //指示按钮
    
//    [self IconImage];
    
    [self IconLabel];
    
}


#pragma mark-标题
-(UILabel *)Title
{
    if (_title == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
        float width =[_titleText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
        
        label.frame = CGRectMake(20, 0, width, self.frame.size.height);
        
        label.text = _titleText;
        
        label.font = [UIFont systemFontOfSize:15];
    
        [self addSubview:label];
    
    }
    return _title;
}

#pragma mark-指示按钮

-(UIImageView *)IconImage
{
    if (_iconImage == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width*2/3-20, self.frame.size.height)];
        
        [self addSubview:imageView];
        
        _iconImage = imageView;
    }
    return _iconImage;
}


-(UILabel *)IconLabel
{
    if (_iconLabel == nil)
    {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width/3-20, self.frame.size.height)];
        
        label.text = @">";
        
        label.textColor = [UIColor lightGrayColor];
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:label];
        
        _iconLabel = label;
    }
    return _iconLabel;
}


@end
