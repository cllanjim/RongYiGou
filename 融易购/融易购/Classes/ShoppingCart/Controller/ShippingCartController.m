//
//  ShippingCartController.m
//  RongYiGou
//
//  Created by mac on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ShippingCartController.h"
#import "OrderDetailsCell.h"
#import "MJRefresh.h"
#import "ShoppingCartModel.h"
#import "ShopOrderModel.h"
#import "MJExtension.h"
#import "ShopDetailsController.h"
#import "OrderDetailsController.h"
#import "ShippingCartRank.h"
#import "LoginInController.h"
#import "GlobalInformation.h"

@interface ShippingCartController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_navigationBar;
    
    UILabel *_navigationTitleLabel;
    
    UIButton *_navigationEditButton;
    
    UITableView *_tableViewContent;
    
    UIButton *_selectBtn;
    
    UIButton *_shopNameBtn;
    
    UIButton *_editBtn;
    
    BOOL index;
    
    float allPrice;
    
    NSMutableArray *infoArr;
    
    NSMutableArray *nextInfoArr;
    
    UILabel *label1;
    
    NSArray *shippingCartDataArr;
    
    BOOL selectFlay;
    
    BOOL bottomIsSelected;
    
    NSInteger goodsNumber;
    
    GlobalInformation *gloal;
    
    BOOL whetherSelect;
}

@property (strong,nonatomic)UIButton *allSelectBtn;

@property (strong,nonatomic)UILabel *allPriceLab;

@end

@implementation ShippingCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏导航条
    self.navigationController.navigationBar.hidden = YES;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cartModelArr = [NSMutableArray arrayWithCapacity:10];
    
    _orderModelArr = [NSMutableArray arrayWithCapacity:10];
    
    gloal = [GlobalInformation shareManager];
    
    //初始化数据
    allPrice = 0.0;
    
    infoArr = [NSMutableArray arrayWithCapacity:10];
    
    nextInfoArr = [NSMutableArray arrayWithCapacity:10];
    
    [self ReloadData];
    
    //自定义导航条
    [self NavigationBar];
    
    [self NavigationTitleLabel];
    
    [self NavigationEditButton];
    
    //中部内容主体
    [self TableViewCentent];
    
    //底部结算条
    [self ButtonSettlement];
    
    //刷新控件
    [self MJRefresh];
    
}

#pragma mark-加载数据
-(void)ReloadData
{
    _UserId = gloal.userId;
    
    if (gloal.userId != nil)
    {
        /*
         发送请求,获取数据
         */
        shippingCartDataArr = [NSArray requestWithPath:@"cart.php" params:@{@"content":@{@"request":@{@"type":@"detail_cart",@"uid":_UserId}}} method:@"POST"];
        
        if ([shippingCartDataArr count])
        {
            shippingCartDataArr = shippingCartDataArr[0][@"content"][@"response"][@"cart"];
            
            NSLog(@"%@",shippingCartDataArr);
            
            _shippingCartDataMutableArr = [[NSMutableArray alloc]initWithArray:shippingCartDataArr];
        }
        
        NSLog(@"%@",shippingCartDataArr);
    }
    else
    {
        LoginInController *login = [LoginInController new];
        
        [self presentViewController:login animated:YES completion:nil];
    }
   
    /*
     遍历数组,将元素加入模型
     */
    for (NSDictionary *dict in shippingCartDataArr)
    {
        ShopOrderModel *model = [[ShopOrderModel alloc]initWithDict:dict];
        
        model.shopName = dict[@"company"];
        
        for (NSDictionary *dict1 in dict[@"prolist"])
        {
            ShoppingCartModel *cartModel = [[ShoppingCartModel alloc]initWithDict:dict1];
            
            [model.goodsDataArr addObject:cartModel];
            
            goodsNumber ++;
        }
        
        [infoArr addObject:model];
    }
}

