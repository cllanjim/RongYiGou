//
//  RegisterView.m
//  RongYiGou
//
//  Created by mac on 16/1/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView()
{
    UIButton *_selectBtn;
}
@end


@implementation RegisterView

-(void)addRegisterView:(NSArray *)title TextArray:(NSArray *)text whetherTextfield:(BOOL)whether SelfNavController:(UINavigationController *)selfController NextNavController:(UIViewController *)nextController
{
    _titleArray = title;
    
    _textArray = text;
    
    _whether = whether;
    
    _selfController = selfController;
    
    _nextController = nextController;
    
    //标题
    [self TitleLabel];
    
    //下一步按钮
    [self NextBtn];
    
}
#pragma mark-标题
-(void)TitleLabel
{
    if (_titleLabel == nil)
    {
        for (int i = 0; i < _titleArray.count; i ++)
        {
            
            //标题
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, kCellHeight/20 + i *kCellHeight/13, kCellWidth/3-30,kCellHeight/20)];
            
            label.text = [_titleArray objectAtIndex:i];
            
            label.adjustsFontSizeToFitWidth = YES;
            
            label.font = kLabelFont;
            
            label.textColor = [UIColor lightGrayColor];
            
            [self addSubview:label];
            
            if (_whether)
            {
                //信息输入框
                UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(kCellWidth/3 , kCellHeight/20 + i * kCellHeight/13, kCellWidth*2/3-30, kCellHeight/20)];
                
                textfield.delegate = self;
                
                textfield.tag = 100 + i;
                
                textfield.font = kLabelFont;
                
                textfield.placeholder = [_textArray objectAtIndex:i];
                
                [self addSubview:textfield];
                
                _textField = textfield;

            }
            else
            {
                if (i != 2)
                {
                    //上传按钮
                    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kCellWidth/3 , kCellHeight/20 + i * kCellHeight/13, kCellWidth*2/3-30, kCellHeight/20)];
                    
                    [btn setTitle:@"上传" forState:UIControlStateNormal];
                    
                    [btn setTitle:@"" forState:UIControlStateHighlighted];
                    
                    btn.titleLabel.font = kLabelFont;
                    
                    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    
                    [self addSubview:btn];
                    
                    _uploadBtn = btn;

                }
                else
                {
                    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kCellWidth/3 , kCellHeight/20 + 2 * kCellHeight/13, kCellWidth*2/3-30, kCellHeight/20)];
                    
                    [self addSubview:view];
                    
                    for (int i = 0; i < 2; i ++)
                    {
                        
                        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(view.frame.size.width/4 + i * view.frame.size.width/2.9, 5, view.frame.size.height-10, view.frame.size.height-10)];
                        
                        
                        btn.backgroundColor = [UIColor brownColor];
                        
                    
                        [btn setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateSelected];
                    
                        btn.layer.cornerRadius =(view.frame.size.height-10)/2;
                        
                        [btn addTarget:self action:@selector(SelectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                        
                        [view addSubview:btn];
                        
                        
                        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((view.frame.size.width/4 + view.frame.size.height - 10) + i * view.frame.size.width/2.9 , 5, view.frame.size.width/3- view.frame.size.height + 10, view.frame.size.height-10)];
                        
                        label.font = kLabelFont;
                        
                        label.tag = 10 + i ;
                        
                        switch (label.tag)
                        {
                            case 10:
                            {
                                label.text = @"对公";
                            }
                                break;
                            case 11:
                            {
                                label.text = @"对私";
                            }
                                break;
                                
                            default:
                                break;
                        }
                        
                        label.textAlignment = NSTextAlignmentCenter;
                        
                        [view addSubview:label];
                        
                    }
                    
                }
            }
            
            //下方遮挡线
            if (i != _titleArray.count-1)
            {
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, kCellHeight/9 + i * kCellHeight/13, kCellWidth-40, 1)];
                
                image.backgroundColor = [UIColor lightGrayColor];
                
                [self addSubview:image];
            }
        }
    }
}


#pragma mark-对公对私选择按钮
-(void)SelectBtnClick :(UIButton *)sender
{
    if (sender != _selectBtn)
    {
        _selectBtn.selected=NO;
        
        _selectBtn = sender;
    }
    
    _selectBtn.selected = YES;
}


#pragma mark-下一步按钮
-(UIButton *)NextBtn
{
    if (_nextBtn == nil)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, _titleArray.count*kCellHeight/13 + kCellHeight/13, kCellWidth-40, 40)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [btn setTitle:@"下一步" forState:UIControlStateNormal];
        
        [btn setTitle:@"" forState:UIControlStateHighlighted];
        
        [self addSubview:btn];
        
        _nextBtn = btn;
    }
    return _nextBtn;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
}


@end
