//
//  TransactionDetailsController.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TransactionDetailsController.h"
#import "TransactionQueryView.h"
#import "TransactionQueryCell.h"

@interface TransactionDetailsController ()
{
    UIButton *tradeClasssBtn;
    
    NSArray *tradeClasssArray;
    
    UIButton *tradeStateBtn;
    
    NSArray *tradeStateArray;
    
    UIButton *_selectBtn;
    
    UIButton *_selectBtn1;
    
    NSDictionary *tradeTitleDic;
    
    UIButton *selectClassBtn;
    
    UIButton *selectTypeBtn;
}
@end

@implementation TransactionDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    tradeClasssArray = @[@"全部",@"付款",@"收款"];
    
    tradeStateArray = @[@"全部",@"未付款",@"未发货",@"未收货",@"成功",@"失败"];
    
    selectTypeBtn = [[UIButton alloc]init];
    
    selectClassBtn = [[UIButton alloc]init];
    
    [selectClassBtn setTitle:@"全部" forState:UIControlStateNormal];
    
    [selectTypeBtn setTitle:@"全部" forState:UIControlStateNormal];

    
    //获取数据
    [self GetData];
    
    //添加导航条
    [self TranDetailNAvBar];
    
    //添加内容选项卡
    [self TranDetailView];
    
    //实体内容展示
    [self TranDetailTableView];
}

#pragma mark-获取数据
-(void)GetData
{
    _tranGetDataArr = [NSArray requestWithPath:@"pay_detail.php" params:@{@"content":@{@"request":@{@"want":@"record",@"uid":_UserId}}} method:@"POST"];

    _tranGetDataArr = _tranGetDataArr[0][@"content"][@"response"][@"de"][@"list"];
    
    NSLog(@"%@",_tranGetDataArr);
    
    
}


#pragma mark-添加导航条
-(NavigationBar *)TranDetailNAvBar
{
    if (_tranDetailNAvBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"交易明细" NavigationController:_tranDetailNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _tranDetailNAvBar = navBar;
    }
    return _tranDetailNAvBar;
}

#pragma mark-添加内容选项卡
-(UIView *)TranDetailView
{
    if (_tranDetailView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight/10)];
        
        view.backgroundColor = [UIColor colorWithRed:241/255.0 green:249/255.0 blue:255/255.0 alpha:1];
        
        [self.view addSubview:view];
        
        _tranDetailView = view;
    }
    
    //交易分类
    [self TradeClasssBtn];
    
    //交易状态
    [self TradeStateBtn];
    
    return _tranDetailView;
}

#pragma mark-交易分类
-(UIButton *)TradeClasssBtn
{
    if (tradeClasssBtn == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _tranDetailView.frame.size.width/6, _tranDetailView.frame.size.height/2)];
        
        label.text = @"交易分类:";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:11];
        
        [_tranDetailView addSubview:label];
        
        
        for (int i = 0; i < tradeClasssArray.count ; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_tranDetailView.frame.size.width/6 + i *_tranDetailView.frame.size.width*5/42, 0, _tranDetailView.frame.size.width*5/42, _tranDetailView.frame.size.height/2)];
            
            btn.tag = 100 +i;
            
            [btn setTitle:[tradeClasssArray objectAtIndex:i] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(TradeClasssBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (btn.tag == 100)
            {
                btn.selected = YES;
                
                _selectBtn = btn;
            }
            
            [_tranDetailView addSubview:btn];
            
            tradeClasssBtn = btn;
        }
    }
    return tradeClasssBtn;
}

