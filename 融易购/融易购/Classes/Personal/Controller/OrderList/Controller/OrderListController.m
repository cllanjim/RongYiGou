//
//  OrderListController.m
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OrderListController.h"
#import "KxMenu.h"
#import "OrderListCell.h"
#import "XLScrollViewer.h"
#import "GlobalInformation.h"

@interface OrderListController ()
{
    NSArray *orderArray;
    
    NSMutableArray *tableViewArray;
    
    NSMutableArray *mutableArray;
    
    NSMutableArray *orderDetailArray;
    
    UIView *_backgroundView;
    
    UILabel *_goodsSumLabel;
    
    UIView *_orderfunctionView;
    
    NSMutableArray *orderStateArray;

}
@end

@implementation OrderListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //订单交易状态: 1:待付款 2:待付款 3
    
    /*
    orderDetailArray = @[
                            @{
                                @"header":@{
                                        @"shop_name":@"福建易乐购网络科技有限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                        
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                
                                },
                            @{
                                @"header":@{
                                        @"shop_name":@"福建易网络科技有限公司",
                                        @"order_state":@"交易失败"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                           
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },
                            @{
                                @"header":@{
                                        @"shop_name":@"福建乐网络科技有限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                            
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建购网络科技有限公司",
                                        @"order_state":@"交易中"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                                                                        }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建乐购网络科技有限公司",
                                        @"order_state":@"交易失败"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                    
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建易乐网络科技有限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                        
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建易购网络科技有限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                            
                                            }
                                        ],
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建易乐购有限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                        @{
                                            @"goods_icon":@"img6.png",
                                            @"goods_name":@"iphone6SE",
                                            @"goods_price":@"1000",
                                            @"goods_number":@"20",
                                           
                                            }
                                        ],
                                
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },

                            @{
                                @"header":@{
                                        @"shop_name":@"福建易乐购网络科技无限公司",
                                        @"order_state":@"交易成功"
                                        },
                                @"order_detail":@[
                                                    @{
                                                      @"goods_icon":@"img6.png",
                                                      @"goods_name":@"iphone6SE",
                                                      @"goods_price":@"1000",
                                                      @"goods_number":@"20",

                                                      }
                                                    ],
                                
                                @"footer":@{
                                        @"goods_sumprice":@"20000",
                                        @"goods_freight":@"0.00"
                                        }
                                },


                            
                            ];
    
    
    
    
    */
    
    GlobalInformation *global = [GlobalInformation shareManager];
    
    _orderUserId = global.userId;
    
    
    
    
     //获取数据
    [self OrderGetData];
    
    tableViewArray = [NSMutableArray array];
    
    _orderStateMutableArr = [NSMutableArray arrayWithArray:_orderStateArr];
    
    [_orderStateMutableArr insertObject:@"全部" atIndex:0];
    
//    _orderStateArr = [[NSArray alloc]initWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后", nil];
    
    for (int i = 0; i < _orderStateMutableArr.count; i ++)
    {
        _orderTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)style:UITableViewStyleGrouped];
        
        _orderTableView.delegate = self;
        
        _orderTableView.dataSource = self;
        
        [self.view addSubview:_orderTableView];
        
        [tableViewArray addObject:_orderTableView];
    }

    //添加导航条(订单类型切换.查询按钮)
    [self OrderNavBar];
    
    //添加滚动导航栏栏
    [self OrderXlScrollView];
    
}