#pragma mark-刷新控件
-(void)MJRefresh
{
    _tableViewContent.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self ReloadData];
        
        [_tableViewContent reloadData];
        
        [_tableViewContent.mj_header endRefreshing];

    }];
}

#pragma mark-自定义导航条
-(UIView *)NavigationBar
{
    if (_navigationBar == nil)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 59)];
        
        view.backgroundColor = [UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:0.7];
        
        [self.view addSubview:view];
        
        _navigationBar = view;
    }
    return _navigationBar;
}

#pragma mark-添加导航条上的标题
-(UILabel *)NavigationTitleLabel
{
    if (_navigationTitleLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 25,_navigationBar.frame.size.width/5, 29)];
        
        label.text = @"购物车";
        
        [_navigationBar addSubview:label];
        
        _navigationTitleLabel = label;
    }
    return _navigationTitleLabel;
}

#pragma mark-添加导航条上的 "编辑全部" 按钮
-(UIButton *)NavigationEditButton
{
    if (_navigationEditButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_navigationBar.frame.size.width*4/5-10, 25, _navigationBar.frame.size.width/5, 29)];
        
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(editAllOrderClick) forControlEvents:UIControlEventTouchUpInside];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_navigationBar addSubview:btn];
        
        _navigationEditButton = btn;
    }
    return _navigationEditButton;
}

#pragma mark-"编辑全部" 按钮的响应方法
-(void)editAllOrderClick
{
    whetherSelect = !whetherSelect;
    
    if (whetherSelect)
    {
        [_navigationEditButton setTitle:@"取消" forState:UIControlStateNormal];
    }
    else
    {
        [_navigationEditButton setTitle:@"编辑" forState:UIControlStateNormal];
    }
    
    [_tableViewContent setEditing:!_tableViewContent.editing animated:YES];
}

#pragma mark-设定cell的编辑属性为Delete
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark-/*改变删除按钮的title*/
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark-/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShopOrderModel *orderModel = infoArr[indexPath.section];
    
    ShoppingCartModel *cartModel = orderModel.goodsDataArr[indexPath.row];
    
    
    if (editingStyle ==UITableViewCellEditingStyleDelete)
    {
        
        [_shippingCartDataMutableArr[indexPath.section][@"prolist"] removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
        
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        
        /*
          发送请求,删除数据库内的内容(删除购物车)
         */
        
        _deleteBackDataArr = [NSArray requestWithPath:@"cart.php" params:@{@"content":@{@"request":@{@"type":@"del_cart",@"uid":_UserId,@"del_id":cartModel.cartId}}} method:@"POST"];
        
        
        if ([_deleteBackDataArr[0][@"content"][@"response"]length])
        {

        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"删除失败";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
 
    }
}


#pragma mark-中部内容主体
-(UITableView *)TableViewCentent
{
    if (_tableViewContent == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, _navigationBar.frame.size.height, kWidth, kHeight-44-50-59)style:UITableViewStyleGrouped];
        
        tableView.backgroundColor = [UIColor whiteColor];
        
        tableView.showsVerticalScrollIndicator = NO;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
         _tableViewContent = tableView;
    }
   
    
    return _tableViewContent;
}

#pragma mark-底部结算条
-(UIView *)ButtonSettlement
{
    if (_bottomView == nil)
    {
        UIView * View = [[UIView alloc]initWithFrame:CGRectMake(0, _navigationBar.frame.size.height+_tableViewContent.frame.size.height, kWidth, kHeight-_navigationBar.frame.size.height-_tableViewContent.frame.size.height-44)];
        
        [self.view addSubview:View];
        
        _bottomView = View;
    }

    //选中按钮
    [self SelectBtn];
    
    //"全选"字样
    [self SelectLabel];
    
    //价格总计
    [self TotalLabel];
    
    //确认按钮
    [self ConfirmBnt];

    return _bottomView;
}


