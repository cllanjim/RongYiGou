//
//  OrderDetailsCell.m
//  RongYiGou
//
//  Created by mac on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderDetailsCell.h"
#import "ShoppingCartModel.h"
#import "ShopOrderModel.h"

@interface OrderDetailsCell()
{
    BOOL flay;
    
    float YHeight;
    
    CGFloat h;
}
@end

@implementation OrderDetailsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
         //1.添加订单其他控件
        [self addAllSubView];
    }
    
    return self;
}

#pragma mark-添加订单本身控件
-(void)addAllSubView
{
    //选中按钮
    [self SelectBtn];
    
    //头像
    [self IconImage];
    
    //正常模式下的订单列表
    [self GoodsInformation];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).offset(5);
        make.left.equalTo(_selectBtn.mas_right).offset(5);
        make.width.equalTo(@(120));
        make.height.equalTo(@(120));
        
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).offset(5);
        make.left.equalTo(_iconImage.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.height.equalTo(@(25));
        
    }];
    
     [_parameterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(_iconImage.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.height.equalTo(@(25));
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_parameterBtn.mas_bottom).offset(10);
        make.left.equalTo(_iconImage.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.height.equalTo(@(25));
        
    }];
    
  
     [_reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
         make.top.equalTo(_priceLabel.mas_bottom).offset(10);
         
         make.left.equalTo(_iconImage.mas_right).offset(20);
         
         make.bottom.equalTo(self.mas_bottom).offset(-10);
         
         make.width.equalTo(@(35));
         
    }];
    
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_priceLabel.mas_bottom).offset(10);
        
        make.left.equalTo(_reduceBtn.mas_right).offset(0);
        
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        
        make.width.equalTo(@(60));
        
    }];
    
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_priceLabel.mas_bottom).offset(10);
        
        make.left.equalTo(_numberLabel.mas_right).offset(0);
        
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        
        make.width.equalTo(@(35));
        
    }];
    
    
    [_specScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top).offset(5);
        
        make.left.equalTo(_iconImage.mas_right).offset(5);
        
        make.right.equalTo(self.mas_right).offset(-5);
        
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        
    }];

}

#pragma mark-选中按钮
-(UIButton *)SelectBtn
{
    if (_selectBtn == nil)
    {
       UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(12,65, 20, 20)];
        
        btn.backgroundColor = [UIColor lightGrayColor];
    
        btn.layer.cornerRadius =10;
        
        [self addSubview:btn];
        
        _selectBtn = btn;
    }
    return _selectBtn;
}


#pragma mark-头像
-(UIImageView *)IconImage
{
    if (_iconImage == nil)
    {
       UIImageView * imageView = [[UIImageView alloc]init];
        
        imageView.image = [UIImage imageNamed:@"1.png"];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        _iconImage = imageView;
    }
    return _iconImage;
}

#pragma mark-正常模式下的订单列表
-(void)GoodsInformation
{
    //商品标题
    [self TitleLabel];
    
    //商品价格
    [self PriceLabel];
   
    //商品参数
    [self ParameterLabel];
   
    //减少商品数量
    [self ReduceBtn];
    
    //商品数量
    [self NumberLabel];
    
    //增加商品数量
    [self AddBtn];

    NSLog(@"%f",YHeight);
    
    
}

