//
//  HJtestViewController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJtestViewController.h"

@interface HJtestViewController ()

@end

@implementation HJtestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HJRandomColor;
    self.navigationItem.title = @"测试";
    // Do any additional setup after loading the view.
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
