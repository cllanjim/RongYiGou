//
//  Register5Controller.m
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Register5Controller.h"
#import "Register6Controller.h"

@interface Register5Controller ()
{
    
    float Reg5YHeight;
    
    NSArray *_reg5TitleArray;
    
    UIButton *selectBtn;
}
@end

@implementation Register5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    //添加导航条
    [self Reg5NavBar];
    
    //添加内容
    [self Reg5IconBtn];
    
    [self Reg5IdBtn];
    
    [self Reg5TypeBtn];
    
    [self Reg5TaxBtn];
    
    [self Reg5rganizationBtn];
    
    [self Reg5PermitBtn];
    
    [self Reg5NextBtn];
    
}

#pragma mark-添加导航条
-(NavigationBar *)Reg5NavBar
{
    if (_reg5NavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [self.view addSubview:navBar];
        
        [navBar addNavigationBar:@"注册" NavigationController:_reg5NavController];
        
        navBar.animated = NO;
        
        _reg5NavBar = navBar;
    }
    
    Reg5YHeight += 69;
    return _reg5NavBar;
}


#pragma mark-添加内容

#pragma mark-营业执照
-(UIButton *)Reg5IconBtn
{
    if (_reg5IconBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight + 50, kWidth/3-30,kHeight/20)];
        
        label.text = @"营业执照";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , Reg5YHeight+50, kWidth*2/3-30, kHeight/20)];
        
        [btn setTitle:@"上传" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(Reg5IconBtnClick) forControlEvents:UIControlEventTouchUpInside];
       
        [self.view addSubview:btn];
        
        _reg5IconBtn = btn;
        
        Reg5YHeight += 50 + kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 10;
    }
    return _reg5IconBtn;
}

#pragma mark-上传营业执照
-(void)Reg5IconBtnClick
{
    
}


#pragma mark-法人身份证
-(UIButton *)Reg5IdBtn
{
    if (_reg5IdBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"法人身份证";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , Reg5YHeight, kWidth*2/3-30, kHeight/20)];
        
        [btn setTitle:@"上传" forState:UIControlStateNormal];
        
         [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(Reg5IdBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg5IdBtn = btn;
        
        Reg5YHeight += kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 10;
    }
    return _reg5IdBtn;
}

#pragma mark-上传法人身份证
-(void)Reg5IdBtnClick
{
    
}

#pragma mark-证件类型
-(UIButton *)Reg5TypeBtn
{
    if (_reg5TypeBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"证件类型";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        for (int i = 0; i < 2; i ++)
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/2 + i *(kHeight/20 + kWidth/7), Reg5YHeight + kHeight/120, kHeight/30, kHeight/30)];
            
            btn.backgroundColor = [UIColor lightGrayColor];
            
            btn.tag = 200 + i;
            
            btn.layer.cornerRadius = kHeight/60;
            
            [btn setBackgroundImage:[UIImage imageNamed:@"SelectBtnBackground.png"] forState:UIControlStateSelected];
    
            btn.imageView.layer.cornerRadius = kHeight/60;
            
            btn.imageView.layer.masksToBounds = YES;
            
            [btn addTarget:self action:@selector(BtnSelectClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn];
            
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2 + i *(kHeight/20 + kWidth/7) + kHeight/20, Reg5YHeight,kWidth/8 ,kHeight/20)];
            
            label.font = kLabelFont;
            
            label.textColor = [UIColor lightGrayColor];
            
            if (i == 0)
            {
                label.text = @"对公";
            }
            else
            {
                label.text = @"对私";
            }
            
            [self.view addSubview:label];
        }
        
        Reg5YHeight += kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 10;
    }
    return _reg5TypeBtn;
}

#pragma mark-对公对私选择按钮
-(void)BtnSelectClick:(UIButton *)sender
{
    if (sender != selectBtn)
    {
        selectBtn.selected = NO;
        
        selectBtn = sender;
    }
    
    selectBtn.selected = YES;
}


#pragma mark-税务登记证
-(UIButton *)Reg5TaxBtn
{
    if (_reg5TaxBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"税务登记证";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , Reg5YHeight, kWidth*2/3-30, kHeight/20)];
        
        [btn setTitle:@"上传" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(Reg5TaxBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg5TaxBtn = btn;
        
        Reg5YHeight +=kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 10;
    }
    return _reg5TaxBtn;
}

#pragma mark-上传税务登记证
-(void)Reg5TaxBtnClick
{
    
}

#pragma-mark-组织机构代码
-(UIButton *)Reg5rganizationBtn
{
    if (_reg5rganizationBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"组织机构代码";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , Reg5YHeight, kWidth*2/3-30, kHeight/20)];
        
        [btn setTitle:@"上传" forState:UIControlStateNormal];
        
         [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(Reg5rganizationBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg5rganizationBtn = btn;
        
        Reg5YHeight += kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 10;
    }
    return _reg5rganizationBtn;
}

#pragma mark-组织机构代码
-(void)Reg5rganizationBtnClick
{
    
}

#pragma mark-开户许可证
-(UIButton *)Reg5PermitBtn
{
    if (_reg5PermitBtn == nil)
    {
        //标题
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, Reg5YHeight, kWidth/3-30,kHeight/20)];
        
        label.text = @"开户许可证";
        
        label.adjustsFontSizeToFitWidth = YES;
        
        label.font = kLabelFont;
        
        label.textColor = [UIColor lightGrayColor];
        
        [self.view addSubview:label];
        
        //输入框
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/3 , Reg5YHeight, kWidth*2/3-30, kHeight/20)];
        
        [btn setTitle:@"上传" forState:UIControlStateNormal];
        
         [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font = kLabelFont;
        
        [btn addTarget:self action:@selector(Reg5PermitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg5PermitBtn = btn;
        
        Reg5YHeight +=kHeight/20 + 10;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, Reg5YHeight , kCellWidth-40, 1)];
        
        image.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:image];
        
        Reg5YHeight += 40;
    }
    return _reg5PermitBtn;
}

#pragma mark-开户许可证
-(void)Reg5PermitBtnClick
{
    
}

#pragma mark-NextBtn
-(UIButton *)Reg5NextBtn
{
    if (_reg5NextBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, Reg5YHeight, kWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(Reg5NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
        _reg5NextBtn = btn;
    }
    return _reg5NextBtn;
}

#pragma mark-下一步按钮的响应方法
-(void)Reg5NextBtnClick
{
    
    GlobalInformation *global = [GlobalInformation shareManager];
    
    _reg5AccountName = global.AccountName;
    
    _reg5AccountPassWord = global.AccountPassWord;
    
    
    NSLog(@"%@",self.reg5AccountName);
    
     NSLog(@"%@",self.reg5AccountPassWord);
    
     NSLog(@"%@",self.reg5AddressDictionary);
    
     NSLog(@"%@",self.reg5PersonName);
    
     NSLog(@"%@",self.reg5PersonNumber);

    
    Register6Controller *reg6 = [Register6Controller new];
    
    reg6.reg6NavController = self.reg5NavController;
    
    [self.reg5NavController pushViewController:reg6 animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
