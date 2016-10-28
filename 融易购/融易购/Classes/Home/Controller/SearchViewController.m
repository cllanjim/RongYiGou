//
//  SearchViewController.m
//  RongYiGou
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SearchViewController.h"
#import "GoodListController.h"

@interface SearchViewController ()
{
    UIButton *_backBnt;  //返回按钮
    
    UIButton *_searchBnt;  //搜索按钮
    
    UIView *_popularView;  //热门推荐底层View
    
    UILabel *_titleLabel;
    
    UIButton *_titleBtn;
    
    NSArray *arr;
    
    NSMutableArray *MutableArr;
}

@property(nonatomic,strong)UITextField *searchTextfield;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MutableArr = [NSMutableArray arrayWithCapacity:5];
    
    //获取数据
    [self GetData];
    
    //返回按钮
    [self BackBtn];
    
    //搜索框
    [self SearchTextfield];
    
    //搜索按钮
    [self SearchButton];
    
    //热门推荐
    [self PopularRecommendation];
    
}

#pragma mark-获取数据
-(void)GetData
{
    //获取关键字
    arr = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"hotkey"}}} method:@"POST"];
    
    
    NSLog(@"%@",arr);
    
    arr = arr[0][@"content"][@"response"][@"key_list"];
    
    for (NSDictionary *dict in arr)
    {
        NSLog(@"%@",dict[@"value"]);
        
        [MutableArr addObject:dict[@"value"]];
    }
    

}


#pragma mark-返回上一页按钮
-(UIButton *)BackBtn
{
    if (_backBnt == nil)
    {
        UIButton *bnt = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, kWidth/8, 30)];
        
        bnt.backgroundColor = kBgColor;
        
        [bnt setTitle:@"<" forState:UIControlStateNormal];
        
        [bnt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self.view addSubview:bnt];
        
        [bnt addTarget:self action:@selector(BackButtonClick) forControlEvents:UIControlEventTouchDragInside];
        
        _backBnt = bnt;
    }
    return _backBnt;
}

#pragma mark-返回按钮的响应方法
-(void)BackButtonClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark-搜索框

-(UITextField *)SearchTextfield
{
    if (_searchTextfield == nil)
    {
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/8, 20, kWidth*5/8, 30)];
        
        textfield.borderStyle = UITextBorderStyleRoundedRect;
        
        textfield.placeholder = @"搜索商品";
        
        textfield.textColor = [UIColor lightGrayColor];
        
        textfield.font = kLabelFont;
        
        [self.view addSubview:textfield];
        
        _searchTextfield = textfield;
    }
    return _searchTextfield;
}


#pragma mark-搜索按钮
-(UIButton *)SearchButton
{
    if (_searchBnt == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth*6/8, 20, kWidth/4, 30)];
        
        btn.backgroundColor = kBgColor;
        
        [btn setTitle:@"搜索" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(SearchBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        btn.titleLabel.font = kLabelFont;
        
        [self.view addSubview:btn];
        
        _searchBnt = btn;
    }
    return _searchBnt;
}

#pragma mark-搜索按钮的相应方法
-(void)SearchBtnClick
{
    NSString *Str = [NSString deleteSpace:_searchTextfield.text];
    
    if ([Str isEqual:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"搜索框不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];

    }
    else
    {
        _SearchDataArr = [NSArray requestWithPath:@"product_list.php" params:@{@"content":@{@"request":@{@"filter":@{@"key_word":Str}}}} method:@"POST"];
        
        NSLog(@"%lu",[_SearchDataArr[0][@"content"][@"response"][@"product_list"]count]);
        
        if ([_SearchDataArr[0][@"content"][@"response"][@"product_list"]count]==0)
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"没有数据";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];

        }
        else
        {
            _SearchDataArr = _SearchDataArr[0][@"content"][@"response"][@"product_list"];
            
            GoodListController *goodsList = [GoodListController new];
            
            goodsList.moduleGoodsListArr = _SearchDataArr;
            
            goodsList.moduleGoodsListSearchTitle = Str;
            
            [self.navigationController pushViewController:goodsList animated:YES];
        }

    }
}

#pragma mark-热门推荐
-(void)PopularRecommendation
{
    //底层View
    [self PopularView];
    
    //标题
    [self TitleLabel];
    
    //标签
    [self TitleButton];
}


#pragma mark-热门推荐底层View
-(UIView*)PopularView
{
    if(_popularView == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, _searchBnt.frame.size.height+20, kWidth, kHeight/2)];
        
        [self.view addSubview:view];
        
        _popularView = view;
    }
    return _popularView;
}

#pragma mark-热门推荐标题
-(UILabel *)TitleLabel
{
    if (_titleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, _popularView.frame.size.width/3, _popularView.frame.size.height/10)];
        
        label.text = @"热门搜索词:";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [_popularView addSubview:label];
        
        _titleLabel = label;
    }
    return _titleLabel;
}

#pragma mark-热门推荐标签

-(UIButton *)TitleButton
{
    if (_titleBtn == nil)
    {
        CGFloat w = 0; //保存前一个button的宽以及前一个button距离屏幕的距离
        
        CGFloat h = _popularView.frame.size.height/5; //用来控制button距离父视图的高
        
        for(int i = 0;i < MutableArr.count;i ++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            
            button.tag = 100 +i ;
            
            button.backgroundColor = kBgColor;
            
            button.layer.cornerRadius = 10;
            
            [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            
            //计算文字的的大小
            
            NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
            
            CGFloat length = [MutableArr[i]boundingRectWithSize:CGSizeMake(kWidth, 20000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
            
            //为button赋值
            [button setTitle:MutableArr[i] forState:UIControlStateNormal];
            
            //设置button的frame
            button.frame = CGRectMake(10 + w, h, length +15, 30);
            
            //当button的位置超出屏幕边缘时换行
            if (10 + w +length +15 > kWidth)
            {
                w = 0;
                
                h = h +button.frame.size.height +10; //距离父视图也变化
                
                button.frame = CGRectMake(10 + w, h, length + 15, 30); //重设button 的frame
            }
            
            w = button.frame.size.width + button.frame.origin.x;
            
            [_popularView addSubview:button];
            
            _titleBtn = button;
        }
        
    }
    return _titleBtn;
}

#pragma mark-标签的响应方法
-(void)handleClick: (UIButton *)sender
{
    _searchTextfield.text = sender.currentTitle;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_searchTextfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