#pragma mark-底部栏上的全部选中按钮
-(UIButton *)SelectBtn
{
    if (_bottomSelectBnt == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(13,13, _bottomView.frame.size.height-26, _bottomView.frame.size.height-26)];
        
        btn.layer.cornerRadius = (_bottomView.frame.size.height-26)/2;
        
        [btn addTarget:self action:@selector(BottomSelectClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (bottomIsSelected)
        {
            btn.backgroundColor = [UIColor redColor];
        }
        else
        {
            btn.backgroundColor = [UIColor lightGrayColor];
        }
        
        
        [_bottomView addSubview:btn];
        _bottomSelectBnt = btn;
    }
    return _bottomSelectBnt;
}

#pragma mark-底部结算条全选按钮的响应方法
-(void)BottomSelectClick:(UIButton *)sendr
{
    bottomIsSelected = !bottomIsSelected;
    
    ShopOrderModel *orderModel;
    
    if (bottomIsSelected)
    {
        sendr.backgroundColor = [UIColor redColor];
        
        for (int i = 0; i <infoArr.count; i ++)
        {
            orderModel = infoArr[i];
            
            orderModel.isSelected = YES;
            
            for (int s = 0; s < orderModel.goodsDataArr.count; s ++)
            {
                ShoppingCartModel *cartModel = orderModel.goodsDataArr[s];
                
                cartModel.selectState = YES;
            }
        }
    }
    else
    {
        sendr.backgroundColor = [UIColor lightGrayColor];
        
        for (int i = 0; i <infoArr.count; i ++)
        {
            orderModel = infoArr[i];
            
            orderModel.isSelected = NO;
            
            for (int s = 0; s < orderModel.goodsDataArr.count; s ++)
            {
                ShoppingCartModel *cartModel = orderModel.goodsDataArr[s];
                
                cartModel.selectState = NO;
            }
        }
    }
    
    [self MakeSumPrice];
    
    [_tableViewContent reloadData];
    
}


#pragma mark-全选字样
-(UILabel *)SelectLabel
{
    if (_bottomSelectLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_bottomView.frame.size.height, 13, _bottomView.frame.size.width/5, _bottomView.frame.size.height-26)];
        
        label.text = @"全选";
        
        label.font = kLabelFont;
        
        [_bottomView addSubview:label];
        
        _bottomSelectLabel = label;
    }
    return _bottomSelectLabel;
}

#pragma mark-购物车勾选商品结算总数
-(UILabel *)TotalLabel
{
    if (_bottomTotalLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(_bottomSelectBnt.frame.size.width + 20 , 10, _bottomView.frame.size.width-_bottomSelectBnt.frame.size.width-_bottomView.frame.size.width/4-30, _bottomView.frame.size.height-20)];
        
        label.textAlignment = NSTextAlignmentRight;
        
        label.text = @"合计:0.00";
        
        [_bottomView addSubview:label];
        
        _bottomTotalLabel = label;
    }
    return _bottomTotalLabel;
}

