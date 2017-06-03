//
//  HJNavigationController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJNavigationController.h"

@interface HJNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   //当左上角返回的按钮更改的时候收拾拖拽返回失效 所以要使用手势的代理来重新实现手势的返回效果
    self.interactivePopGestureRecognizer.delegate = self;
    
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"]
//                             forBarMetrics:UIBarMetricsDefault];
}

    /*
     * 重写pushViewController是为了拦截所有push进来的navigationcontroller
     *
     */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) { // 如果viewController不是最早push进来的子控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick" ]forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button sizeToFit];
//        contentEdgeInsets 设置内容的内边距 上 左 下 右 正数则内容缩小内缩 负数则相反
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        //隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    
    //如果将代码放在最上面 则是将工具条的控制器先push进去了 if里的childViewController的个数为一个 将判断条件self.childViewControllers.count >= 1，
    [super pushViewController:viewController animated:animated];
    

}

-(void)backAction{
    
//    [self.navigationController popViewControllerAnimated:YES]; 若果是这样则在返回到第一个界面的时候 他是没有控制器的 是Nil 所以会导致返回不成功 所以只能用[self popViewControllerAnimated:YES]
    [self popViewControllerAnimated:YES];
    HJLogFUNC
}

#pragma mark--UIGestureRecognizerDelegate

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
//    if (self.childViewControllers.count ==1) { //当只有一个控制器的时候则手势无效,因为是在最上面的控制器如果拖拽滑动之后会卡在当前的界面无法在push到下一个界面，所以这个BUG必须做这个判断。
//        return NO;
//    }
//    return YES;
    
    //等效于上面的判断代码。
    return self.childViewControllers.count > 1;
}
@end