#pragma mark-获取数据
-(void)OrderGetData
{
    NSLog(@"%@",_orderType);
    
     _orderGetDataArr1 = [NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType}}} method:@"POST"];
        
    _orderGetDataArr1 = _orderGetDataArr1[0][@"content"][@"response"][@"orderlist"];
    
     NSLog(@"%@",_orderGetDataArr1);

    //判断订单的类型
    if ([_orderType isEqual:@"common"])
    {
        if (![_orderGetDataArr1 isEqual:@""])
        {
            //普通订单:待付款
            _orderGetDataArr2 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"1"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr2);
            
            //普通订单:待发货
             _orderGetDataArr3 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"2"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr3);
            
            //普通订单:待收货
             _orderGetDataArr4 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"3"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr4);
            
            //普通订单:待评价
             _orderGetDataArr5 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"5"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr5);
            
            //普通订单:退款/售后
             _orderGetDataArr6 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"0"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr6);
            
            
            orderDetailArray = [[NSMutableArray alloc]initWithObjects:_orderGetDataArr1,_orderGetDataArr2,_orderGetDataArr3,_orderGetDataArr4,_orderGetDataArr5,_orderGetDataArr6, nil];
            
        }
       
    }
    else if([_orderType isEqual:@"meeting"])
    {
        if (![_orderGetDataArr1 isEqual:@""])
        {
            //预定订单:待付款
            _orderGetDataArr2 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"1"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr2);
            
            //预定订单:已预定
            _orderGetDataArr3 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"6"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr3);
            
            //预定订单:已退款
            _orderGetDataArr4 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"7"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr4);
            
            orderDetailArray = [[NSMutableArray alloc]initWithObjects:_orderGetDataArr1,_orderGetDataArr2,_orderGetDataArr3,_orderGetDataArr4, nil];
        }

    }
    else if ([_orderType isEqual:@"makeup"])
    {
        if (![_orderGetDataArr1 isEqual:@""])
        {
            //佣金前置订单:待付款
            _orderGetDataArr2 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"1"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr2);
            
            //佣金前置订单:待发货
            _orderGetDataArr3 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"3"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr3);
            
            //佣金前置订单:待收货
            _orderGetDataArr4 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"4"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr4);
            
            //佣金前置订单:待评价
            _orderGetDataArr5 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"5"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr5);
            
            //佣金前置订单:待补差
            _orderGetDataArr6 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"8"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr6);
            
            
            orderDetailArray = [[NSMutableArray alloc]initWithObjects:_orderGetDataArr1,_orderGetDataArr2,_orderGetDataArr3,_orderGetDataArr4,_orderGetDataArr5,_orderGetDataArr6, nil];
            
            
        }

    }
    else if ([_orderType isEqual:@"morder"])
    {
        if (![_orderGetDataArr1 isEqual:@""])
        {
            //补差订单:待补差
            _orderGetDataArr2 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"1"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr2);
            
            //预定订单:已补差
            _orderGetDataArr3 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"2"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr3);
            
            //预定订单:待罚款
            _orderGetDataArr4 =[NSArray requestWithPath:@"my_data.php" params:@{@"content":@{@"request":@{@"want":@"orderlist",@"uid":_orderUserId,@"type":_orderType,@"state":@"10"}}} method:@"POST"];
            
            NSLog(@"%@",_orderGetDataArr4);
            
            orderDetailArray = [[NSMutableArray alloc]initWithObjects:_orderGetDataArr1,_orderGetDataArr2,_orderGetDataArr3,_orderGetDataArr4, nil];
        }

    }
}


#pragma mark-滚动导航条
-(XLScrollViewer *)OrderXlScrollView
{
    if (_orderXlScrollView == nil)
    {
        XLScrollViewer *scrollView = [XLScrollViewer scrollWithFrame:CGRectMake(0, 69, kWidth, kHeight-69) withViews:tableViewArray withButtonNames:_orderStateMutableArr withThreeAnimation:211];
        
        scrollView.xl_topBackColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        scrollView.xl_isMoveSlider = YES;
        
        scrollView.xl_sliderHeight = 8 ;

        scrollView.xl_sliderColor = [UIColor redColor];

        scrollView.xl_buttonColorNormal = [UIColor blackColor];

        scrollView.xl_buttonColorSelected = [UIColor redColor];

        scrollView.xl_buttonFont = 15;

        scrollView.xl_sliderHeight =30;

        scrollView.xl_topHeight =40;

         scrollView.xl_isSliderCorner =YES;

        scrollView.xl_buttonToSlider = 3;
        
        [self.view addSubview:scrollView];
    }
    return _orderXlScrollView;
}

#pragma mark-添加导航条
-(NavigationBar *)OrderNavBar
{
    if (_orderNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:navBar];
        
        navBar.animated = YES;
        
        [navBar addNavigationBar:_orderTypeBtnTitleStr NavigationController:self.orderListNavController];
        
        _orderNavBar = navBar;
    }
    
    return _orderNavBar;
}



#pragma mark-订单切换按钮
-(UIButton *)OrderTypeBtn
{
    if (_orderTypeBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_orderNavBar.frame.size.width/3, 20, _orderNavBar.frame.size.width/3, _orderNavBar.frame.size.height-20)];
        
        if (_orderTypeBtnTitleStr != nil)
        {
            [btn setTitle:_orderTypeBtnTitleStr forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitle:@"全部订单" forState:UIControlStateNormal];
        }
       
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(OrderTypeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_orderNavBar addSubview:btn];
        
        _orderTypeBtn = btn;
    }
    return _orderTypeBtn;
}