#pragma mark-确认按钮
-(UIButton *)ConfirmBnt
{
    if (_bottomConfirmBnt == nil)
    {
        UIButton *bnt = [[UIButton alloc]initWithFrame:CGRectMake(_bottomView.frame.size.width*3/4, 0, _bottomView.frame.size.width/4, _bottomView.frame.size.height)];
        
        bnt.backgroundColor = [UIColor redColor];
        
        [bnt setTitle:@"结算" forState:UIControlStateNormal];
        
        [bnt setTitle:@"" forState:UIControlStateHighlighted];
        
        [bnt addTarget:self action:@selector(buttomConfirmbntClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomView addSubview:bnt];
        
        _bottomConfirmBnt = bnt;
    }
    return _bottomConfirmBnt;
}

#pragma mark-*******结算按钮的响应方法*******
-(void)buttomConfirmbntClick
{
   
    for (ShopOrderModel *orderModel in infoArr)
    {
        _cartModelArr = nil;
        
        for (ShoppingCartModel *cartModel in orderModel.goodsDataArr)
        {
            if (cartModel.selectState)
            {
                _cartModelDict = @{
                                   
                                   @"goodImage":cartModel.imageName, //商品图片
                                   
                                   @"goodTitle":cartModel.goodsTitle, //商品标题
                                   
                                   @"goodPrice":cartModel.goodsPrice, //商品价格
                                   
                                   @"cartId":cartModel.cartId,   //购物车Id
                                   
                                   @"goodsNum":[NSString stringWithFormat:@"%d",cartModel.goodsNnm ]   //商品数量

                                   
                                   };
                
                
            }
        }
        
    }
  
    OrderDetailsController *order = [OrderDetailsController new];
    
    order.orderNavController = self.navigationController;
    
    order.orderUserId = self.UserId;
    
    [self.navigationController pushViewController:order animated:YES];
}

#pragma mark-UITableView 的 datasource 方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [shippingCartDataArr[section][@"prolist"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifer = @"Cell";
    
   OrderDetailsCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if (cell == nil) {
        cell = [[OrderDetailsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifer];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor colorWithRed:236/255.0f green:239/255.0f blue:242/255.0f alpha:1];
    
        cell.delegate = self;
    }
    
    ShopOrderModel *model = [[ShopOrderModel alloc]init];
    
    model = infoArr[indexPath.section];
    
    //调用方法 给单元格赋值
    [cell AddTheValue:model.goodsDataArr[indexPath.row] TableView:_tableViewContent];
    
    return cell;
    
}

#pragma mark-UITableView 的 delegate 方法

#pragma mark-Cell 的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int i = 0 ;
    
    int s = 0;
    
    //判断当前单元格是否选中
    
    ShopOrderModel *model = infoArr[indexPath.section];
    
    ShoppingCartModel *cartModel = model.goodsDataArr[indexPath.row];
    
    if (cartModel.selectState)
    {
        cartModel.selectState = NO;
    }
    else
    {
        cartModel.selectState = YES;
    }
    
    for (ShoppingCartModel *CartModel in model.goodsDataArr)
    {
        if (CartModel.selectState ==YES)
        {
            i ++;
        }
        else
        {
            i --;
        }
    }
    
    if (i == model.goodsDataArr.count)
    {
        model.isSelected = YES;
    }
    else
    {
        model.isSelected = NO;
    }
    
    
    for (ShopOrderModel *orderModel in infoArr)
    {
        for (ShoppingCartModel *SumCartModel in orderModel.goodsDataArr)
        {
            if (SumCartModel.selectState)
            {
                s ++;
            }
        }
    }
    
    if (s == goodsNumber)
    {
        bottomIsSelected = YES;
        
        _bottomSelectBnt.backgroundColor = [UIColor redColor];
    }
    else
    {
        bottomIsSelected = NO;
        
        _bottomSelectBnt.backgroundColor = [UIColor lightGrayColor];
    }
    
    //计算价格
    [self MakeSumPrice];
    
    [_tableViewContent reloadData];
}

#pragma mark-设置Cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma mark-设置HeaderView 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

#pragma mark-设置FooterView 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

#pragma mark-设置HeaderView 的数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return shippingCartDataArr.count;
}

