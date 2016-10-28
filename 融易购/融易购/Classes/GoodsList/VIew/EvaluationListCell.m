//
//  EvaluationListCell.m
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "EvaluationListCell.h"

#define kEvaluationListCellHeight 100
@implementation EvaluationListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //用户名
        [self UserName];
        
        //评价内容
        [self Content];
        
        //时间
        [self Time];
        
        //产品参数
        [self UserLogo];
        
        //UI适配
        [self UIAdaptation];
    }
    return self;
}

#pragma mark-用户名
-(UILabel *)UserName
{
    if (_userName == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
//        label.text = @"你是猴子派来的逗比吗?";
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _userName = label;
    }
    return _userName;
}

#pragma mark-评价内容
-(UILabel *)Content
{
    if (_content == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
//         label.text = @"哎 再也不在网上买这么贵的东西了 都已经去售后检测了 是暖屏 但是质量很差,服务态度也很差";
        
        label.numberOfLines = 2;
        
        label.font = kLabelFont;
        
        [self addSubview:label];
        
        _content = label;
    }
    return _content;
}



#pragma mark-时间
-(UILabel *)Time
{
    if (_time == nil)
    {
        UILabel *label = [[UILabel alloc]init];
        
//         label.text = @"2015-12-24-10:59:59";
        
        label.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:label];
        
        _time = label;
    }
    return _time;
}



#pragma mark-产品参数
-(UIImageView *)UserLogo
{
    if (_userLogo == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _userLogo = imageView;
    }
    return _userLogo;
}

#pragma mark-UI适配
-(void)UIAdaptation
{
    
    [_userLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(5);
        make.width.equalTo(@(60));
        make.height.equalTo(@(60));
    }];

    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(_userLogo.mas_right).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.height.equalTo(@(kEvaluationListCellHeight*1.5/7));
        
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_userName.mas_bottom).with.offset(3);
        make.left.equalTo(_userLogo.mas_right).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.height.equalTo(@(kEvaluationListCellHeight*3/7));

    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_content.mas_bottom).with.offset(3);
        make.left.equalTo(self).with.offset(5);
        make.bottom.equalTo(self).with.offset(-5);
        make.width.equalTo(@(self.frame.size.width/3));
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
