//
//  CommodityParameters.m
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CommodityParameters.h"
#import "CommodityParametersCell.h"

@interface CommodityParameters()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CommodityParameters

-(void)addCommodityParameters:(NSArray *)information
{
    _commodDataArr = information;

    //标题"产品参数"
    [self Title];
    
    //参数详情
    [self Content];
    
}

#pragma mark-标题
-(UILabel *)Title
{
    if (_title == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/10)];
        
        label.backgroundColor = [UIColor lightGrayColor];
        
        label.text = @"产品参数";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        _title = label;
    }
    return _title;
}
#pragma mark-详情
-(UITableView *)Content
{
    if (_content == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, self.frame.size.height/10, self.frame.size.width, self.frame.size.height*7.5/10)];
        
        table.delegate = self;
        
        table.dataSource = self;
        
        table.bounces = NO;
        
        table.showsVerticalScrollIndicator = NO;
        
        [self addSubview:table];
        
        _content = table;
    }
    return _content;
}


#pragma mark- UITableView datasource 和 delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   
    if (![_commodDataArr isEqual:@""])
    {
        return _commodDataArr.count;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _commodDataArr[indexPath.row];
    
    return cell;
}


@end
