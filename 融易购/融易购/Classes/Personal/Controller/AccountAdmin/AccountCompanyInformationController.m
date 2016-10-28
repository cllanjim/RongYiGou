//
//  AccountCompanyInformationController.m
//  RongYiGou
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountCompanyInformationController.h"

@interface AccountCompanyInformationController ()
{
    float YHeight;
}
@end

@implementation AccountCompanyInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加导航条
    [self AccountCompanyNavBar];
    
    //底部滚动视图
    [self AccountCompanyScrollView];
    
    //公司名称
    [self CompanyName];
    
    //公司地址
    [self CompanyAddress];
    
    //联系人
    [self CompanyPerson];
    
    //联系方式
    [self CompanyPhoneNumber];
    
    //身份证照片
    [self CompanyID0];
    
    //税务登记证
    [self CompanyID1];
    
    //组织结构代码证
    [self CompanyID2];

    //营业执照
    [self CompanyID3];
    
    
    _accountCompanyScrollView.contentSize = CGSizeMake(kWidth, YHeight + 60);
    
    
    
}
#pragma mark-添加导航条
-(NavigationBar *)AccountCompanyNavBar
{
    if (_accountCompanyNavBar == nil)
    {
        NavigationBar *navBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [navBar addNavigationBar:@"账户公司资料" NavigationController:_accountCompanyNavController];
        
        navBar.animated = YES;
        
        [self.view addSubview:navBar];
    }
    return _accountCompanyNavBar;
}
#pragma mark-底部滚动视图
-(UIScrollView *)AccountCompanyScrollView
{
    if (_accountCompanyScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69)];
        
        scrollView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:scrollView];
        
        _accountCompanyScrollView = scrollView;
    }
    return _accountCompanyScrollView;
}

#pragma mark-公司名称
-(UILabel*)CompanyName
{
    if (_companyName == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.text =[NSString stringWithFormat:@"公司名称:%@",_accountCompanyArr[0][@"company"]];
        
        label.font = kLabelFont;

        
        [_accountCompanyScrollView addSubview:label];
        
        _companyName = label;
    }
    
    YHeight +=_accountCompanyScrollView.frame.size.height/20 + 30;
    return _companyName;
}


#pragma mark-公司所在地
-(UILabel *)CompanyAddress
{
    if (_companyAddress == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/10)];
        
        label.text = [NSString stringWithFormat:@"公司地址:%@%@",_accountCompanyArr[0][@"company_area"],_accountCompanyArr[0][@"company_address"]];
        
        label.font = kLabelFont;
        
        label.numberOfLines = 0;
        
        [_accountCompanyScrollView addSubview:label];
        
        _companyAddress = label;
    }
    
    YHeight +=_accountCompanyScrollView.frame.size.height/10 + 10;
    
    return _companyAddress;
}


#pragma mark-联系人
-(UILabel *)CompanyPerson
{
    if (_companyPerson == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = [NSString stringWithFormat:@"联系人:%@",_accountCompanyArr[0][@"contact"]];
        
        [_accountCompanyScrollView addSubview:label];
        
        _companyPerson = label;
    }
    
    YHeight +=_accountCompanyScrollView.frame.size.height/20 + 10;
    
    return _companyPerson;
}


#pragma mark-联系电话
-(UILabel *)CompanyPhoneNumber
{
    if (_companyPhoneNumber == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = [NSString stringWithFormat:@"联系电话:%@",_accountCompanyArr[0][@"contact_tel"]];
        
        [_accountCompanyScrollView addSubview:label];
        
        _companyPhoneNumber = label;
    }
    
    YHeight +=_accountCompanyScrollView.frame.size.height/20 + 10;
    
    return _companyPhoneNumber;
}


#pragma mark-法人身份证
-(UIImageView *)CompanyID0
{
    if (_companyID0 == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = @"法人身份证:";
        
        [_accountCompanyScrollView addSubview:label];
        
        YHeight += _accountCompanyScrollView.frame.size.height/20;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, YHeight, kWidth, _accountCompanyScrollView.frame.size.height/6)];
        
        image.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.3];
        
         image.contentMode = UIViewContentModeScaleAspectFit;
        
        [image sd_setImageWithURL:_accountCompanyArr[0][@"legal_per"]];
        
        [_accountCompanyScrollView addSubview:image];
        
        _companyID0 = image;
    }
    
    YHeight += _accountCompanyScrollView.frame.size.height/6;
    
    return _companyID0;
}


#pragma mark-税务登记证
-(UIImageView *)CompanyID1
{
    if (_companyID1 == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = @"税务登记证:";
        
        [_accountCompanyScrollView addSubview:label];
        
        YHeight += _accountCompanyScrollView.frame.size.height/20;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, YHeight, kWidth, _accountCompanyScrollView.frame.size.height/6)];
        
         image.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.3];
        
         image.contentMode = UIViewContentModeScaleAspectFit;
        
        [image sd_setImageWithURL:_accountCompanyArr[0][@"swdj"]];
        
        [_accountCompanyScrollView addSubview:image];
        
        _companyID1 = image;
    }
    
    YHeight += _accountCompanyScrollView.frame.size.height/6;
    
    return _companyID1;
}


#pragma mark-组织结构代码

-(UIImageView *)CompanyID2
{
    if (_companyID2 == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = @"组织结构代码证:";
        
        [_accountCompanyScrollView addSubview:label];
        
        YHeight += _accountCompanyScrollView.frame.size.height/20;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, YHeight, kWidth, _accountCompanyScrollView.frame.size.height/6)];
        
        image.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.3];
        
         image.contentMode = UIViewContentModeScaleAspectFit;
        
        [image sd_setImageWithURL:_accountCompanyArr[0][@"zzjg"]];
        
        [_accountCompanyScrollView addSubview:image];
        
        _companyID2 = image;
    }
    
    YHeight += _accountCompanyScrollView.frame.size.height/6;
    
    return _companyID2;
}


#pragma mark-营业执照

-(UIImageView *)CompanyID3
{
    if (_companyID3 == nil)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, YHeight, kWidth-40, _accountCompanyScrollView.frame.size.height/20)];
        
        label.font = kLabelFont;
        
        label.text = @"营业执照:";
        
        [_accountCompanyScrollView addSubview:label];
        
        YHeight += _accountCompanyScrollView.frame.size.height/20;
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, YHeight, kWidth, _accountCompanyScrollView.frame.size.height/6)];
        
       image.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.3];
        
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [image sd_setImageWithURL:_accountCompanyArr[0][@"yyzz"]];
        
        [_accountCompanyScrollView addSubview:image];
        
        _companyID3 = image;
    }
    
    YHeight += _accountCompanyScrollView.frame.size.height/6;
    
    return _companyID3;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
