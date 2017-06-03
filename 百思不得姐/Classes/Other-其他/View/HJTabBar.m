//
//  HJTabBar.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJTabBar.h"


@interface HJTabBar ()

@property(nonatomic,weak)UIButton *PublishButton;

@end

@implementation HJTabBar




#pragma mark - 懒加载发布按钮
-(UIButton *)PublishButton{

    if (!_PublishButton) {
        UIButton *PublishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
        [PublishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"]
                        forState:UIControlStateNormal];
        [PublishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"]
                        forState:UIControlStateHighlighted];

        [PublishButton addTarget:self
                           action:@selector(PublishAction)
                 forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:PublishButton];
        _PublishButton = PublishButton;
    }

    return _PublishButton;
}

//设置背景图片
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
//        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
   
    CGFloat buttonW = self.HJ_width / 5;
    CGFloat buttonH = self.HJ_height;
    CGFloat TabBarbuttonY = 0;
    int TabBarbuttonIndex = 0;
    for (UIView *subView in self.subviews) {
    
        if (subView.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat TabBarbuttonX = TabBarbuttonIndex * buttonW;
        //右侧两个tabBarItem的位置.
        if (TabBarbuttonIndex >= 2) {
            
            TabBarbuttonX += buttonW;
        }
        subView.frame = CGRectMake(TabBarbuttonX, TabBarbuttonY, buttonW, buttonH);
        TabBarbuttonIndex++;
    }
    
    self.PublishButton.HJ_width = buttonW;
    self.PublishButton.HJ_height = buttonH;
    self.PublishButton.HJ_centerX = self.HJ_width * 0.5;
    self.PublishButton.HJ_centerY = self.HJ_height * 0.5;
    
    }


#pragma mark --发布按钮监听方法.

-(void)PublishAction{

    HJLogFUNC


}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