#pragma mark-全部订单的响应方法

-(void)OrderTypeBtnClick: (UIButton *)sender
{

    [KxMenu showMenuInView:self.view
                  fromRect:sender.frame
                 menuItems:mutableArray];
}

-(void)AllBtnClcik: (KxMenuItem *)sender
{
    [_orderTypeBtn setTitle:sender.title forState:UIControlStateNormal];
}

-(void)NO1BtnClick: (KxMenuItem *)sender
{
    [_orderTypeBtn setTitle:sender.title forState:UIControlStateNormal];
}

-(void)NO2BtnClick: (KxMenuItem *)sender
{
    [_orderTypeBtn setTitle:sender.title forState:UIControlStateNormal];
}


#pragma mark- 订单搜索按钮
-(UIButton *)OrderSearchBtn
{
    if (_orderSearchBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_orderNavBar.frame.size.width*3/4, 20, _orderNavBar.frame.size.width/4, _orderNavBar.frame.size.height-20)];
        
        [btn setTitle:@"搜索" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [_orderNavBar addSubview:btn];
    }
    return _orderSearchBtn;
}




#pragma mark-订单详情
-(UITableView *)OrderTableView
{
    if (_orderTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)style:UITableViewStyleGrouped];
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        _orderTableView = tableView;
    }
    return _orderTableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [orderDetailArray[section][0][@"product"]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[OrderListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dic = orderDetailArray[indexPath.section][0];
    
    [cell.orderGoodsIcon sd_setImageWithURL:dic[@"product"][indexPath.row][@"pic"]];
    
    cell.orderGoodsName .text = dic[@"product"][indexPath.row][@"name"];
    
    cell.orderGoodsPrice.text = [NSString stringWithFormat:@"¥ %@",dic[@"product"][indexPath.row][@"price"]];
    
    cell.orderGoodsNumber.text =[NSString stringWithFormat:@"X%@",dic[@"product"][indexPath.row][@"num"]];

    
    return cell;
}


#pragma mark-tableView 的头部
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,tableView.frame.size.width, 40)];
        
    [tableView addSubview:view];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width/2, 40)];
    
    [btn setTitle:[NSString stringWithFormat:@"%@ >",orderDetailArray[section][0][@"company"]] forState:UIControlStateNormal];
    
    [btn setTitle:@"" forState:UIControlStateHighlighted];
    
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    btn.titleLabel.font = kLabelFont;
    
    [view addSubview:btn];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width/2, 0,view.frame.size.width/2,40)];
    
    label.text = orderDetailArray[section][0][@"statu_text"];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = kLabelFont;
    
    label.textColor = [UIColor redColor];
    
    [view addSubview:label];
    
    return view;
}


#pragma mark-tableView 尾部
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
   _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    
    _backgroundView .backgroundColor = [UIColor whiteColor];
    
    [tableView addSubview:_backgroundView];
    
    //订单底部商品结算
    UILabel *goodsSumLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _backgroundView.frame.size.width,  _backgroundView.frame.size.height/2)];
    
    goodsSumLabel.layer.borderColor = kBgColor.CGColor;
    
    goodsSumLabel.layer.borderWidth = 1;
    
    goodsSumLabel.font = kLabelFont;
    
//    goodsSumLabel.text = [NSString stringWithFormat:@"共有%lu件商品  合计:¥%@(含运费¥%@)",[orderDetailArray[section][@"order_detail"]count],orderDetailArray[section][@"footer"][@"goods_sumprice"],orderDetailArray[section][@"footer"][@"goods_freight"]];
    
    goodsSumLabel.textAlignment = NSTextAlignmentRight;
    
    [_backgroundView addSubview:goodsSumLabel];
    
    
    return _backgroundView;
}

#warning mark-根据订单的不同确定按钮的数量及类别

#pragma mark-订单操作条
-(UIView *)OrderFunctionView
{
    if (_orderfunctionView == nil)
    {
        UIView *orderFunctionView = [[UIView alloc]initWithFrame:CGRectMake(0, _backgroundView.frame.size.height/2, _backgroundView.frame.size.width,  _backgroundView.frame.size.height/2)];
        
        [_backgroundView addSubview:orderFunctionView];
        
        _orderfunctionView = orderFunctionView;
    }
    return _orderfunctionView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
