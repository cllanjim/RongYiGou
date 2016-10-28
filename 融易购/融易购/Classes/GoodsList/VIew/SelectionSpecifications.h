//
//  SelectionSpecifications.h
//  RongYiGou
//
//  Created by mac on 16/1/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SelectionSpecifications : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *price;

@property(nonatomic,strong)UILabel *stock;

@property(nonatomic,strong)UILabel *selectInformation;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UILabel *numberTitle;

@property(nonatomic,strong)UIButton *reduce;

@property(nonatomic,strong)UIButton * add;

@property (nonatomic,strong)UILabel *goodsNumber; //商品数量

@property (nonatomic,strong)UILabel *creditNumber;

@property (nonatomic,strong)UIButton *fuctionButton;

@property (nonatomic,strong)NSDictionary *selectionDataDic;

@property (nonatomic,strong)NSArray *attributeArr;

@property (nonatomic,strong)NSString *limitNum;

@property (nonatomic,strong)NSString *specId;  //规格ID

@property (nonatomic,strong)NSString *productId; //商品ID

@property (nonatomic,strong)NSArray *selectGetDataArr;

@property (nonatomic,strong)UIViewController *viewController;

@property (nonatomic,strong)NSDictionary *specDict;

-(void)addSpecification: (NSDictionary *)information Controller:(UIViewController *)viewController;

@end