#pragma mark-交易分类按钮的响应方法
-(void)TradeClasssBtnClick: (UIButton *)sender
{
    if (sender !=_selectBtn)
    {
        _selectBtn.selected = NO;
        
        _selectBtn = sender;
    }
    
    _selectBtn.selected = YES;
    
    
    [selectClassBtn setTitle:sender.currentTitle forState:UIControlStateNormal];
    
    NSLog(@"%@",selectClassBtn.currentTitle);
    
    //获取新数据

    _tranClassStr = sender.currentTitle;
    
    _tranTypeStr = selectTypeBtn.currentTitle;
    
    NSLog(@"%@----%@",_tranClassStr,_tranTypeStr);
    
    
    if ([sender.currentTitle isEqual:@"全部"])
    {
        _tranClassStr = @"";
    }
    else if ([sender.currentTitle isEqual:@"付款"])
    {
        _tranClassStr = @"1";
    }
    else if([sender.currentTitle isEqual:@"收款"])
    {
        _tranClassStr = @"2";
    }
    
    
    if ([selectTypeBtn.currentTitle isEqual:@"全部"])
    {
        _tranTypeStr = @"";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未付款"])
    {
        _tranTypeStr = @"1";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未发货"])
    {
        _tranTypeStr = @"2";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未收货"])
    {
        _tranTypeStr = @"3";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"成功"])
    {
        _tranTypeStr = @"4";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"失败"])
    {
        _tranTypeStr = @"10";
    }
    
    
#warning mark-刷新无效
    
    _tranGetDataArr = [NSArray requestWithPath:@"pay_detail.php" params:@{@"content":@{@"request":@{@"want":@"record",@"uid":_UserId,@"type":_tranClassStr,@"status":_tranTypeStr}}} method:@"POST"];
    
    NSLog(@"%@",_tranGetDataArr);
    
    _tranGetDataArr = _tranGetDataArr[0][@"content"][@"response"][@"de"][@"list"];
    
    [_tranDetailTableView reloadData];
    
    
}


#pragma mark-交易状态
-(UIButton *)TradeStateBtn
{
    
    if (tradeStateBtn == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _tranDetailView.frame.size.height/2, _tranDetailView.frame.size.width/6, _tranDetailView.frame.size.height/2)];
        
        label.text = @"交易状态:";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:11];
        
        [_tranDetailView addSubview:label];
        
        
        for (int i = 0; i < tradeStateArray.count ; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_tranDetailView.frame.size.width/6 + i *_tranDetailView.frame.size.width*5/42, _tranDetailView.frame.size.height/2, _tranDetailView.frame.size.width*5/42, _tranDetailView.frame.size.height/2)];
            
            btn.tag = 100+i;
            
            [btn setTitle:[tradeStateArray objectAtIndex:i] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            
            if (btn.tag == 100)
            {
                btn.selected = YES;
                
                _selectBtn1 = btn;
            }

            
            [btn addTarget:self action:@selector(TradeStateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [_tranDetailView addSubview:btn];
            
            tradeStateBtn = btn;
        }

    }
    return tradeStateBtn;
}

#pragma mark-交易状态按钮的响应方法
-(void)TradeStateBtnClick: (UIButton *)sender
{
    if (sender !=_selectBtn1)
    {
        _selectBtn1.selected = NO;
        
        _selectBtn1 = sender;
    }
    
    _selectBtn1.selected = YES;
    
    [selectTypeBtn setTitle:sender.currentTitle forState:UIControlStateNormal];
    
    NSLog(@"%@",selectTypeBtn);
    
    _tranClassStr = selectClassBtn.currentTitle;
    
    _tranTypeStr = sender.currentTitle;
    
    NSLog(@"%@----%@",_tranClassStr,_tranTypeStr);
    
     /*
      
    if ([selectClassBtn.currentTitle isEqual:@"全部"])
    {
        _tranClassStr = @"";
    }
    else if ([sender.currentTitle isEqual:@"付款"])
    {
        _tranClassStr = @"1";
    }
    else if([sender.currentTitle isEqual:@"收款"])
    {
        _tranClassStr = @"2";
    }
    
    
    if ([sender.currentTitle isEqual:@"全部"])
    {
        _tranTypeStr = @"";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未付款"])
    {
        _tranTypeStr = @"1";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未发货"])
    {
        _tranTypeStr = @"2";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"未收货"])
    {
        _tranTypeStr = @"3";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"成功"])
    {
        _tranTypeStr = @"4";
    }
    else if ([selectTypeBtn.currentTitle isEqual:@"失败"])
    {
        _tranTypeStr = @"10";
    }

   */
    
    
    
    
}


-(UITableView *)TranDetailTableView
{
    tradeTitleDic = @{@"time":@"创建时间",
                     @"name":@"名称|交易号",
                     @"type":@"对方",
                     @"amount":@"金额(元)",
                     @"state":@"状态"
                     };
    
    if (_tranDetailTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69 + kHeight/10, kWidth, kHeight*9/10-69-44)];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
    }
    return _tranDetailTableView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tranGetDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TransactionQueryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TransactionQueryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    if (![_tranGetDataArr[indexPath.row][@"time"] isEqual:@""])
    {
         NSString *time = [NSString timeConversion:_tranGetDataArr[indexPath.row][@"time"]];
        
         cell.rechTime.text =time;
    }
    
   
    if (![_tranGetDataArr[indexPath.row][@"note"]isEqual:@""])
    {
        cell.rechName.text = _tranGetDataArr[indexPath.row][@"note"];
    }
    
    
    if (![_tranGetDataArr[indexPath.row][@"name"]isEqual:@""])
    {
        cell.rechType.text = _tranGetDataArr[indexPath.row][@"name"][@"real_name"];
    }
    
    
    if (![_tranGetDataArr[indexPath.row][@"price"]isEqual:@""])
    {
        cell.rechAmount.text = _tranGetDataArr[indexPath.row][@"price"];
    }
    
    
    if (![_tranGetDataArr[indexPath.row][@"status_text"]isEqual:@""])
    {
        cell.rechState.text = _tranGetDataArr[indexPath.row][@"status_text"];
    }

    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height/20;
}
#pragma mark-添加头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 69 + self.view.frame.size.height/20, self.view.frame.size.width, self.view.frame.size.height/20)];
    
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






- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

@end
