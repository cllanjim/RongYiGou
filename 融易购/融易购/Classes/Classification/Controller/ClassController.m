//
//  ClassController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ClassController.h"
#import "ClassGoodsView.h"

@interface ClassController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *tableViewContentArray;
    
    float HeightY;
    
    float HeightY0;
    
    float HeightY1;
    
    float HeightY2;
    
    float HeightY3;
    
    
}

@property (nonatomic,strong)UITableView *navigationTable;

@property (nonatomic,strong)UIScrollView *contentScroll;

@property (nonatomic,strong)UIScrollView *contentScroll1;

@property (nonatomic,strong)UIScrollView *contentScroll2;

@property (nonatomic,strong)UIScrollView *contentScroll3;

@end

@implementation ClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;

    self.view.backgroundColor = [UIColor whiteColor];
    
    _classGoodsDataArr = [NSMutableArray arrayWithCapacity:4];
    
    _GoodsDataMutableArr0 = [NSMutableArray arrayWithCapacity:5];
    
    _GoodsDataMutableArr1 = [NSMutableArray arrayWithCapacity:5];
    
    _GoodsDataMutableArr2 = [NSMutableArray arrayWithCapacity:5];
    
    _GoodsDataMutableArr3 = [NSMutableArray arrayWithCapacity:5];

    
    //0.获取数据
    [self ClassGetData];
    
    //1.添加导航条
    [self ClassNavBar];
    
    //2.导航类别
    [self NavigationTable];
    
    //3.内容详情
    [self ContentTable];
    
    [self ContentScroll1];
    
    [self ContentScroll2];
    
    [self ContentScroll3];
    
    _contentScroll.contentSize = CGSizeMake(0, HeightY0);
    
    _contentScroll1.contentSize = CGSizeMake(0, HeightY1);
    
    _contentScroll2.contentSize = CGSizeMake(0, HeightY2);
    
    _contentScroll3.contentSize = CGSizeMake(0, HeightY3);
    
    
}

#pragma mark-获取数据
-(void)ClassGetData
{

    _tableArrayClass = [NSArray requestWithPath:@"cat_list.php" params:nil method:@"POST"];
    
//    NSLog(@"%@",tableArrayClass);
    
    _tableArrayClass =_tableArrayClass[0][@"content"][@"response"][@"cat_list"];
    
    
    for (NSDictionary *dict in _tableArrayClass)
    {
        if ([dict[@"parentid"] isEqual:@"0"])
        {
            [_classGoodsDataArr addObject:dict];
        }
    }
    
    NSLog(@"%@",_tableArrayClass);
    
    for (int i = 0; i < _tableArrayClass.count; i ++)
    {
    
        if ([_tableArrayClass[i][@"parentid"]isEqual:@"1000"])
        {
            [_GoodsDataMutableArr0 addObject:_tableArrayClass[i]];
        }
        else if ([_tableArrayClass[i][@"parentid"]isEqual:@"1001"])
        {
            [_GoodsDataMutableArr1 addObject:_tableArrayClass[i]];
        }
        else if ([_tableArrayClass[i][@"parentid"]isEqual:@"1002"])
        {
           [_GoodsDataMutableArr2 addObject:_tableArrayClass[i]];
        }
        else if ([_tableArrayClass[i][@"parentid"]isEqual:@"1003"])
        {
           [_GoodsDataMutableArr3 addObject:_tableArrayClass[i]];
        }
        
        
    }
    
     NSLog(@"---1---%@",_GoodsDataMutableArr0);
     NSLog(@"---2---%@",_GoodsDataMutableArr1);
     NSLog(@"---3---%@",_GoodsDataMutableArr2);
     NSLog(@"---4---%@",_GoodsDataMutableArr3);
     NSLog(@"---One---%@",_classGoodsDataArr);
    
}

#pragma mark-添加导航条
-(NavigationBar *)ClassNavBar
{
    if (_classNavBar == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
    
        [bar addNavigationBar:@"分类" NavigationController:nil];
        
        [self.view addSubview:bar];
        
        bar.backButton.hidden = YES;
        
        bar.titleLabel.textColor = [UIColor blackColor];
        
        _classNavBar = bar;
    }
    return _classNavBar;
}



#pragma mark-商品导航栏
-(UITableView *)NavigationTable
{
    if (_navigationTable == nil)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 69,kWidth/5,kHeight-90)];
        
        table.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        table.tag = 111;
        
        table.delegate = self;
        
        table.dataSource = self;
        
        table.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:table];
    }
    return _navigationTable;
}


#pragma mark-手机通讯
-(UIScrollView *)ContentTable
{
    
    tableViewContentArray = _GoodsDataMutableArr0;
    
    if (_contentScroll == nil)
    {
        UIScrollView *table  = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth/5, 69,kWidth*4/5,kHeight-100)];
        
        table.bounces = NO;
        
        table.showsVerticalScrollIndicator = NO;
        
        table.tag = 200;
        
        [self.view addSubview:table];
        
        _contentScroll = table;
    }

    [self ClassGoodsView:_contentScroll Array:_GoodsDataMutableArr0];
    
    return _contentScroll;
}

