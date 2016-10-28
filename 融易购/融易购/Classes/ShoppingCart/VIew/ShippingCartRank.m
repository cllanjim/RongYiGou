//
//  ShippingCartRank.m
//  RongYiGou
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShippingCartRank.h"

#define kRackIconHeight 80

@implementation ShippingCartRank

-(void)addGoodsRank:(NSString *)price Stock:(NSString *)stock Icon:(NSString *)image Spec:(NSArray *)spec
{
    
    _rackPrice = price;
    
    _rackStock = stock;
    
    _rackIconImage = image;
    
    _rackDataArr = spec;
    
    
    //头像
    [self RackIconImageView];
    
    //价格
    [self RackPriceLabel];
    
    //库存
    [self RackStockLabel];
    
    //已选配置
    [self RackRackLabel];
    
    //配置选择
    [self RackRackTableView];
    
    //控件适配
    [self Adaptation];
    
}

#pragma mark-Icon 展示
-(UIImageView *)RackIconImageView
{
    if (_rackIconImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kRackIconHeight, kRackIconHeight)];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:_rackPrice]];
        
        imageView.backgroundColor = [UIColor greenColor];
        
        [self addSubview:imageView];
    }
    return _rackIconImageView;
}
#pragma mark-商品价格展示
-(UILabel *)RackPriceLabel
{
    if (_rackPriceLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kRackIconHeight + 20, 10, kCellWidth/3, kRackIconHeight/3-10)];
        
        label.text =[NSString stringWithFormat:@"¥ %@",_rackPrice];

        
        [self addSubview:label];
    }
    return _rackPriceLabel;
}

#pragma mark-商品库存展示
-(UILabel *)RackStockLabel
{
    if (_rackStockLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kRackIconHeight + 20, kRackIconHeight/3, kCellWidth/3, kRackIconHeight/3)];
        
        label.text =[NSString stringWithFormat:@"库存%@件",_rackStock];
    
        [self addSubview:label];
    }
    return _rackStockLabel;
}

#pragma mark-商品已选配置展示
-(UILabel *)RackRackLabel
{
    if (_rackRackLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kRackIconHeight + 20, kRackIconHeight*2/3, kCellWidth-kRackIconHeight, kRackIconHeight/3)];
        
        label.text = @"请选择";
        
        [self addSubview:label];
    }
    return _rackRackLabel;
}
#pragma mark-商品待选配置展示
-(UITableView *)RackRackTableView
{
    if (_rackRackTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kRackIconHeight + 10, kCellWidth, self.frame.size.height-kRackIconHeight-40)];
        
        tableView.dataSource = self;
        
        tableView.delegate = self;
        
        tableView.bounces = NO;
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:tableView];
    }
    return _rackRackTableView;
}

#pragma mark-DataSource 和 Delegate 方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rackDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil) {
         
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:0.1];
    }
    
    
    NSLog(@"%@",_rackDataArr);
    
    UILabel *specName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.size.width/20, 10, cell.frame.size.width/5, 100/4)];
    
    specName.text = _rackDataArr[indexPath.row][@"sepc_name"];
    
    specName.backgroundColor = kBgColor;
    
    specName.font = kLabelFont;
    
    specName.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:specName];
    
    
    for (int i = 0; i < [_rackDataArr[indexPath.row][@"type"]count]; i ++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width/20  + i *(cell.frame.size.width/5), 100/2,cell.frame.size.width/6, 100/3)];
        
        [btn setTitle:_rackDataArr[indexPath.row][@"type"][i][@"name"] forState:UIControlStateNormal];
        
        btn.tag = 100 + i;
        
        [btn setBackgroundImage:[UIImage imageNamed:@"goodsSelect.png"] forState:UIControlStateSelected];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(RackSpecBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.backgroundColor = kBgColor;
        
        [cell addSubview:btn];
    }

    return cell;

}
#pragma mark-产品规格的选中
-(void)RackSpecBtnClick:(UIButton *)sender
{
    if (sender != _selectBtn)
    {
        _selectBtn.selected = NO;
        
        _selectBtn = sender;
    }
    _selectBtn.selected = YES;

//    for (NSDictionary *dict in _selectionDataDic[@"product_extfiled"][@"matel"])
//    {
//        if ([dict[@"setmeal"]isEqualToString:sender.currentTitle])
//        {
//            _specId = dict[@"id"];
//            
//            _stock.text = [NSString stringWithFormat:@"库存:%@",dict[@"stock"]];
//            
//            _price.text = dict[@"price"];
//            
//            _selectInformation.text = [NSString stringWithFormat:@"已选: %@",dict[@"setmeal"]];
//            
//            _productId = dict[@"pid"];
//            
//        }
//    }
}


#pragma mark-控件适配
-(void)Adaptation
{
    //价格
    [_rackPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(5);
        
        make.left.equalTo(_rackIconImageView.mas_right).offset(5);
        
        make.width.equalTo(@(kCellWidth/3));
        
        make.height.equalTo(@(kRackIconHeight/3));
        
        
    }];
    
    //库存
    
    [_rackStockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo (_rackPriceLabel.mas_bottom).offset(2);
        
        make.left.equalTo(_rackIconImageView.mas_right).offset(5);
        
        make.width.equalTo(@(kCellWidth/3));
        
        make.height.equalTo(@(kRackIconHeight/3));
        
    }];
    
    //已选配置
    [_rackRackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_rackStockLabel.mas_bottom).offset(2);
        
        make.left.equalTo(_rackIconImageView.mas_right).offset(5);
        
        make.width.equalTo(@(kCellWidth/3));
        
        make.height.equalTo(@(kRackIconHeight/3));
        
    }];
    
    //选择配置
    [_rackRackTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_rackIconImageView.mas_bottom).offset(5);
        
        make.left.equalTo(self).offset(0);
        
        make.bottom.equalTo(self).offset(-40);
        
        make.right.equalTo(self).offset(0);
        
    }];
    
}

@end
