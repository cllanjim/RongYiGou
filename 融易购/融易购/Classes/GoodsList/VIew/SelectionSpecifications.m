//
//  SelectionSpecifications.m
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SelectionSpecifications.h"
#import "LoginInController.h"
#import "ProductDetailsController.h"

#define kViewWidth self.frame.size.width

#define kViewHeight self.frame.size.height


@interface SelectionSpecifications()
{
    UIView *_selectView;
    
    UIButton *selectBtn;
}

@end

@implementation SelectionSpecifications

-(void)addSpecification:(NSDictionary *)information Controller:(UIViewController *)viewController
{
    _selectionDataDic = information;
    
    _viewController = viewController;
    
    
    //商品信息
    [self GoodInformationShow];
    
    //商品规格选择
    [self GoodsSelection];
    
    //购买数量选择/授信额度展示
    [self SelectNumber];
    
    //加入购物车/立即购买 按钮
    [self FunctionButton];
    
}
#pragma mark-商品信息展示
-(void)GoodInformationShow
{
    //底层View
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight/4)];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:view];
    //头像
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, view.frame.size.height-10, view.frame.size.height-10)];
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_selectionDataDic[@"pic"]]];
    
    _iconImageView.backgroundColor = [UIColor lightGrayColor];
    
    [view addSubview:_iconImageView];
    
    //价格
    _price = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.height, 5, view.frame.size.width/2, view.frame.size.height/3-10)];
    
    _price.text = [NSString stringWithFormat:@"¥%@",_selectionDataDic[@"price"]];
    
    _price.textColor = [UIColor redColor];
    
    [view addSubview:_price];
    
    //库存
    _stock = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.height, view.frame.size.height/3, view.frame.size.width*3/5, view.frame.size.height/3-10)];
    
    _stock.text = [NSString stringWithFormat:@"库存%@件",_selectionDataDic[@"stock"]];
    
    [self addSubview:_stock];
    
    //已选择规格
    _selectInformation = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.height, view.frame.size.height*2/3-5,view.frame.size.width-(view.frame.size.height +5), view.frame.size.height/3)];
    
    _selectInformation.text = @"请选择";
    
    [view addSubview:_selectInformation];
}

#pragma mark-商品规格选择
-(void)GoodsSelection
{
    //底层tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.frame.size.height/4, self.frame.size.width, self.frame.size.height/2)];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.bounces = NO;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_tableView];
}

#pragma mark-DataSource 和 Delegate 方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_selectionDataDic[@"product_spec"]count];
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
    
    UILabel *specName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.size.width/20, 10, cell.frame.size.width/5, 100/4)];
    
    specName.text = _selectionDataDic[@"product_spec"][indexPath.row][@"sepc_name"];
    
    specName.backgroundColor = kBgColor;
    
    specName.font = kLabelFont;
    
    specName.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:specName];
    
    
    for (int i = 0; i < [_selectionDataDic[@"product_spec"][indexPath.row][@"type"]count]; i ++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width/20  + i *(cell.frame.size.width/5), 100/2,cell.frame.size.width/6, 100/3)];
        
        [btn setTitle:_selectionDataDic[@"product_spec"][indexPath.row][@"type"][i][@"name"] forState:UIControlStateNormal];
        
        btn.tag = 100 + i;
        
        [btn setBackgroundImage:[UIImage imageNamed:@"goodsSelect.png"] forState:UIControlStateSelected];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(SpecBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
         btn.backgroundColor = kBgColor;
        
        [cell addSubview:btn];
    }
    
    
    
    return cell;
}
#pragma mark-产品规格的选中
-(void)SpecBtnClick:(UIButton *)sender
{
    
    /***********改变按钮的状态*************/
    
    if (sender != selectBtn)
    {
        selectBtn.selected = NO;
        
        selectBtn = sender;
    }
    selectBtn.selected = YES;
    
    /***********改变按钮的状态*************/
    
    
    for (NSDictionary *dict in _selectionDataDic[@"product_extfiled"][@"matel"])
    {
        if ([dict[@"setmeal"]isEqualToString:sender.currentTitle])
        {
            _specId = dict[@"id"];//规格Id
            
            _stock.text = [NSString stringWithFormat:@"库存:%@",dict[@"stock"]];
            
            _price.text = dict[@"price"];
            
            _selectInformation.text = [NSString stringWithFormat:@"已选: %@",dict[@"setmeal"]];
            
            _productId = dict[@"pid"];//产品Id
        
        }
    }
}

