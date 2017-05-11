//
//  UITextField+HJTextFieldCategory.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/9.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "UITextField+HJTextFieldCategory.h"

static NSString *const placeholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (HJTextFieldCategory)

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    // 提前设置占位文字, 目的 : 让它提前创建placeholderLabel
    NSString *Oldeplaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = Oldeplaceholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        
        [self setValue:[UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22] forKeyPath:placeholderColorKey];

    }
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:placeholderColorKey];
}


- (void)getPlaceholderColor{

    [self valueForKeyPath:placeholderColorKey];
}

@end