#pragma mark-商品标题
-(UILabel *)TitleLabel
{
    if (_titleLabel == nil)
    {
       UILabel * label = [[UILabel alloc]init];
        
        label.text = @"[原装正品]XiaoMi/小米 小米手机4 联通4G 分期0首付";
        
        label.font = kLabelFont;
        
        label.numberOfLines = 2;
        
        [self addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}



#pragma mark-商品价格
-(UILabel *)PriceLabel
{
    if (_priceLabel == nil)
    {
       UILabel * label = [[UILabel alloc]init];
        
        label.text = @"单价: ¥1900.00";
        
        label.textColor = [UIColor redColor];
        
        label.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:label];
        
        _priceLabel = label;
    }
    return _priceLabel;
}


#pragma mark-商品参数
-(UIButton *)ParameterLabel
{
    if (_parameterBtn == nil)
    {
         UIButton * btn = [[UIButton alloc]init];
        
        [btn setTitle:@"网络类型:联通4G 机身颜色:亮白 套餐类型:官方标配 机身内存:16GB" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        
        btn.titleLabel.numberOfLines = 0;
        
        [btn addTarget:self action:@selector(ParameterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        _parameterBtn = btn;
        
    }
    return _parameterBtn;
}

#pragma mark- 商品参数按钮响应方法
-(void)ParameterBtnClick:(UIButton *)sender
{
    _specScrollView.hidden = NO;
    
    _specTableView.scrollEnabled = NO;
    
    NSLog(@"这是产品参数");
}

#pragma mark-减少商品
-(UIButton *)ReduceBtn
{
    if (_reduceBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]init];
        
        btn.tag = 201;
        
        btn.backgroundColor = [UIColor whiteColor];

        [btn setTitle:@"-" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:25];
        
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        btn.layer.borderWidth = 1;
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(ReduceBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        _reduceBtn = btn;
    }
    return _reduceBtn;
}

#pragma mark-商品数量
-(UILabel *)NumberLabel
{
    if (_numberLabel == nil)
    {
        UILabel * label = [[UILabel alloc]init];
        
        label = [[UILabel alloc]init];
            
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _numberLabel = label;
        
    }
    return _numberLabel;
}

#pragma mark-增加商品
-(UIButton *)AddBtn
{
    if (_addBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]init];
        
        btn.tag = 202;
        
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setTitle:@"+" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:25];
        
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        btn.layer.borderWidth = 1;
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 
        [btn addTarget:self action:@selector(AddBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        _addBtn = btn;
    }
    return _addBtn;
}

#pragma mark-接受数据填充控件
-(void)AddTheValue:(ShoppingCartModel *)goodModel TableView:(UITableView *)tableView
{
    
    _specTableView = tableView;
    
    /*******************对Cell进行赋值*********************/
    
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[goodModel imageName]]];
    
    
    _titleLabel.text = [goodModel goodsTitle];
    
    
    _priceLabel.text =[NSString stringWithFormat:@"¥ %@",[goodModel goodsPrice]];
    
    
    _numberLabel.text = [NSString stringWithFormat:@"%d",[goodModel goodsNnm]];
    
    
    if ([goodModel selectState])
    {
        _selectState = YES;
        
        _selectBtn.backgroundColor = [UIColor redColor];
    }
    else
    {
        _selectState = NO;
        
        _selectBtn.backgroundColor = [UIColor lightGrayColor];
    }
    
    
    /*******************对Cell进行赋值*********************/
    
    
    /******************对规格模板进行赋值********************/
    
    _specArr = @[
                  @{
                      @"type":@"颜色",
                      
                      @"colcor":@[@"红色",@"黄色",@"白色",@"绿色",@"黑色",@"灰色",@"红色",@"黄色",@"白色",@"绿色",@"黑色",@"灰色"]
                      
                      },
                  @{
                      @"type":@"套餐",
                      
                      @"colcor":@[@"官方标配",@"套餐一",@"套餐二",@"套餐三",@"套餐四",@"套餐五"]
                      
                      },
                  @{
                      @"type":@"颜色",
                      
                      @"colcor":@[@"红色",@"黄色",@"白色",@"绿色",@"黑色",@"灰色"]
                      
                      },
                  @{
                      @"type":@"套餐",
                      
                      @"colcor":@[@"官方标配",@"套餐一",@"套餐二",@"套餐三",@"套餐四",@"套餐五"]
                      
                      },
                  

                  ];
    
    /******************对规格模板进行赋值********************/
    
    //产品规格选择
    [self SpecScrollView];

}

