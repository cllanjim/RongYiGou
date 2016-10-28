//
//  RegisterView.h
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView<UITextFieldDelegate>

@property (nonatomic,strong)NSArray *titleArray;

@property (nonatomic,strong)NSArray *textArray;

@property (nonatomic,assign)BOOL whether;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UITextField *textField;

@property (nonatomic,strong)UIButton *uploadBtn;

@property (nonatomic,strong)UIImageView *threadImageView;

@property (nonatomic,strong)UIButton *nextBtn;

@property (nonatomic,strong)UINavigationController *selfController;

@property (nonatomic,strong)UIViewController *nextController;

//1.前面提示数组 2.是否为输入框

-(void)addRegisterView: (NSArray *)title TextArray:(NSArray *)text whetherTextfield: (BOOL)whether SelfNavController:(UINavigationController *)selfController NextNavController :(UIViewController *)nextController;

@end
