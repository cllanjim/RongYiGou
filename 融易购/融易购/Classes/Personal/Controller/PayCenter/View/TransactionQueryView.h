//
//  TransactionQueryView.h
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionQueryView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tradeTableView;

-(void)addTitle: (NSDictionary *)title Content:(NSArray *)content;

@end
