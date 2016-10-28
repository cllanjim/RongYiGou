//
//  AuthcodeView.m
//  IOS 本地动态验证码生成
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AuthcodeView.h"

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define kLineCount 6
#define kLineWidth 1.0
#define kCharCount 4
#define kFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]

@implementation AuthcodeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = 5.0f;
        
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = kRandomColor;
        
        //获取随机验证码
        [self getAuthcode];
    }
    return self;
}


-(void)getAuthcode
{
    //字符串素材
    
    _dataArray = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    _authCodeStr = [[NSMutableString alloc]initWithCapacity:kCharCount];
    
    for (int i = 0; i < kCharCount; i++)
    {
        NSInteger index = arc4random() % (_dataArray.count-1);
        NSString *tempStr = [_dataArray objectAtIndex:index];
        _authCodeStr = (NSMutableString *)[_authCodeStr stringByAppendingString:tempStr];
    }
    
    if ([_delegate respondsToSelector:@selector(authcodeView:AuthCode:)])
    {
        [_delegate authcodeView:self AuthCode:_authCodeStr];
    }
    
}

#pragma mark-点击界面切换验证码
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self getAuthcode];
    
    [self setNeedsDisplay];
}




-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.backgroundColor = kRandomColor;
    
    //根据要显示的验证码字符串,根据长度,计算每个字符创的位置
    
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for ( int i = 0; i<text.length; i++)
    {
        pX = arc4random() % width + rect.size.width/text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条宽度
    CGContextSetLineWidth(context, kLineWidth);
    
    //绘制干扰线
    for (int i = 0; i < kLineCount; i++)
    {
        UIColor *color = kRandomColor;
        CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
        
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        //画线
        CGContextStrokePath(context);
    }
    
    
}



+(id)GetAuthCode:(CGRect)frame
{
    return [[self alloc]initWithFrame:frame];
}



@end