#pragma mark-手机配件展示图
-(UIScrollView *)ContentScroll1
{
     tableViewContentArray = _GoodsDataMutableArr1;
    
    if (_contentScroll1 == nil)
    {
        UIScrollView *scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth/5, 69,kWidth*4/5,kHeight-100)];
        
        scrollView.bounces = NO;
        
        scrollView.hidden = YES;
        
        scrollView.showsVerticalScrollIndicator = NO;
        
        scrollView.tag = 201;
        
        [self.view addSubview:scrollView];
        
        _contentScroll1 = scrollView;
    }
    
    [self ClassGoodsView:_contentScroll1 Array:_GoodsDataMutableArr1];
    
    return _contentScroll1;
}

#pragma mark-智能设备
-(UIScrollView *)ContentScroll2
{
    
     tableViewContentArray = _GoodsDataMutableArr2;
    
    if (_contentScroll2 == nil)
    {
        UIScrollView *scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth/5, 69,kWidth*4/5,kHeight-100)];
        
        scrollView.bounces = NO;
        
        scrollView.hidden = YES;
        
        scrollView.showsVerticalScrollIndicator = NO;
        
         scrollView.tag = 202;
        
        [self.view addSubview:scrollView];
        
        _contentScroll2 = scrollView;
    }
    
    [self ClassGoodsView:_contentScroll2 Array:_GoodsDataMutableArr2];
    
    return _contentScroll2;
}
#pragma mark-卡包业务
-(UIScrollView *)ContentScroll3
{
     tableViewContentArray = _GoodsDataMutableArr3;
    
    if (_contentScroll3 == nil)
    {
        UIScrollView *scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth/5, 69,kWidth*4/5,kHeight-100)];
        
        scrollView.bounces = NO;
        
        scrollView.hidden = YES;
        
        scrollView.showsVerticalScrollIndicator = NO;
        
         scrollView.tag = 203;
        
        [self.view addSubview:scrollView];
        
        _contentScroll3 = scrollView;
    }
    
    [self ClassGoodsView:_contentScroll3 Array:_GoodsDataMutableArr3];
    
    return _contentScroll3;
}

#pragma mark-商品展示View
-(ClassGoodsView *)ClassGoodsView:(UIScrollView *)scrollView Array:(NSArray*)array
{

    HeightY = 0;
    
    tableViewContentArray = array;
    
    int index;
    
    for (int i = 0; i < tableViewContentArray.count; i ++)
    {
        
        NSLog(@"%@",tableViewContentArray[i][@"brand"]);
        
        
        NSArray *ContentArr;
        
        if (![tableViewContentArray[i][@"brand"]isEqual:@""])
        {
            ContentArr = tableViewContentArray[i][@"brand"];
        }
        else
        {
            ContentArr = nil;
        }

        if ([ContentArr count]%3<3 && [ContentArr count]%3>0)
        {
            index = (int)[ContentArr count]/3 + 1;
        }
        else
        {
            index = (int)[ContentArr count]/3 ;
        }
        
        float height = 55 +index *73;
        
        NSLog(@"%f",height);
        
        ClassGoodsView *view = [[ClassGoodsView alloc]initWithFrame:CGRectMake(0, HeightY,_contentScroll.frame.size.width, height)];
        
        view.backgroundColor = [UIColor colorWithRed:231/255.0 green:235/255.0 blue:239/255.0 alpha:1];;
        
        [view addViewInformation:ContentArr ContentStr:tableViewContentArray[i][@"catid"] NavController:self.navigationController];
        
        [scrollView addSubview:view];
        
        [view.mainTitle setTitle:tableViewContentArray[i][@"cat"] forState:UIControlStateNormal ];
        
        HeightY += view.frame.size.height + 10;
        
        _classGoodsView = view;
        
        switch (scrollView.tag)
        {
            case 200:
            {
                HeightY0 = HeightY;
            }
                break;
            case 201:
            {
                HeightY1 = HeightY;
            }
                break;
            case 202:
            {
                HeightY2 = HeightY;
            }
                break;
            case 203:
            {
                HeightY3 = HeightY;
            }
                break;
                
            default:
                break;
        }
        
    }
    
    return _classGoodsView;
}

#pragma mark-tableView 的 delegate 和 datasource 方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        return 44;
    }
    return 0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 111)
    {
        return _classGoodsDataArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        static NSString *CellIdentifer = @"cell1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
        }
        
        cell.textLabel.text = _classGoodsDataArr[indexPath.row][@"cat"];
        
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        cell.layer.borderWidth = 0.4;
        
        return cell;
    }
    return 0;

}


#pragma mark-设置Cell的背景图片
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 111)
    {
        
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
}


#pragma mark-cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            NSLog(@"%@",_GoodsDataMutableArr0);
            
            _contentScroll.hidden = NO;
            
            _contentScroll1.hidden = YES;
            
            _contentScroll2.hidden = YES;
            
            _contentScroll3.hidden = YES;
        
        }
            break;
        case 1:
        {
            NSLog(@"%@",_GoodsDataMutableArr1);
            
            _contentScroll.hidden = YES;
            
            _contentScroll1.hidden = NO;
            
            _contentScroll2.hidden = YES;
            
            _contentScroll3.hidden = YES;

            
        }
            break;
        case 2:
        {
            NSLog(@"%@",_GoodsDataMutableArr2);
            
            _contentScroll.hidden = YES;
            
            _contentScroll1.hidden = YES;
            
            _contentScroll2.hidden = NO;
            
            _contentScroll3.hidden = YES;

        }
            break;
        case 3:
        {
            NSLog(@"%@",_GoodsDataMutableArr3);
            
            _contentScroll.hidden = YES;
            
            _contentScroll1.hidden = YES;
            
            _contentScroll2.hidden = YES;
            
            _contentScroll3.hidden = NO;

        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
