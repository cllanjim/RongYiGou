//
//  RetailerShopCodeController.m
//  RongYiGou
//
//  Created by mac on 16/3/23.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RetailerShopCodeController.h"

@interface RetailerShopCodeController ()<UITextFieldDelegate>

@end

@implementation RetailerShopCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];

    //获取导航条
    [self RetilerShopCodeNavBar];
    
    //提示语句
    [self RetilerShopLabel];
    
    //修改框
    [self RetilerShopTextField];
    
    //确定按钮
    [self RetilerShopButton];
    
}

#pragma mark-添加导航条
-(NavigationBar *)RetilerShopCodeNavBar
{
    if (_retilerShopCodeNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"销售门店编码修改" NavigationController:_retilerShopCodeNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _retilerShopCodeNavBar;
}


#pragma mark-添加提示语句
-(UILabel *)RetilerShopLabel
{
    if (_retilerShopLabel == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,109, self.view.frame.size.width/3, self.view.frame.size.height/15)];
        
        label.text = @"销售门店编码:";
        
        label.font = kLabelFont;
        
        label.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:label];
        
        _retilerShopLabel = label;
    }
    return _retilerShopLabel;
}


#pragma mark-添加输入框
-(UITextField *)RetilerShopTextField
{
    if (_retilerShopTextField == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2/5,109, self.view.frame.size.width*2.5/5, self.view.frame.size.height/15)];
        
        textField.placeholder = @"请如实填写";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [self.view addSubview:textField];
        
        _retilerShopTextField = textField;
    }
    return _retilerShopTextField;
}

#pragma mark-取消键盘的第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确定按钮
-(UIButton *)RetilerShopButton
{
    if (_retilerShopButton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, kHeight/2, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(RetilerShopButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _retilerShopButton = btn;
    }
    return _retilerShopButton;
}

#pragma mark-确定按钮的响应方法
-(void)RetilerShopButtonClick
{
    NSString * Str = [NSString deleteSpace:_retilerShopTextField.text];
    
    if (Str.length != 0)
    {
        _retilerSendRequestArr = [NSArray requestWithPath:@"user_data_edit.php" params:@{@"content":@{@"request":@{@"want":@"shop_code",@"value":Str,@"uid":_retilerShopUserId}}} method:@"POST"];
        
        NSLog(@"%@",_retilerSendRequestArr);
        
        if (_retilerSendRequestArr[0][@"content"][@"response"])
        {
            [self.retilerShopCodeNavController popViewControllerAnimated:YES];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"修改失败";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:2];
        }
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"编码不能为空";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
