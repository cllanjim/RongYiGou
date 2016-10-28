//
//  LoginInTitleBtn.m
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginInTitleBtn.h"

@implementation LoginInTitleBtn

-(void)addTitle:(NSString *)title IconImage:(UIImage *)icon
{
    [self setTitle:title forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self setImage:icon forState:UIControlStateNormal];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

#pragma mark-调整内部ImageView的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    
    CGFloat imageY = 0;
    
    CGFloat imageWidth = contentRect.size.width* 0.4;
    
    CGFloat imageHeight = contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark-调整内部UILabel的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = contentRect.size.width* 0.6;
    
    CGFloat titleHight = contentRect.size.height;
    
    CGFloat titleY = 0;
    
    CGFloat titleWidth = contentRect.size.width* 0.6;
    
    return CGRectMake( titleX, titleY, titleWidth, titleHight);
}


@end
