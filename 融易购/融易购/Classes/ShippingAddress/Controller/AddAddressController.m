//
//  AddAddressController.m
//  RongYiGou
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AddAddressController.h"
#import "RrovinceSelectController.h"
#import "CountySelectController.h"
#import "GlobalInformation.h"

@interface AddAddressController ()<UITextFieldDelegate>
{
    NSArray *addAddressNameArray;
    
    NSArray *addAddressAccountArray;
    
    UIButton *_addAddressSelectBtn;
    
    BOOL whether;
    
    int index;
}
@end

@implementation AddAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    addAddressNameArray = [[NSArray alloc]initWithObjects:@"省/市/县:",@"姓名:",@"电话号码:",@"详细信息:",@"邮政编码:",@"CRM仓储编码:",@"设为默认收货地址:", nil];
    
    addAddressAccountArray = [[NSArray alloc]initWithObjects:@"收货人姓名",@"收货人电话号码",@"请输入省份",@"越详细越好",@"请输入所在地的邮政编码",@"输入CRM仓储编码", nil];
    
    _defaultAddressStr = @"1";
    
    GlobalInformation *global = [GlobalInformation shareManager];
    
    _addUserId = global.userId;
    
    
    
    //添加导航栏
    [self AddAddressNavBar];
   
    //底层滚动视图
    [self AddAddressScrollView];
    
    //确定按钮
    [self AddAddressButton];
    
    if (index)
    {
        [_addButtonProvince setTitle:[NSString stringWithFormat:@"%@%@%@",_areaAddressDic[@"province"][@"name"],_areaAddressDic[@"city"][@"name"],_areaAddressDic[@"county"][@"name"]] forState:UIControlStateNormal];
    }
    
    
}

#pragma mark-添加导航栏
-(NavigationBar *)AddAddressNavBar
{
    if (_addAddressNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 69)];
        
        [nav addNavigationBar:@"收货地址编辑" NavigationController:_addAddressNavController];
        
        nav.animated = YES;
        
        [self.view addSubview:nav];
        
        _addAddressNavBar = nav;
    }
    return _addAddressNavBar;
}

#pragma mark-底层ScrollView
-(UIScrollView *)AddAddressScrollView
{
    if (_addAddressScrollView == nil)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 69, self.view.frame.size.width, self.view.frame.size.height-69-44)];
        
        [self.view addSubview:scrollView];
        
        _addAddressScrollView = scrollView;
    }
    
    //提示信息
    [self AddAddressLabel];
    
    //填写框
    [self AddTextFieldName];
    
    [self AddtextFieldNumber];
    
    [self AddButtonProvince];
    
    [self AddTextFieldOtherAddress];
    
    [self AddtextFieldPostCode];
    
    [self AddtextFieldCRM];
    
    //选项按钮
    [self AddAddressSelectBtn];
    
    return _addAddressScrollView;
}

#pragma mark-提示信息
-(UILabel *)AddAddressLabel
{
    if (_addAddressLabel == nil)
    {
        for (int i = 0; i < addAddressNameArray.count; i ++)
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,20 + i *  _addAddressScrollView.frame.size.height/10, _addAddressScrollView.frame.size.width/3, _addAddressScrollView.frame.size.height/15)];
            
            label.text = [addAddressNameArray objectAtIndex:i];
            
            label.font = kLabelFont;
            
            label.textAlignment = NSTextAlignmentRight;
            
            [_addAddressScrollView addSubview:label];
            
            _addAddressLabel = label;
        }
    }
    return _addAddressLabel;
}

#pragma mark-收货人姓名
-(UITextField *)AddTextFieldName
{
    if (_addTextFieldName == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 +  1 *  _addAddressScrollView.frame.size.height/10 , _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        textField.placeholder = @"收货人姓名";
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_addAddressScrollView addSubview:textField];
        
        _addTextFieldName = textField;
    }
    return _addTextFieldName;
}


#pragma mark-电话号码
-(UITextField *)AddtextFieldNumber
{
    if (_addtextFieldNumber == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 + 2 *  _addAddressScrollView.frame.size.height/10, _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        textField.placeholder = [addAddressAccountArray objectAtIndex:1];
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_addAddressScrollView addSubview:textField];
        
        _addtextFieldNumber = textField;
    }
    return _addtextFieldNumber;
}

