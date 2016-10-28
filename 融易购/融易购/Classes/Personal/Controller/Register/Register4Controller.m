//
//  Register4Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register4Controller.h"
#import "Register5Controller.h"

@interface Register4Controller ()
{
    
    float YHeight;
    
    NSArray *_reg4TitleArray;
    
    NSArray *_reg4TextArray;
}
@end

@implementation Register4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    _reg4TitleArray = [[NSArray alloc]initWithObjects:@"联系人",@"手机号码", nil];
    
    _reg4TextArray = [[NSArray alloc]initWithObjects:@"请输入真实姓名",@"可以正常使用的号码", nil];
    
    //添加导航条
    [self Reg4NavigationBar];
    
    //添加内容
    [self Reg4NameTextField];
    
    [self Reg4NumberTextField];
    
    [self Reg4NextBUtton];
}

#pragma mark-添加导航条
-(NavigationBar *)Reg4NavigationBar
{
    if (_reg4NavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:navBar];
        
         [navBar addNavigationBar:@"注册" NavigationController:_reg4NavController];
        
        navBar.animated = NO;
        
        _reg4NavBar = navBar;
    }
    
    YHeight += 69;
    return _reg4NavBar;
}

#pragma mark-添加内容

#pragma mark-联系人
-(UITextField *)Reg4NameTextField
{
    if (_reg4NameTextField == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight + 50, kWidth/3-30,kHeight/20)];
        
        label.text = @"联系人";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UITextField *btn = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 , YHeight+50, kWidth*2/3-30, kHeight/20)];
        
        btn.placeholder = @"请输入真实姓名";
        
        btn.font = kLabelFont;
        
        [self.view addSubview:btn];
        
        _reg4NameTextField = btn;
        
        
        YHeight += 40 + kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        YHeight += 10;
    }
    return _reg4NameTextField;
}

#pragma mark-手机号码
-(UITextField *)Reg4NumberTextField
{
    if (_reg4NumberTextField == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"手机号码";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3 , YHeight, kWidth*2/3-30, kHeight/20)];
        
        textField.font = kLabelFont;
        
        textField.placeholder = @"可以正常使用的号码";
        
        [self.view addSubview:textField];
        
        _reg4NumberTextField = textField;
        
        YHeight += kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        YHeight += 40;
    }
    return _reg4NumberTextField;
}


#pragma mark-下一步按钮
-(UIButton *)Reg4NextBUtton
{
    if (_reg4NextBUtton == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(Reg3NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg4NextBUtton = btn;
    }
    return _reg4NextBUtton;
}


#pragma mark-下一步按钮的响应方法
-(void)Reg3NextBtnClick
{
    
    NSString *personName = [NSString deleteSpace:_reg4NameTextField.text];
    
    NSString *number = [NSString deleteSpace:_reg4NumberTextField.text];
    
    
    if (![personName isEqual:@""] && ![number isEqual:@""])
    {
        Register5Controller *reg5 = [Register5Controller new];
        
        reg5.reg5NavController = self.reg4NavController;
        
        reg5.reg5AddressDictionary = self.reg4AddressDictionary;
        
        reg5.reg5PersonName = personName;
        
        reg5.reg5PersonNumber = number;
        
        [self.reg4NavController pushViewController:reg5 animated:NO];
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        hud.mode = MBProgressHUDModeText;
        
        hud.labelText = @"请完整填写信息";
        
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:1];
  
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