#pragma mark-TableView 的 HeaderView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    NSLog(@"%@",shippingCartDataArr);
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    [tableView addSubview:view];
    
    
    ShopOrderModel *model = [[ShopOrderModel alloc]init];
    
    model = infoArr[section];
    
    //全选按钮
    UIButton * selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 15, 20, 20)];
    
    
    if (model.isSelected)
    {
        selectBtn.backgroundColor = [UIColor redColor];
    }
    else
    {
        selectBtn.backgroundColor = [UIColor lightGrayColor];
    }
    
    
    selectBtn.tag = 200 + section;
    
    selectBtn.selected = NO;
    
    selectBtn.layer.cornerRadius =10;
    
    [selectBtn addTarget:self action:@selector(HeaderViewSelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:selectBtn];
    
    //店铺名称
    UIButton * shopNameBtn = [[UIButton alloc]initWithFrame:CGRectMake(view.frame.size.width/12, 5,view.frame.size.width*8/12-10, 40)];
    
    [shopNameBtn setTitle:[NSString stringWithFormat:@"%@  >",shippingCartDataArr[section][@"company"]] forState:UIControlStateNormal];
    
    [shopNameBtn setTitle:@"" forState:UIControlStateHighlighted];
    
    [shopNameBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [shopNameBtn addTarget:self action:@selector(shopNameBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    
    shopNameBtn.titleLabel.font = kLabelFont;
    
    [view addSubview:shopNameBtn];

    return view;
}

#pragma mark-单个店铺内商品全选按钮的响应方法
-(void)HeaderViewSelectBtnClick:(UIButton *)sender
{
    NSInteger i = sender.tag - 200;
    
    NSInteger s = 0;
    
    ShopOrderModel *model = [[ShopOrderModel alloc]init];
    
    model = infoArr[i];
    
    model.isSelected = ! model.isSelected;
    
    if (model.isSelected)
    {
        sender.backgroundColor = [UIColor redColor];
        
        for (ShoppingCartModel *cartModel in model.goodsDataArr)
        {
            cartModel.selectState = YES;
        }
    }
    else if(model.isSelected == NO)
    {
        sender.backgroundColor = [UIColor lightGrayColor];
        
        for (ShoppingCartModel *cartModel in model.goodsDataArr)
        {
            cartModel.selectState = NO;
        }
    }
    
    //pragma mark-设置底部导航栏上的全选按钮
    
    for (ShopOrderModel *orderModel in infoArr)
    {
        if (orderModel.isSelected)
        {
            s ++;
        }
    }
    
    if (s == infoArr.count)
    {
         bottomIsSelected = YES;
        
        _bottomSelectBnt.backgroundColor = [UIColor redColor];
    }
    else
    {
        bottomIsSelected = NO;
        
        _bottomSelectBnt.backgroundColor = [UIColor lightGrayColor];
    }

    //计算价格
    [self MakeSumPrice];
    
    [_tableViewContent reloadData];
    
}

#pragma mark-购物车订单上的店铺名称的响应方法
-(void)shopNameBtnCLick
{
    ShopDetailsController *shopDetail = [ShopDetailsController new];
    
    shopDetail.shopDetailsNavController = self.navigationController;
    
    [self.navigationController pushViewController:shopDetail animated:YES];
}

#pragma mark-单个店铺全部订单的选中按钮

-(void)SelectBtnClick1: (UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    
    sender.tag = !sender.tag;
    
    NSLog(@"%ld",(long)sender.tag);
    
    //判断是否选中
    if (sender.tag)
    {
        _selectBtn.backgroundColor = [UIColor redColor];
    }
    else
    {
        _selectBtn.backgroundColor = [UIColor lightGrayColor];
    }
    
    //改变单元格的状态
    for (int i = 0; i < infoArr.count; i ++)
    {
        ShoppingCartModel *model = [infoArr objectAtIndex:i];
        
        model.selectState = sender.tag;
    }
    
    [_tableViewContent reloadData];
}

#pragma mark-是实现加减法按钮点击代理事件
-(void)btnClick:(UITableViewCell *)cell andFlay:(int)flay
{
    NSIndexPath *btnIndex = [_tableViewContent indexPathForCell:cell];
    
    switch (flay)
    {
        case 201:
        {
            ShopOrderModel *orderModel = infoArr[btnIndex.section];
            
            ShoppingCartModel *cartModel = orderModel.goodsDataArr[btnIndex.row];

            if (cartModel.goodsNnm > 1)
            {
                cartModel.goodsNnm --;
            }
        }
            break;
        case 202:
        {
            ShopOrderModel *orderModel = infoArr[btnIndex.section];
            
            ShoppingCartModel *cartModel = orderModel.goodsDataArr[btnIndex.row];
            
            cartModel.goodsNnm ++;
        }
            break;
            
        default:
            break;
    }
    
    [self MakeSumPrice];
    
    [_tableViewContent reloadData];
}


//计算价格
-(void)MakeSumPrice
{
    //遍历整个数据源,然后判断如果是选中的商品,就计算价格(单价*商品数量)
    for (int i = 0; i < infoArr.count; i ++)
    {
        ShopOrderModel *model = [infoArr objectAtIndex:i];
        
        for (ShoppingCartModel *cartModel in model.goodsDataArr)
        {
            if (cartModel.selectState)
            {
                allPrice = allPrice +cartModel.goodsNnm * [cartModel.goodsPrice intValue];
                
                NSLog(@"%f",allPrice);
            }

        }
    }
    
    
    //给总价文本赋值
    _bottomTotalLabel.text = [NSString stringWithFormat:@"合计:%.2f",allPrice];
    
     allPrice = 0.0;
}


#pragma mark-添加商品规格选择页面
-(ShippingCartRank *)ShippingCartRank:(NSString *)price Stock:(NSString *)stock Icon:(NSString *)image Spec:(NSArray *)spec
{
    if (_shippingCartRank == nil)
    {
        _shippingCartBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        
        _shippingCartBackgroundView.backgroundColor = [UIColor colorWithRed:73/255.0 green:83/255.0 blue:86/255.0 alpha:0.8];
        
        _shippingCartBackgroundView.hidden = YES;
        
        [self.view addSubview:_shippingCartBackgroundView];
        
        ShippingCartRank *rank = [[ShippingCartRank alloc]initWithFrame:CGRectMake(0, kHeight/4, kWidth, kHeight*3/4)];
        
        rank.hidden = YES;
        
        rank.backgroundColor = [UIColor whiteColor];
        
        [rank addGoodsRank:price Stock:stock Icon:image Spec:spec];
        
        [_shippingCartBackgroundView addSubview:rank];
        
        _shippingCartRank = rank;
    }
    
    //添加取消按钮
    [self ShippingCartClose];
    
    //确定按钮
    [self RackOkBtn];
    
    return _shippingCartRank;
}

#pragma mark-关闭按钮
-(UIButton *)ShippingCartClose
{
    if (_shippingCartClose == nil)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(_shippingCartRank.frame.size.width*9/10, 5, _shippingCartRank.frame.size.width/10-5, _shippingCartRank.frame.size.width/10-5)];
        
        button.layer.cornerRadius =_shippingCartRank.frame.size.width/20;
        
        button.layer.borderColor = [UIColor grayColor].CGColor;
        
        button.layer.borderWidth = 3;
        
        button.backgroundColor = [UIColor whiteColor];
        
        [button setTitle:@"X" forState:UIControlStateNormal];
        
        [button setTitle:@"" forState:UIControlStateHighlighted];
        
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(ShippingCartCloseSelectBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_shippingCartRank addSubview:button];

        _shippingCartClose = button;
    }
    return _shippingCartClose;
}

#pragma mark-关闭按钮的响应方法
-(void)ShippingCartCloseSelectBtnClick
{
    _shippingCartRank.hidden = YES;
    
    _shippingCartBackgroundView.hidden = YES;
    
    _bottomView.hidden = NO;
}


#pragma mark-确定按钮展示
-(UIButton *)RackOkBtn
{
    if (_rackOkBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0,_shippingCartRank.frame.size.height-40 , kWidth, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(RackOkBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [_shippingCartRank addSubview:btn];
    }
    return _rackOkBtn;
}

#pragma 商品属性界面确定按钮的响应方法
-(void)RackOkBtnClick
{
    _shippingCartRank.hidden = YES;
    
    _shippingCartBackgroundView.hidden = YES;
    
    _bottomView.hidden = NO;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
