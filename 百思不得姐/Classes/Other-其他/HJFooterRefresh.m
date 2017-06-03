//
//  HJFooterRefresh.m
//  百思不得姐
//
//  Created by MrHuang on 17/6/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJFooterRefresh.h"

@implementation HJFooterRefresh


-(void)prepare{
    [super prepare];
    
    self.stateLabel.textColor = [UIColor redColor];
    
    [self setTitle:@"正在努力加载数据..." forState:MJRefreshStateRefreshing];
    //当底部刷新控件出现一半的时候刷新，默认是1.0全出现。
    self.triggerAutomaticallyRefreshPercent = 0.5;

}
@end
