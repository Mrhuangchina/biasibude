//
//  HJSquareButton.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/3.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJSquareButton.h"
#import <UIButton+WebCache.h>

@implementation HJSquareButton


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"]
                          forState:UIControlStateNormal];

        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }

    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.HJ_y = self.HJ_height *0.2;
    self.imageView.HJ_height = self.HJ_height * 0.5;
    self.imageView.HJ_width = self.imageView.HJ_height;
    self.imageView.HJ_centerX = self.HJ_width *0.5;
    
    self.titleLabel.HJ_x = 0;
    self.titleLabel.HJ_y = self.imageView.HJ_bottom - 10;
    self.titleLabel.HJ_width = self.HJ_width;
    self.titleLabel.HJ_height = self.HJ_height - self.imageView.HJ_height;
}

-(void)setSquare:(HJSquareModel *)square{
    
    _square = square;

    [self setTitle:square.name forState:UIControlStateNormal];
    //        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:nil];


}
@end