#pragma mark-购买数量选择/授信额度展示
-(void)SelectNumber
{
    //底层View
   _selectView = [[UIView alloc]initWithFrame:CGRectMake(0, kViewHeight*3/4, kViewWidth, kViewHeight/6)];
    
    _selectView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_selectView];
    
    //购买数量标题
    _numberTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, _selectView.frame.size.width/3, _selectView.frame.size.height-10)];
    
    _numberTitle.text = @"购买数量";
    
    _numberTitle.textAlignment = NSTextAlignmentCenter;
    
    [_selectView addSubview:_numberTitle];
    
    //减少按钮
    
    _reduce = [[UIButton alloc]initWithFrame:CGRectMake(_selectView.frame.size.width/1.8, 22, _selectView.frame.size.height-44, _selectView.frame.size.height-44)];
    
    _reduce.backgroundColor = [UIColor lightGrayColor];
    
    [_reduce setTitle:@"-" forState:UIControlStateNormal];
    
    [_reduce setTitle:@"" forState:UIControlStateHighlighted];
    
    [_reduce addTarget:self action:@selector(NumberReduceClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_selectView addSubview:_reduce];
    
   
    //购买商品数量
    _goodsNumber = [[UILabel alloc]initWithFrame:CGRectMake(_reduce.frame.origin.x + _reduce.frame.size.width + 5, 25, _selectView.frame.size.width/6,  _selectView.frame.size.height-50)];
    
    _goodsNumber.text = @"1";
    
    _goodsNumber.textAlignment = NSTextAlignmentCenter;
    
    [_selectView addSubview:_goodsNumber];
    

    //增加按钮
    _add = [[UIButton alloc]initWithFrame:CGRectMake(_goodsNumber.frame.origin.x + _goodsNumber.frame.size.width +5, 22, _selectView.frame.size.height-44, _selectView.frame.size.height-44)];
    
    [_add setTitle:@"+" forState:UIControlStateNormal];
    
    [_add setTitle:@"" forState:UIControlStateHighlighted];
    
    [_add addTarget:self action:@selector(NUmberAddCliack) forControlEvents:UIControlEventTouchUpInside];
    
    _add.backgroundColor = [UIColor lightGrayColor];
    
    [_selectView addSubview:_add];


    
//    //剩余授信额度
//    _creditNumber = [[UILabel alloc]initWithFrame:CGRectMake(_selectView.frame.size.width/2, _selectView.frame.size.height*3.8/5, _selectView.frame.size.width/2-5, _selectView.frame.size.height/5-2)];
//    
//    _creditNumber.text = [NSString stringWithFormat:@"剩余授信:%@件",_selectionDataDic[@"limit_num"]];
//    
//    _creditNumber.font = kLabelFont;
//    
//    _creditNumber.textAlignment = NSTextAlignmentCenter;
//    
//    [_selectView addSubview:_creditNumber];
}

#pragma mark-商品数量减少
-(void)NumberReduceClick
{
    int number = [_goodsNumber.text intValue];
    
    if (number <2)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"数量不能再减了!";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    else
    {
        number --;
    }
    _goodsNumber.text = [NSString stringWithFormat:@"%d",number];

}

#pragma mark-商品数量增加
-(void)NUmberAddCliack
{
    int number = [_goodsNumber.text intValue];
    
     number ++;
    
    _goodsNumber.text = [NSString stringWithFormat:@"%d",number];
    
}


#pragma mark-加入购物车/立即购买 按钮
-(void)FunctionButton
{
    for (int i = 0; i <2 ; i ++)
    {
        _fuctionButton = [[UIButton alloc]initWithFrame:CGRectMake(i *(kViewWidth/2), kViewHeight*11/12, kViewWidth/2, kViewHeight/12)];
        
        _fuctionButton.tag = i +100;
        
        switch (_fuctionButton.tag)
        {
            case 100:
            {
                _fuctionButton.backgroundColor = [UIColor orangeColor];
                
                [_fuctionButton setTitle:@"加入购物车" forState:UIControlStateNormal];
                
                [_fuctionButton addTarget:self action:@selector(FuctionButtonClick) forControlEvents:UIControlEventTouchUpInside];
                
                [_fuctionButton setTitle:@"" forState:UIControlStateHighlighted];
            }
                break;
            case 101:
            {
                _fuctionButton.backgroundColor = [UIColor redColor];
                
                [_fuctionButton setTitle:@"立即购买" forState:UIControlStateNormal];
                
                [_fuctionButton setTitle:@"" forState:UIControlStateHighlighted];
            }
                break;
                
            default:
                break;
        }
        
        [self addSubview:_fuctionButton];
    }
}

#pragma mark-加入购物车的响应方法
-(void)FuctionButtonClick
{
    GlobalInformation *global = [GlobalInformation shareManager];
    
    if (global.userId != nil)
    {
        if ([_goodsNumber.text intValue])
        {
            
            if (_productId != nil && _specId != nil)
            {
                _selectGetDataArr = [NSArray requestWithPath:@"cart.php" params:@{@"content":@{@"request":@{@"type":@"add_cart",@"uid":global.userId,@"nums":_goodsNumber.text,@"pid":_productId,@"sid":_specId}}} method:@"POST"];
                
                NSLog(@"%@",_selectGetDataArr);
                
            }
            else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
                
                hud.mode = MBProgressHUDModeText;
                
                hud.labelText = @"请选择商品属性";
                
                hud.margin = 10.f;
                
                hud.removeFromSuperViewOnHide = YES;
                
                [hud hide:YES afterDelay:2];
            }
            
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"数量不能为空";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
        
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [_viewController presentViewController:login animated:YES completion:nil];
    }
    
}


@end
