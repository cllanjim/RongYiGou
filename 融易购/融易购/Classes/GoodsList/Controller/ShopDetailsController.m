//
//  ShopDetailsController.m
//  RongYiGou
//
//  Created by mac on 16/2/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShopDetailsController.h"
#import "ShopDetailsSelectBtn.h"
#import "GoodsListView.h"

@interface ShopDetailsController ()
{
    UILabel *selectBtnTextLabel1;
    
    UILabel *selectBtnTextLabel2;
    
    UIButton *starButton;
    
    BOOL collectBtn;
    
}
@end

@implementation ShopDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.自定义导航条(返回按钮.商品搜索框.店铺商品分类)
    [self ShopDetailsNavBar];
    
    //1.1添加店铺商品搜索框
    [self ShopDetailsTextField];
    
    //1.2添加分类按钮
    [self ShopDetailsClassBtn];
    
    //2.店铺信息展示界面(店铺广告.店铺LOGO.店铺名称.收藏数量)
    [self ShopDetailsImageView];
    //3.商品选择栏(首页.全部.上新.推荐)
    [self ShopSelectBtn];
    
    //4.首页内容展示
    [self ShopDetailsScrollView];
    
    //5.全部.上新.推荐 内容展示
    [self GoodsListView];
    
    
}

#pragma mark-自定义导航条
-(NavigationBar *)ShopDetailsNavBar
{
    if (_shopDetailsNavBar == nil)
    {
        NavigationBar *bar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        bar.backgroundColor = kBgColor;
        
        [bar addNavigationBar:@" " NavigationController:_shopDetailsNavController];
        
        [self.view addSubview:bar];
        
        bar.backButton.hidden = NO;
        
        bar.animated = YES;
        
        bar.titleLabel.textColor = [UIColor blackColor];
        
        _shopDetailsNavBar = bar;

    }
    return _shopDetailsNavBar;
}

#pragma mark-在导航栏上添加搜索框
-(UITextField *)ShopDetailsTextField
{
    if (_shopDetailsTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_shopDetailsNavBar.frame.size.width/10, 30, _shopDetailsNavBar.frame.size.width*7/10, _shopDetailsNavBar.frame.size.height-40)];
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        textField.placeholder = @"搜索店铺内商品";
        
        textField.font = kLabelFont;
        
        [_shopDetailsNavBar addSubview:textField];
        
        _shopDetailsTextField = textField;
    }
    return _shopDetailsTextField;
}

#pragma mark-在导航栏上添加分类按钮
-(UIButton *)ShopDetailsClassBtn
{
    if (_shopDetailsClassBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_shopDetailsNavBar.frame.size.width*8/10, 20, _shopDetailsNavBar.frame.size.width/5, _shopDetailsNavBar.frame.size.height-20)];
        
        [btn setTitle:@"分类" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [_shopDetailsNavBar addSubview:btn];
        
        _shopDetailsClassBtn = btn;
    }
    return _shopDetailsClassBtn;
}

#pragma mark-店铺信息展示界面
-(UIImageView *)ShopDetailsImageView
{
    if (_shopDetailsImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 69, self.view.frame.size.width, self.view.frame.size.height/5)];
        
        imageView.image = [UIImage imageNamed:@"img6.png"];

        imageView.contentMode = UIViewContentModeScaleToFill;
        
        imageView.backgroundColor = [UIColor lightGrayColor];
        
        imageView.alpha = 0.7;
        
        imageView.userInteractionEnabled = YES;
        
        [self.view addSubview:imageView];
        
        _shopDetailsImageView = imageView;
    }
    
    //添加LOGO
    [self ShopDetailsLOGO];
    
    //添加店铺名称
    [self ShopDetailsName];
    
    //添加信用等级
    [self ShopDetailsGrade];
    
    //添加收藏数量
    [self ShopDetailsCollectNumber];
    
    return _shopDetailsImageView;
}

#pragma  mark-添加LOGO 
-(UIImageView *)ShopDetailsLOGO
{
    if (_shopDetailsLOGO == nil)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _shopDetailsImageView.frame.size.height/2, _shopDetailsImageView.frame.size.width/5, _shopDetailsImageView.frame.size.height/2)];
        
        imageView.backgroundColor = [UIColor greenColor];
        
        imageView.image = [UIImage imageNamed:@"img6.png"];
        
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        
        [_shopDetailsImageView addSubview:imageView];
        
        _shopDetailsLOGO = imageView;
    }
    return _shopDetailsLOGO;
}


#pragma mark-添加店铺名称
-(UILabel *)ShopDetailsName
{
    if (_shopDetailsName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_shopDetailsImageView.frame.size.width/5 + 5, _shopDetailsImageView.frame.size.height/2, _shopDetailsImageView.frame.size.width/2 - 5, _shopDetailsImageView.frame.size.height/4)];
        
        label.text = @"易乐购网络科技有限公司";
        
        label.font = kLabelFont;
        
        [_shopDetailsImageView addSubview:label];
        
        _shopDetailsName = label;
    }
    return _shopDetailsName;
}


