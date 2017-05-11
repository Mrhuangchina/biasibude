//
//  UIBarButtonItem+HJBarButtonItem.h
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HJBarButtonItem)

+(instancetype)ItemWithImage:(NSString *)image HighlightImage:(NSString *)hightlightImage Target:(id ) target Action:(SEL)action;

@end
