//
//  HJLoginReButton.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/4.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJLoginReButton.h"

@implementation HJLoginReButton


-(void)awakeFromNib{

    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}

//    快速登录按钮的样式设置。
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.HJ_y = 0;
    self.imageView.HJ_centerX = self.HJ_width * 0.5;

    self.titleLabel.HJ_x = 0;
    self.titleLabel.HJ_width = self.HJ_width;
    self.titleLabel.HJ_y = self.imageView.HJ_bottom;
    self.titleLabel.HJ_height = self.HJ_height - self.titleLabel.HJ_y;
}


@end
