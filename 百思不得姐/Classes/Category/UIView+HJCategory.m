//
//  UIView+HJCategory.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "UIView+HJCategory.h"

@implementation UIView (HJCategory)

- (CGFloat) HJ_width{

    return self.frame.size.width;
}

-(void)setHJ_width:(CGFloat)HJ_width{

    CGRect frame = self.frame;
    frame.size.width = HJ_width;
    self.frame = frame;
}

- (CGFloat) HJ_height{

    return self.frame.size.height;
}

- (void)setHJ_height:(CGFloat)HJ_height{
    
    CGRect frame = self.frame;
    frame.size.height = HJ_height;
    self.frame = frame;
    
}

- (CGFloat)HJ_x{
    
    return self.frame.origin.x;
}

-(void)setHJ_x:(CGFloat)HJ_x{
    
    CGRect frame = self.frame;
    frame.origin.x = HJ_x;
    self.frame = frame;

}
- (CGFloat) HJ_y{

    return self.frame.origin.y;
}

-(void)setHJ_y:(CGFloat)HJ_y{
    
    CGRect frame = self.frame;
    frame.origin.y = HJ_y;
    self.frame = frame;
    
}

- (CGFloat) HJ_centerX{

    return self.center.x;
}

- (void) setHJ_centerX:(CGFloat)HJ_centerX{

    CGPoint center = self.center;
    center.x = HJ_centerX;
    self.center = center;
}

- (CGFloat) HJ_centerY{
    
    return self.center.y;
}

-(void)setHJ_centerY:(CGFloat)HJ_centerY{
    
    CGPoint center = self.center;
    center.y = HJ_centerY;
    self.center = center;
}

- (CGFloat)HJ_right{

    return CGRectGetMaxX(self.frame);
}

-(void)setHJ_right:(CGFloat)HJ_right{
    
    self.HJ_x = HJ_right - self.HJ_width;
}

- (CGFloat)HJ_bottom{

    return CGRectGetMaxY(self.frame);
}

-(void) setHJ_bottom:(CGFloat)HJ_bottom{

    self.HJ_y = HJ_bottom - self.HJ_height;
}

@end
