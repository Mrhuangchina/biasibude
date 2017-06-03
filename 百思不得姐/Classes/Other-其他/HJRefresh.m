//
//  HJRefresh.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/31.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJRefresh.h"

@interface HJRefresh()

@property(nonatomic,weak)UIImageView *logoView;

@end

@implementation HJRefresh





-(void)prepare{
    
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor = [UIColor orangeColor];
//    self.lastUpdatedTimeLabel.hidden = YES;
//    self.stateLabel.hidden = YES;

    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];

    UIImageView *logo = [[UIImageView alloc]init];
    logo.image = [UIImage imageNamed:@"imageBackground"];
    [self addSubview:logo];
    self.logoView = logo;
}


/**
 *  重新摆放子控件 和 layoutSubviews一样的方法
 */

-(void)placeSubviews{
    [super placeSubviews];
    
    self.logoView.HJ_width = self.HJ_width;
    self.logoView.HJ_height = 50;
    
    self.logoView.HJ_x = 0;
    self.logoView.HJ_y = -50;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