#pragma mark-省
-(UIButton *)AddButtonProvince
{
    if (_addButtonProvince == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20, _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        [btn setTitle:@"省/市/区" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
         btn.titleLabel.font = kLabelFont;
        
        btn.layer.cornerRadius = 5;
        
        btn.layer.borderColor = kBgColor.CGColor;
        
        btn.layer.borderWidth = 1;
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [btn addTarget:self action:@selector(AddButtonProvinceClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_addAddressScrollView addSubview:btn];
        
        _addButtonProvince = btn;

    }
    return _addButtonProvince;
}


#pragma mark-获取省市县信息
-(void)AddButtonProvinceClick
{
    RrovinceSelectController *province = [RrovinceSelectController new];
    
    province.provinceSelectNavController = self.addAddressNavController;
    
    province.ControllerId = @"addAddress";
    
    [self.addAddressNavController pushViewController:province animated:NO];
}

#pragma mark-详细信息
-(UITextField *)AddTextFieldOtherAddress
{
    if (_addTextFieldOtherAddress == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 + 3 *  _addAddressScrollView.frame.size.height/10, _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        textField.placeholder = [addAddressAccountArray objectAtIndex:3];
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_addAddressScrollView addSubview:textField];
        
        _addTextFieldOtherAddress = textField;
        
    }
    return _addTextFieldOtherAddress;
}

#pragma mark-邮政编码
-(UITextField *)AddtextFieldPostCode
{
    if (_addtextFieldPostCode == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 + 4 *  _addAddressScrollView.frame.size.height/10, _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        textField.placeholder = [addAddressAccountArray objectAtIndex:4];
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_addAddressScrollView addSubview:textField];
        
        _addtextFieldPostCode = textField;
    }
    return _addtextFieldPostCode;
}

#pragma mark-CRM仓储编码
-(UITextField *)AddtextFieldCRM
{
    if (_addtextFieldCRM == nil)
    {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 + 5 *  _addAddressScrollView.frame.size.height/10, _addAddressScrollView.frame.size.width*2.5/5, _addAddressScrollView.frame.size.height/15)];
        
        textField.placeholder = [addAddressAccountArray objectAtIndex:5];
        
        textField.delegate = self;
        
        textField.font = kLabelFont;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_addAddressScrollView addSubview:textField];
        
        _addtextFieldCRM = textField;
    }
    return _addtextFieldCRM;
}


#pragma mark-选项按钮
-(UIButton *)AddAddressSelectBtn
{
    if (_addAddressSelectBtn == nil)
    {
        _addAddressSelectBtn = [[UIButton alloc]initWithFrame:CGRectMake(_addAddressScrollView.frame.size.width*2/5,20 + 6 *  _addAddressScrollView.frame.size.height/9.9, _addAddressScrollView.frame.size.height/20, _addAddressScrollView.frame.size.height/20)];
        
        _addAddressSelectBtn.backgroundColor = [UIColor lightGrayColor];
        
        [_addAddressSelectBtn addTarget:self action:@selector(addAddressSelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_addAddressScrollView addSubview:_addAddressSelectBtn];

    }
    return _addAddressSelectBtn;
}
#pragma mark-是否设为默认地址按钮的响应方法
-(void)addAddressSelectBtnClick:(UIButton *)sender
{
    whether = !whether;
    
    if (whether)
    {
        sender.backgroundColor = [UIColor redColor];
        
        _defaultAddressStr = @"2";
    }
    else
    {
        sender.backgroundColor = [UIColor lightGrayColor];
        
        _defaultAddressStr = @"1";
    }
}

#pragma mark-UITextField Delegate 方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark-确认按钮
-(UIButton *)AddAddressButton
{
    if (_addAddressButton == nil)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-74-69, self.view.frame.size.width-40, 40)];
        
        button.backgroundColor = [UIColor redColor];
        
        [button setTitle:@"确认" forState:UIControlStateNormal];
        
        [button setTitle:@"" forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(addAddressButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
        _addAddressButton = button;
    }
    return _addAddressButton;
}

#pragma mark-确认按钮的响应方法
-(void)addAddressButtonClick
{
    
    //收货人的姓名
    NSString *name = [NSString deleteSpace:_addTextFieldName.text];
    
    //收货人的手机号
    NSString *moblie = [NSString deleteSpace:_addtextFieldNumber.text];
    
    //省市区地址
    NSString *address = [NSString deleteSpace:_addTextFieldOtherAddress.text];
    
    //邮政编码
    NSString *postCode = [NSString deleteSpace:_addtextFieldPostCode.text];
    
    //CRM编码
    NSString *CRM = [NSString deleteSpace:_addtextFieldCRM.text];
    
    //地址
    NSString *Area = [NSString stringWithFormat:@"%@%@%@",_areaAddressDic[@"province"][@"name"],_areaAddressDic[@"city"][@"name"],_areaAddressDic[@"county"][@"name"]];

     
    if (name.length != 0 && moblie.length != 0 && address.length != 0 && postCode.length != 0 && CRM.length != 0)
    {
        _sendRequestArr = [NSArray requestWithPath:@"my_data_add.php" params:@{@"content":@{@"request":@{@"want":@"deliveryaddressadd",@"uid":_addUserId,@"name":name,@"mobile":moblie,@"provinceid":_areaAddressDic[@"province"][@"id"],@"cityid":_areaAddressDic[@"city"][@"id"],@"areaid":_areaAddressDic[@"county"][@"id"],@"area":Area,@"address":address,@"zip":postCode,@"crmcode":CRM,@"default":_defaultAddressStr}}} method:@"POST"];
        
        NSLog(@"%@",_sendRequestArr);
    }
    else
    {
        
    }
    
    
}

-(void)CountySelectAddress:(CountySelectController *)countySelect Address:(NSDictionary *)address
{
    _areaAddressDic = address;
    
    index ++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
