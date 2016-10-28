//
//  OrderDetailsCell.h
//  RongYiGou
//
//  Created by mac on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoppingCartModel,ShopOrderModel;



@protocol OrderDetailCellDelegate <NSObject>

-(void)btnClick:(UITableViewCell *)cell andFlay:(int)flay;

@end


@interface OrderDetailsCell : UITableViewCell


@property (nonatomic,strong)UIButton *selectBtn;

@property (nonatomic,strong)UIImageView *iconImage;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UIButton *reduceBtn;

@property (nonatomic,strong)UILabel *priceLabel;

@property (nonatomic,strong)UIButton *addBtn;

@property (nonatomic,strong)UIButton *parameterBtn;

@property (nonatomic,strong)UILabel *numberLabel;

@property(assign,nonatomic)BOOL selectState;//选中状态

@property (assign,nonatomic)id<OrderDetailCellDelegate>delegate;

@property (nonatomic,strong)UIScrollView *specScrollView;  //用于展示单个商品的规格属性

@property (nonatomic,strong)UITableView *specTableView; //接受主页面传回的tableview

@property (nonatomic,strong)NSArray *specArr;


//建模型方式
-(void)AddTheValue:(ShoppingCartModel *)goodModel TableView:(UITableView *)tableView;


@end
