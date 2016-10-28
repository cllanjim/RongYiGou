//
//  Register3Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register3Controller.h"
#import "Register4Controller.h"
#import "RrovinceSelectController.h"

@interface Register3Controller ()
{
    float YHeight;
    
    NSArray *titleArray;
    
    NSArray *textArray;
}
@end

@implementation Register3Controller

- (void)viewDidLoad {

    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
   titleArray = [[NSArray alloc]initWithObjects:@"详细地址",@"公司全称", nil];
    
   textArray = [[NSArray alloc]initWithObjects:@"街区",@"请输入公司全称", nil];

    
    //导航条
    [self NavigationBar];
    
    [self RegisterTextField];
    
    [self Reg3ExpandAddressTextField];
    
    [self Reg3CompanyNameTextField];
    
    [self Reg3NextBtn];
    
    if (_reg3AddressStr)
    {
        [_registerButton setTitle:_reg3AddressStr forState:UIControlStateNormal];
    }
    
}

#pragma mark-添加导航条
-(NavigationBar *)NavigationBar
{
    if (_navigationBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:nav];
        
        [nav addNavigationBar:@"注册" NavigationController:_reg3NavigationController1];
        
         nav.animated = NO;
        
        _navigationBar = nav;
    }
    
    YHeight += 69;
    
    return _navigationBar;
}

#pragma mark-地址选择条
-(UIButton *)RegisterTextField
{
    if (_registerButton == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight + 50, kWidth/3-30,kHeight/20)];
        
        label.text = @"区域地址";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , YHeight+50, kWidth*2/3-30, kHeight/20)];
                
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitle:@"省市区" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [btn addTarget:self action:@selector(RegisterButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
         _registerButton = btn;
        
        NSLog(@"%@",_registerButton);
        
        YHeight += 40 + kHeight/20 + 10;
        
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        YHeight += 10;
    }
    return _registerButton;
}

#pragma mark-详细地址
-(UITextField *)Reg3ExpandAddressTextField
{
    if (_reg3ExpandAddressTextField == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"详细地址";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 , YHeight, kWidth*2/3-30, kHeight/20)];
        
        textField.font = kLabelFont;
        
        textField.placeholder = @"街道等具体地址";
        
        [self.view addSubview:textField];
        
        _reg3ExpandAddressTextField = textField;
        
         YHeight += kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        YHeight += 10;
    }
    return _reg3ExpandAddressTextField;
}

#pragma mark-填写公司全称
-(UITextField *)Reg3CompanyNameTextField
{
    if (_reg3CompanyNameTextField == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30,YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"公司名称";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 , YHeight, kWidth*2/3-30, kHeight/20)];
        
        textField.font = kLabelFont;
        
        textField.placeholder = @"公司全称";
        
        [self.view addSubview:textField];
        
        _reg3CompanyNameTextField = textField;
        
        YHeight += kHeight/20 +20;
        
    }
    return _reg3CompanyNameTextField;
}

#pragma mark-下一步按钮
-(UIButton *)Reg3NextBtn
{
    if (_reg3NextBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(Reg3NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg3NextBtn = btn;
    }
    return _reg3NextBtn;
}

#pragma mark-省市区选择按钮
-(void)RegisterButtonClick
{
    RrovinceSelectController *province = [RrovinceSelectController new];
    
    province.provinceSelectNavController = self.reg3NavigationController;
    
    province.ControllerId = @"reg3";
    
    [self.reg3NavigationController pushViewController:province animated:NO];
}

#pragma mark-CountySelectDelegate方法的实现
-(void)CountySelect:(CountySelectController *)countySelect Address:(NSDictionary *)address
{
    _reg3Dictionary = address;
    
    _reg3AddressStr= [NSString stringWithFormat:@"%@%@%@",address[@"province"][@"name"],address[@"city"][@"name"],address[@"county"][@"name"]];
    
}

#pragma mark-下一步按钮的响应方法
-(void)Reg3NextBtnClick
{
    NSString *detailAddress = [NSString deleteSpace:_reg3ExpandAddressTextField.text];
    
    NSString *companyName = [NSString deleteSpace:_reg3CompanyNameTextField.text];
    
    NSLog(@"%@----%@----%@",_registerButton.titleLabel.text,detailAddress,companyName);
    
    if ([_reg3AddressStr isEqual:_registerButton.titleLabel.text])
    {
        if (![detailAddress isEqual:@""] && ![companyName isEqual:@""])
        {
            Register4Controller *reg4 = [Register4Controller new];
            
            reg4.reg4AddressDictionary = _reg3Dictionary;
            
            reg4.reg4NavController = self.navigationController;
            
            [self.reg3NavigationController1 pushViewController:reg4 animated:NO];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"请填写完整信息";
            
            hud.margin = 10.f;
            
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:1];
        }
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"请选择区域";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:1];
    }
   
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