#pragma mark-信用等级
-(UIImageView *)ShopDetailsGrade
{
    if (_shopDetailsGrade == nil)
    {
        for (int i = 0; i < 4; i ++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_shopDetailsImageView.frame.size.width/5 + 5 + (_shopDetailsImageView.frame.size.height/6 * i),  _shopDetailsImageView.frame.size.height*2.2/3, _shopDetailsImageView.frame.size.height/6.5, _shopDetailsImageView.frame.size.height/6.5)];
            
            imageView.image = [UIImage imageNamed:@"level.png"];
            
            [_shopDetailsImageView addSubview:imageView];
            
            _shopDetailsGrade = imageView;
        }
    }
    return _shopDetailsGrade;
}

#pragma mark-收藏数量
-(UIButton *)ShopDetailsCollectNumber
{
    if (_shopDetailsIsSelectedBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_shopDetailsImageView.frame.size.width*7.5/10, _shopDetailsImageView.frame.size.height/2, _shopDetailsImageView.frame.size.width*2/10,  _shopDetailsImageView.frame.size.height/2)];
        
        [btn setImage:[UIImage imageNamed:@"btn_follow_un.png"] forState:UIControlStateNormal];
        
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [btn addTarget:self action:@selector(shopDerailIsSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_shopDetailsImageView addSubview:btn];
        
        _shopDetailsIsSelectedBtn = btn;
    }
    return _shopDetailsIsSelectedBtn;
}

#pragma mark-店铺收藏按钮的响应方法
-(void)shopDerailIsSelectedClick:(UIButton *)sender
{
    collectBtn = !collectBtn;
    
    if (collectBtn)
    {
        [sender setImage:[UIImage imageNamed:@"btn_follow_h.png"] forState:UIControlStateNormal];
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"btn_follow_un.png"] forState:UIControlStateNormal];
    }
}



#pragma mark-首页.全部.上新.推荐等模块的建设
-(ShopDetailsSelectBtn *)ShopSelectBtn
{
    NSArray *arr1 = [[NSArray alloc]initWithObjects:@"首页",@"全部",@"上新",@"推荐", nil];
    
    NSArray *arr2 = [[NSArray alloc]initWithObjects:@"0",@"116",@"10",@"10", nil];
    
    if (_shopSelectBtn == nil)
    {
        for (int i = 0; i < 4; i ++)
        {
            ShopDetailsSelectBtn *selectBtn = [[ShopDetailsSelectBtn alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width/4,self.view.frame.size.height/5 + 69, self.view.frame.size.width/4, self.view.frame.size.height/15)];
            
            selectBtn.tag = 10 + i;
            
            
            selectBtn.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
            
            selectBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
            
//            [selectBtn setImage:[UIImage imageNamed:@"tabbar_slider.png"] forState:UIControlStateSelected];
            
            [selectBtn setBackgroundImage:[UIImage imageNamed:@"selectBackground.png"] forState:UIControlStateSelected];
            
            if (i == 0)
            {
                selectBtn.selected = YES;
                
                starButton = selectBtn;
            }
            
            selectBtn.layer.borderWidth = 1.5;
            
            selectBtn.layer.borderColor = [UIColor whiteColor].CGColor;
            
            [selectBtn addTitle:[arr1 objectAtIndex:i] Number:[arr2 objectAtIndex:i]];
            
            [selectBtn addTarget:self action:@selector(ShopDetailsSelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:selectBtn];
            
            _shopSelectBtn = selectBtn;
        }
    }
    return _shopSelectBtn;
}
#pragma mark-首页.全部.上新.推荐等按钮的响应方法
-(void)ShopDetailsSelectBtnClick:(UIButton *)sender
{
    
    if (sender != starButton)
    {
        starButton.selected = NO;
        
        starButton = sender;
    }
    
    starButton.selected = YES;
    
    switch (sender.tag)
    {
        case 10:
        {
            _shopDetailsScrollView.hidden = NO;
            
            _goodsListView.hidden = YES;
        }
            break;
        case 11:
        {
            _shopDetailsScrollView.hidden = YES;
            
            _goodsListView.hidden = NO;
        }
            break;
        case 12:
        {
            _shopDetailsScrollView.hidden = YES;
            
            _goodsListView.hidden = NO;
        }
            break;
        case 13:
        {
            _shopDetailsScrollView.hidden = YES;
            
            _goodsListView.hidden = NO;
        }
            break;
        default:
            break;
    }
    
}



#pragma mark-首页内容展示
-(UIScrollView *)ShopDetailsScrollView
{
    if (_shopDetailsScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height*4/15 + 69, self.view.frame.size.width, self.view.frame.size.height*11/15-69-44)];
        
        scrollView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        [self.view addSubview:scrollView];
        
        _shopDetailsScrollView = scrollView;
    }
    return _shopDetailsScrollView;
}

#pragma mark-全部.上新.推荐内容展示
-(GoodsListView *)GoodsListView
{
    if (_goodsListView == nil)
    {
        GoodsListView *goodsList = [[GoodsListView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height*4/15 + 69, self.view.frame.size.width, self.view.frame.size.height*11/15-69)];
        
        goodsList.hidden = YES;
        
        [goodsList addData:nil ShopDataArray:nil NavigationController:nil];
        
        [self.view addSubview:goodsList];
        
        _goodsListView = goodsList;
    }
    return _goodsListView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
