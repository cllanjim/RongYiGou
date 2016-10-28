//
//  AccountBalanceView.m
//  RongYiGou
//
//  Created by mac on 16/2/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountBalanceView.h"

@interface AccountBalanceView()
{
    NSArray *blanceArray;
}
@end

@implementation AccountBalanceView

-(void)addAccountName:(NSString *)name AccountType:(NSString *)type AccountBlance:(NSDictionary *)blanceDic
{
    _accountName = name;
    
    _accountType = type;
    
    _accountBlanceDic = blanceDic;
    
    
    blanceArray = [[NSArray alloc]initWithObjects:@"账户余额:",@"可用余额:",@"待结算余额:",@"冻结余额:", nil];
    
    
    //账户类型
    [self AccountTypeLabel];
    
    //账户名称
    [self AccountNameLabel];
    
    //账户余额
    [self AccountBalanceLabel];
}
#pragma mark-添加账户类型
-(UILabel *)AccountTypeLabel
{
    if (_accountTypeLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-40, self.frame.size.height/6)];
        
        label.text = _accountType;
        
        
        [self addSubview:label];
    }
    return _accountTypeLabel;
}

#pragma mark-添加账户名字
-(UILabel *)AccountNameLabel
{
    if (_accountNameLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, self.frame.size.height/6, self.frame.size.width-40, self.frame.size.height/6)];
        
        if (_accountName.length)
        {
            label.text = [NSString stringWithFormat:@"账户: %@",_accountName];
        }
        else
        {
            label.text = @"账户:暂无";
        }
        
        
        
        [self addSubview:label];
        
        _accountNameLabel = label;
    }
    return _accountNameLabel;
}


#pragma mark-添加账户余额
-(void)AccountBalanceLabel
{
    if (_accountBalanceLabel == nil)
    {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, self.frame.size.height/3, self.frame.size.width-80, self.frame.size.height/6)];
    
            if (_accountBlanceDic != nil)
            {
                label.text =[NSString stringWithFormat:@"账户余额:%@",_accountBlanceDic[@"BALANCE"]];
            }
            else
            {
                label.text = @"账户余额:暂无";
            }
            
            
             UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, self.frame.size.height/3 +self.frame.size.height/6 , self.frame.size.width-80, self.frame.size.height/6)];
            
            if (_accountBlanceDic != nil)
            {
                label1.text = [NSString stringWithFormat:@"可用余额:%@",_accountBlanceDic[@"ACTIVEBALANCE"]];
            }
            else
            {
                label1.text = @"可用余额:暂无";
            }

            
            
             UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(40, self.frame.size.height/3 + 2*self.frame.size.height/6 , self.frame.size.width-80, self.frame.size.height/6)];
            
            if (_accountBlanceDic != nil)
            {
                label2.text = [NSString stringWithFormat:@"待结算余额:%@",_accountBlanceDic[@"settlement"]];
            }
            else
            {
                label2.text = @"待结算:暂无";

            }
            
             UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(40, self.frame.size.height/3 + 3*self.frame.size.height/6 , self.frame.size.width-80, self.frame.size.height/6)];
           
                
                
                if (_accountBlanceDic != nil)
                {
                    label3.text = [NSString stringWithFormat:@"冻结资金:%@",_accountBlanceDic[@"FROZENBALANCE"]];
                }
                else
                {
                    label3.text = @"冻结资金:暂无";
                }
        
        
            [self addSubview:label];
            
            [self addSubview:label1];
            
            [self addSubview:label2];
            
            [self addSubview:label3];
            
       
    }
  
   
}

@end
