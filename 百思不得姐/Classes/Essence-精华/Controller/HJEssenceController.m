//
//  HJEssenceController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJEssenceController.h"

@implementation HJEssenceController

-(void)viewDidLoad{
    
    self.view.backgroundColor = HJBackGroundColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:@"MainTagSubIcon" HighlightImage:@"MainTagSubIconClick" Target:self Action:@selector(TagSubIcon)];
//    self.tabBarController.tabBar.selectedImageTintColor = [UIColor darkGrayColor];
}


-(void)TagSubIcon{

    HJLogFUNC
}

@end
