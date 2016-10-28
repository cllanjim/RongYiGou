//
//  TransactionQueryView.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TransactionQueryView.h"
#import "TransactionQueryCell.h"

@interface TransactionQueryView()
{
    NSDictionary *tradeTitleDic;
    
    NSArray *tradeContentArr;
}
@end

@implementation TransactionQueryView

-(void)addTitle:(NSDictionary *)title Content:(NSArray *)content
{
    tradeTitleDic = title;
    
    tradeContentArr = content;
    
    NSLog(@"%@",tradeContentArr);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self addSubview:tableView];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tradeContentArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TransactionQueryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TransactionQueryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString *time = [NSString timeConversion:tradeContentArr[indexPath.row][@"time"]];
    
    cell.rechTime.text =time;
    
    cell.rechName.text = tradeContentArr[indexPath.row][@"note"];
    
    cell.rechType.text = tradeContentArr[indexPath.row][@"statu"];
    
    cell.rechAmount.text = tradeContentArr[indexPath.row][@"price"];
    
    cell.rechState.text = tradeContentArr[indexPath.row][@"status_text"];
  
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.frame.size.height/20;
}
#pragma mark-添加头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 69 + self.frame.size.height/20, self.frame.size.width, self.frame.size.height/20)];
    
    view.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1];
    
    [tableView addSubview:view];
    
    //创建时间
    UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width/6, view.frame.size.height)];
    
    time.text = [tradeTitleDic objectForKey:@"time"];
    
    time.textAlignment = NSTextAlignmentCenter;
    
    time.font = kLabelFont;
    
    [view addSubview:time];
    
    
    //名称/交易号
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width/6, 0, view.frame.size.width/3, view.frame.size.height)];
    
    name.text = [tradeTitleDic objectForKey:@"name"];
    
    name.textAlignment = NSTextAlignmentCenter;
    
    name.font = kLabelFont;
    
    [view addSubview:name];
    
    
    //对方
    UILabel *person = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width/2, 0, view.frame.size.width/6, view.frame.size.height)];
    
    person.text = [tradeTitleDic objectForKey:@"type"];
    
    person.textAlignment = NSTextAlignmentCenter;
    
    person.font = kLabelFont;
    
    [view addSubview:person];
    
    
    //金额
    UILabel *amount = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width*2/3, 0, view.frame.size.width/6, view.frame.size.height)];
    
    amount.text = [tradeTitleDic objectForKey:@"amount"];
    
    amount.textAlignment = NSTextAlignmentCenter;
    
    amount.font = kLabelFont;
    
    [view addSubview:amount];
    
    
    //状态
    UILabel *state = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width*5/6, 0, view.frame.size.width/6, view.frame.size.height)];
    
    state.text = [tradeTitleDic objectForKey:@"state"];
    
    state.textAlignment = NSTextAlignmentCenter;
    
    state.font = kLabelFont;
    
    [view addSubview:state];
    
    return view;
}


@end
