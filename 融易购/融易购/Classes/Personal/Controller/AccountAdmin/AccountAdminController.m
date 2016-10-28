//
//  AccountAdminController.m
//  RongYiGou
//
//  Created by mac on 16/1/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountAdminController.h"
#import "AccountCell.h"
#import "AccountInformationController.h"
#import "AccountCompanyInformationController.h"
#import "AccountUserNameController.h"
#import "ShowAddressController.h"
#import "AccountRetailerController.h"
#import "AccountContactController.h"
#import "RetailerCodeController.h"
#import "RetailerShopCodeController.h"
#import "RetailerShopNameController.h"
#import "QQNumberController.h"
#import "WeChatNumberController.h"
#import "PhoneNumberController.h"
#import "EmailNumberController.h"


@interface AccountAdminController ()
{
    NSArray *array;
    
    UIImageView *iconImageView;
    
    NSUInteger _sourceType;
    
    BOOL isFullScreen;
}
@end

@implementation AccountAdminController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取plist文件信息
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AccountInformation" ofType:@"plist" ];
    
    array = [[NSArray alloc]initWithContentsOfFile:path];
    
     //获取数据
    [self AccountGetData];

    //添加导航条
    [self AccountNavBar];
    //账户内容
    [self AccountTableView];
}

#pragma mark-加载数据
-(void)AccountGetData
{
    _accountGetDataArr = [NSArray requestWithPath:@"user_info.php" params:@{@"content":@{@"request":@{@"uid":_UserId}}} method:@"POST"];

    
    _accountGetDataDic = _accountGetDataArr[0][@"content"][@"response"];
}


#pragma mark-添加导航条
-(NavigationBar *)AccountNavBar
{
    if (_accountNavBar == nil)
    {
        NavigationBar *nav = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, kWidth, 69)];
        
        [nav addNavigationBar:@"我的账户" NavigationController:_accountNavController];
        
        nav.animated = YES;
        
        [self.view addSubview:nav];
        
        _accountNavBar = nav;
    }
    return _accountNavBar;
}


#pragma mark-账户内容展示
-(UITableView *)AccountTableView
{
    if (_accountTableView == nil)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, kWidth, kHeight-69-44)];
    
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
       [self.view addSubview:tableView];
    }
    return _accountTableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[AccountCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        cell.layer.borderWidth = 0.4;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }

    cell.accountInformationDict = [array objectAtIndex:indexPath.row];
    
    cell.accountTitleLabel.text = [[array objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    cell.accountTextLabel.text = [[array objectAtIndex:indexPath.row] objectForKey:@"text"];
    
    return cell;
}

#pragma mark-设置Cell的背景图片
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

//    cell.backgroundColor = kBgColor;

}

#pragma mark-Cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
           
            [self AccountImageBtnClick];
        }
            break;
        case 1:
        {
            AccountInformationController *baseInformation = [AccountInformationController new];
            
            baseInformation.accountInformationNavController = self.accountNavController;
            
            baseInformation.accountInforationArr = _accountGetDataDic[@"user_info"];
            
            [self.accountNavController pushViewController:baseInformation animated:YES];
        }
            break;
        case 2:
        {
            AccountCompanyInformationController *company = [AccountCompanyInformationController new];
            
            company.accountCompanyNavController = self.accountNavController;
            
            company.accountCompanyArr = _accountGetDataDic[@"company_info"];
            
            [self.navigationController pushViewController:company animated:YES];
        }
            break;
        case 3:
        {
            AccountUserNameController *userName = [AccountUserNameController new];
            
            userName.accountUserNameNavController = self.accountNavController;
            
            userName.accountUserId = self.UserId;
            
            [self.accountNavController pushViewController:userName animated:YES];
        }
            break;
            
        case 4:
        {
            AccountRetailerController *accountRetailer = [AccountRetailerController new];
            
            accountRetailer.accountRetailerNavController = self.accountNavController;
            
            accountRetailer.accountRetailUserId = self.UserId;
            
            [self.accountNavController pushViewController:accountRetailer animated:YES];
        }
            break;
            
        case 5:
        {
            AccountContactController *contact = [AccountContactController new];
            
            contact.accountContactNavController = self.accountNavController;
            
            contact.accountSexUserId = self.UserId;
            
            [self.accountNavController pushViewController:contact animated:YES];
        }
            break;
            
        case 6:
        {
            
            ShowAddressController *addAddress = [ShowAddressController new];
            
            addAddress.showAddressNavController = self.accountNavController;
            
            addAddress.showUserId = self.UserId;
            
            [self.accountNavController pushViewController:addAddress animated:YES];
            
        }
            break;
        case 7:
        {
            RetailerCodeController *code = [RetailerCodeController new];
            
            code.retilerCodeNavController = self.accountNavController;
            
            code.retilerUserId = self.UserId;
            
            [self.accountNavController pushViewController:code animated:YES];
        }
            break;
        case 8:
        {
            RetailerShopCodeController *shopCode = [RetailerShopCodeController new];
            
            shopCode.retilerShopCodeNavController = self.accountNavController;
            
            shopCode.retilerShopUserId = self.UserId;
            
            [self.accountNavController pushViewController:shopCode animated:YES];
        }
            break;
        case 9:
        {
            RetailerShopNameController *shopName = [RetailerShopNameController new];
            
            shopName.retilerShopNameNavController = self.accountNavController;
            
            shopName.retilerShopNameUserId = self.UserId;
            
            [self.accountNavController pushViewController:shopName animated:YES];
        }
            break;
        case 10:
        {
            QQNumberController *QQNumber = [QQNumberController new];
            
            QQNumber.QQNumberNavController = self.accountNavController;
            
            QQNumber.QQNumberUserId = self.UserId;
            
            [self.accountNavController pushViewController:QQNumber animated:YES];
            
        }
            break;
        case 11:
        {
            WeChatNumberController *weChat = [WeChatNumberController new];
            
            weChat.weChatNavController = self.accountNavController;
            
            weChat.weChatUserId = self.UserId;
            
            [self.accountNavController pushViewController:weChat animated:YES];
        }
            break;
        case 12:
        {
            PhoneNumberController *phoneNumber = [PhoneNumberController new];
            
            phoneNumber.phoneNumberNavController = self.accountNavController;
            
            phoneNumber.phoneNumberUserId = self.UserId;
            
            [self.accountNavController pushViewController:phoneNumber animated:YES];
        }
            break;
        case 13:
        {
            EmailNumberController *emailNumber = [EmailNumberController new];
            
            emailNumber.emailNumberNavController = self.accountNavController;
            
            emailNumber.emailNumberUserId = self.UserId;
            
            [self.accountNavController pushViewController:emailNumber animated:YES];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark-点击上传按钮的响应方法
-(void)AccountImageBtnClick
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"添加图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        //支持拍照
        [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            _sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self ImagePicker:_sourceType];
            
        }]];
        
        //支持相册
        [alertController addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            _sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self ImagePicker:_sourceType];
            
        }]];
        
    }
    else
    {
        //支持相册
        [alertController addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            _sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self ImagePicker:_sourceType];
            
        }]];
        
    }
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark-跳转到相机或相机页面
-(void)ImagePicker:(NSUInteger)sourceType
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.allowsEditing = YES;
    
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    isFullScreen = NO;
    [iconImageView setImage:savedImage];
    
    iconImageView.tag = 100;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    
    // 获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