#pragma mark-增加商品按钮的响应方法
-(void)ReduceBtnCLick:(UIButton *)btn
{
    [self.delegate btnClick:self andFlay:(int)btn.tag];
}

#pragma mark-减少商品按钮的响应方法
-(void)AddBtnClick: (UIButton *)btn
{
    [self.delegate btnClick:self andFlay:(int)btn.tag];
}

/***********************************
 *
 * 作用:单个商品的规格选择
 *
 ************************************/

-(UIScrollView *)SpecScrollView
{
    if (_specScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(162, 5, kCellWidth-167, 140)];
        
        scrollView.hidden = YES;
        
        scrollView.bounces = NO;
        
//        scrollView.showsVerticalScrollIndicator = NO;
        
        scrollView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:scrollView];
        
        _specScrollView = scrollView;
        
        
        //取消按钮
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_specScrollView.frame.size.width*3/4, YHeight, _specScrollView.frame.size.width/4, _specScrollView.frame.size.height/6)];
        
        [btn setTitle:@"X" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(SpecButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_specScrollView addSubview:btn];
        
         h = _specScrollView.frame.size.height/6 + 5; //用来控制button距离父视图的高
        
        for (int i = 0; i < _specArr.count; i ++)
        {
             //规格类别
            UILabel *specTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, YHeight, _specScrollView.frame.size.width/3, _specScrollView.frame.size.height/6)];
            
            specTypeLabel.text = _specArr[i][@"type"];
            
//            specTypeLabel.text = @"颜色:";
            
            specTypeLabel.textAlignment = NSTextAlignmentCenter;
            
            specTypeLabel.font = kLabelFont;
            
            [_specScrollView addSubview:specTypeLabel];
            
            
            
            YHeight +=specTypeLabel.frame.size.height;
            
            CGFloat w = 0; //保存前一个button的宽以及前一个button距离屏幕的距离
            
//            [_specArr[i][@"colcor"]count]
            
            for (int s = 0; s < [_specArr[i][@"colcor"]count]; s ++)
            {
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
                
                button.tag = 100 +i ;
                
                button.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.4];
                
                button.layer.cornerRadius = 2;
                
                [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
                
                [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                
                //计算文字的的大小
                NSString *str = _specArr[i][@"colcor"][s];
                
//                NSString *str = @"蓝色";

                NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
                
                CGFloat length = [str boundingRectWithSize:CGSizeMake(_specScrollView.frame.size.width, 20000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
                
                //为button赋值
                [button setTitle:str forState:UIControlStateNormal];
                
                //设置button的frame
                button.frame = CGRectMake(7 + w, h, length +15, 30);
                
                /*************************************
                 *
                 * 当button的位置超出屏幕边缘时换行
                 *
                 *************************************/
                
                if (7 + w +length +15 >_specScrollView.frame.size.width )
                {
                    w = 0;
                    
                    h = h +button.frame.size.height + 5; //距离父视图也变化
                    
                    button.frame = CGRectMake(7 + w, h, length + 15, 30); //重设button 的frame
                }
                
                w = button.frame.size.width + button.frame.origin.x;
                
                [_specScrollView addSubview:button];
            }
            
            YHeight += h + 10;
            
            h += h + _specScrollView.frame.size.height/6;
            
            NSLog(@"%f",h);
            
            NSLog(@"%f",YHeight);
        }
        
    }
    
    
   NSLog(@"%f",YHeight);
    
   _specScrollView.contentSize = CGSizeMake(_specScrollView.frame.size.width, YHeight);
    
    return _specScrollView;
}


#pragma mark-属性模块隐藏按钮
-(void)SpecButtonClick
{
    _specScrollView.hidden = YES;
    
    _specTableView.scrollEnabled = YES;
}

#pragma mark-属性按钮的响应方法
-(void)handleClick: (UIButton *)sender
{
    NSLog(@"你选中我了!");
}


@end
