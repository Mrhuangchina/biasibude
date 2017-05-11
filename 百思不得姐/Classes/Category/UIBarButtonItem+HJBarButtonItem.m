//
//  UIBarButtonItem+HJBarButtonItem.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "UIBarButtonItem+HJBarButtonItem.h"

@implementation UIBarButtonItem (HJBarButtonItem)


+(instancetype)ItemWithImage:(NSString *)image HighlightImage:(NSString *)hightlightImage Target:(id ) target Action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:image]
            forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightlightImage]
            forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}


@end
