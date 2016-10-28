//
//  PayBoundController.m
//  RongYiGou
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PayBoundController.h"

@interface PayBoundController ()
{
    NSArray *payBoundLabelArr;
    
    NSArray *payBoundTextFieldArr;
}
@end

@implementation PayBoundController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self PayBoundNavBar];
    
    //提示语
    [self PayBoundLabel];
    
    //用户名展示
    [self PayBoundName];
    
    //信息展示
    [self PayBoundTextField1];
    
    [self PayBoundTextField2];
    
    //确认按钮
    [self PayBoundButton];
}

#pragma mark-添加导航条
-(NavigationBar *)PayBoundNavBar
{
    if (_payBoundNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"翼支付绑定" NavigationController:_payBoundNavController];
        
         navBar.animated = YES;
        
        [self.view addSubview:navBar];
        
        _payBoundNavBar = navBar;
    }
    return _payBoundNavBar;
}

#pragma mark-设置提示语
-(UILabel *)PayBoundLabel
{
    payBoundLabelArr = @[@"用户名:",@"设置对公账户:",@"设置对私账户:"];
    
    if (_payBoundLabel == nil)
    {
        for (int i = 0; i < payBoundLabelArr.count; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeight/6 + i * kHeight/8, kWidth/2, kHeight/15)];
            
            label.text = [payBoundLabelArr objectAtIndex:i];
            
            label.textAlignment = NSTextAlignmentCenter;
            
            [self.view addSubview:label];
            
            _payBoundLabel = label;
            
        }
    }
    return _payBoundLabel;
}


#pragma mark-用户名
-(UILabel *)PayBoundName
{
    if (_payBoundName == nil )
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2, kHeight/6, kWidth/2, kHeight/15)];
        
        label.text = @"1*******788743309";
        
        [self.view addSubview:label];
    }
    return _payBoundName;
}


#pragma mark-信息展示
-(UITextField *)PayBoundTextField1
{
    if (_payBoundTextField1 == nil)
    {
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/2,kHeight/6 + kHeight/8, kWidth/2.5, kHeight/15)];
        
        text.delegate = self;
        
        text.borderStyle = UITextBorderStyleRoundedRect;
        
        text.placeholder = @"请输入对公账户";
        
        text.font = kLabelFont;
        
        [self.view addSubview:text];
        
        _payBoundTextField1 = text;
    }
    return _payBoundTextField1;
}

#pragma mark-对私账户
-(UITextField *)PayBoundTextField2
{
    if (_payBoundTextField2 == nil)
    {
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/2,kHeight/6 + 2 *kHeight/8, kWidth/2.5, kHeight/15)];
        
        text.delegate = self;
        
        text.borderStyle = UITextBorderStyleRoundedRect;
        
        text.placeholder = @"请输入对私账户";
        
        text.font = kLabelFont;
        
        [self.view addSubview:text];
        
        _payBoundTextField2 = text;
 
    }
    return _payBoundTextField2;
}

#pragma mark-确认按钮
-(UIButton *)PayBoundButton
{
    if (_payBoundButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(30, kHeight*3/5, kWidth-60, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(PayBoundButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
    }
    return _payBoundButton;
}


#pragma mark-确认按钮的响应方法
-(void)PayBoundButtonClick
{
    NSString *accountPublicStr = [NSString deleteSpace:_payBoundTextField1.text];
    
    NSString *accountPrivateStr = [NSString deleteSpace:_payBoundTextField2.text];
    
    _payBoundArr = [NSArray requestWithPath:@"pay.php" params:@{@"content":@{@"request":@{@"want":@"wing",@"uid":_payUserId,@"type":@"1",@"public":accountPublicStr,@"private":accountPrivateStr}}} method:@"POST"];
    
    NSLog(@"%@",_payBoundArr);
}

#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
