//
//  HJTitleSelectButton.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/19.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJTitleSelectButton.h"

@implementation HJTitleSelectButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        //titleButton.selected = NO;
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        //titlebutton.selected = YES;
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}
//重写highlighted方法 使得UIbutton长按不高亮
-(void)setHighlighted:(BOOL)highlighted{

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
