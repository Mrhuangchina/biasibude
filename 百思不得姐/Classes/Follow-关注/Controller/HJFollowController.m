//
//  HJFollowController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJFollowController.h"
#import "HJLoginRegisterViewController.h"

@implementation HJFollowController

-(void)viewDidLoad{

    self.view.backgroundColor = HJBackGroundColor;
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:@"friendsRecommentIcon" HighlightImage:@"friendsRecommentIcon-click" Target:self Action:@selector(friendAction)];
}


- (IBAction)LoginReClick:(id)sender {
    
    HJLoginRegisterViewController *LoginRegister = [[HJLoginRegisterViewController alloc]init];
    [self presentViewController:LoginRegister animated:YES completion:nil];
    
}


-(void)friendAction{
    HJLogFUNC
}
@end
