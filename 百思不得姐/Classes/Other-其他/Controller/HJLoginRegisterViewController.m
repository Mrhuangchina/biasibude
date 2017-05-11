//
//  HJLoginRegisterViewController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/3.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HJLoginRegisterViewController.h"

@interface HJLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LoginViewLeft;         //左边约束的线


@end

@implementation HJLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

//更改状态栏颜色。
-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}

    //关闭按钮
- (IBAction)CloseButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
    //注册帐号按钮
- (IBAction)SignInButton:(UIButton *)sender {
    //退出键盘
    [self.view endEditing:YES];
    
    if (self.LoginViewLeft.constant) {//目前是在注册界面，点击按钮后切换到登录界面。
        
        self.LoginViewLeft.constant = 0;
        sender.selected = NO;
        
    }else{//目前是在登录界面，点击按钮之后切换到注册界面。
        
        self.LoginViewLeft.constant = -self.view.HJ_width;
        sender.selected = YES;
    }
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        //强制刷新控件  使最新刷新的约束值立刻作用到控件上
        // 强制刷新 : 让最新设置的约束值马上应用到UI控件上
        // 会刷新到self.view内部的所有子控件
        [self.view layoutIfNeeded];
    }];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //点击退出键盘
    [self.view endEditing:YES];
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
