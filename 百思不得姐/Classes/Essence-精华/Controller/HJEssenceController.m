//
//  HJEssenceController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJEssenceController.h"
#import "HJTitleSelectButton.h"
#import "HJAllController.h"
#import "HJVideoController.h"
#import "HJVoicesController.h"
#import "HJPictureController.h"
#import "HJWordController.h"

@interface HJEssenceController ()<UIScrollViewDelegate>

//选中标题按钮
@property(nonatomic,weak)HJTitleSelectButton *titleSelectButton;

//底部指示器视图
@property(nonatomic,weak)UIView *indicatorView;

@property(nonatomic,weak)UIScrollView *scrollview;
@property(nonatomic,weak)UIView *titlesview;

@end

@implementation HJEssenceController



-(void)viewDidLoad{
    
    [self setNav];
    
    [self setChildView];
    [self setScrollView];
    [self setTitlesView];
    
    //默认情况下显示全部界面的内容
    [self addChildVCview];
}


-(void)setChildView{

    HJAllController *All = [[HJAllController alloc]init];
    [self addChildViewController:All];
    
    HJVideoController *Video = [[HJVideoController alloc]init];
                                
    [self addChildViewController:Video];
    
    HJVoicesController *Voies = [[HJVoicesController alloc]init];
                                 
    [self addChildViewController:Voies];
    
    HJPictureController *Picture = [[HJPictureController alloc]init];
                                    
    [self addChildViewController:Picture];
    
    HJWordController *Word = [[HJWordController alloc]init];
    
    [self addChildViewController:Word];
    
}

-(void)setNav{

    self.view.backgroundColor = HJBackGroundColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:@"MainTagSubIcon" HighlightImage:@"MainTagSubIconClick" Target:self Action:@selector(TagSubIcon)];
    //    self.tabBarController.tabBar.selectedImageTintColor = [UIColor darkGrayColor];


}

-(void)setScrollView{
    //不允许自动调整scrollView的内边距。
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = HJRandomColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview: scrollView];
    self.scrollview = scrollView;
    
//    NSInteger count = self.childViewControllers.count;
//    
//    for (NSInteger i = 0; i < count; i++) {
//        
//        UITableView *tableVcView = (UITableView *) self.childViewControllers[i].view;
//        tableVcView.backgroundColor = HJRandomColor;
//        tableVcView.HJ_x = i *tableVcView.HJ_width;
//        tableVcView.HJ_y = 0;
//        tableVcView.HJ_height = scrollView.HJ_height;
//        [scrollView addSubview:tableVcView];
//        
//        //内边距的调整
//        tableVcView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        //设置侧边垂直滑动条的边距
//        tableVcView.scrollIndicatorInsets = tableVcView.contentInset;
//        
//    }
    
    //scrollView的内容宽度
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.HJ_width, 0);
    
    HJLogFUNC
}

-(void)setTitlesView{
    
    UIView * titlesView = [[UIView alloc]init];
    titlesView.frame = CGRectMake(0, 64, self.view.HJ_width, 35);
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    [self.view addSubview:titlesView];
    self.titlesview = titlesView;
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSInteger count = titles.count;
    CGFloat buttonWidth = titlesView.HJ_width / count;
    for (NSInteger i = 0; i < count; i++) {
        
        HJTitleSelectButton *titleButton = [HJTitleSelectButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        titleButton.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, titlesView.HJ_height);
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        [titleButton addTarget:self
                     action:@selector(titleButton:)
                    forControlEvents:UIControlEventTouchUpInside];
        
        [titlesView addSubview:titleButton];
        
        /* 封装到TitleSelectButton中。
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //titleButton.selected = NO;
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        //titlebutton.selected = YES;
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        */
        
        /*另一种方法：
         此种方法的bug就是只能点击一次按钮 不能多次点击 如过做双击刷新数据 则此种方法不可。
         */
            //titleButton.enabled = YES;
//        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            //titleButton.enabled = NO;
//        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
    }
    
    //按钮的选中颜色
    HJTitleSelectButton *firstButton = titlesView.subviews.firstObject;
    //创建底部指示器
    UIView *indicator = [[UIView alloc]init];
    //底部指示器的颜色 = 按钮的被选中颜色。
    indicator.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    indicator.HJ_height = 1;
    indicator.HJ_y = titlesView.HJ_height - indicator.HJ_height;
    [titlesView addSubview:indicator];
    self.indicatorView = indicator;
    
    //立刻根据文本内容计算文本的宽度
    [firstButton.titleLabel sizeToFit];
    indicator.HJ_width = firstButton.titleLabel.HJ_width;
    indicator.HJ_centerX = firstButton.HJ_centerX;
    
    //默认情况下：选中最前面的按钮。
    firstButton.selected = YES;
    self.titleSelectButton.selected  = firstButton;
//    [self titleButton:firstButton];
    
}

-(void)titleButton:(HJTitleSelectButton *)titlebutton{
    
    self.titleSelectButton.selected = NO;
    titlebutton.selected = YES;
    self.titleSelectButton = titlebutton;
    
//    self.titleSelectButton.enabled = YES;
//    titlebutton.enabled = NO;
//    self.titleSelectButton = titlebutton;
    
    
    
    [UIView animateWithDuration:0.25 animations:^{
     // 计算文字的宽度:
    // 方法1:
//     CGFloat titleWidth = [titlebutton.currentTitle sizeWithFont:titlebutton.titleLabel.font].width;
    //方法二:
//        CGFloat titleWidth = [titlebutton.currentTitle sizeWithAttributes:@{NSFontAttributeName:titlebutton.titleLabel.font}].width;
        //指示器宽度 = button的titleLabel的宽度。
//        self.indicatorView.HJ_width = titleWidth;
        
        self.indicatorView.HJ_width = titlebutton.titleLabel.HJ_width;
        self.indicatorView.HJ_centerX = titlebutton.HJ_centerX;

        
    }];
    
    //让scrollView 滚动到相对应的位置
    CGPoint offset = self.scrollview.contentOffset;
    offset.x = titlebutton.tag * self.scrollview.HJ_width;
    [self.scrollview setContentOffset:offset animated:YES];
}


-(void)addChildVCview{

    //确定子控制器的索引位置
    NSUInteger index = self.scrollview.contentOffset.x / self.scrollview.HJ_width;
    
    //取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
    
    //让childview不需要每次点击都被添加。
    // if(childVc.view.superview) return;
    // if(childVc.view.window) return;
    if([childVc isViewLoaded])return;
    
    
    //index * 宽度 就是 self.scrollview.contentOffset.x
//    childVc.view.HJ_x = self.scrollview.HJ_width * index
    //子控制器视图的Y轴 就是和scrollview.contentOffset.y一样的
//   childVc.view.HJ_y = 0;
    
    
    //    childVc.view.xmg_x = index * self.scrollView.xmg_width;
    //    childVc.view.xmg_y = 0;
    //    childVc.view.xmg_width = self.scrollView.xmg_width;
    //    childVc.view.xmg_height = self.scrollView.xmg_height;
    //  ===========>
    //    childVc.view.xmg_x = self.scrollView.contentOffset.x;
    //    childVc.view.xmg_y = self.scrollView.contentOffset.y;
    //    childVc.view.xmg_width = self.scrollView.xmg_width;
    //    childVc.view.xmg_height = self.scrollView.xmg_height;
    //  ===========> bounds.origin == contentOffset
    //    childVc.view.xmg_x = self.scrollView.bounds.origin.x;
    //    childVc.view.xmg_y = self.scrollView.bounds.origin.y;
    //    childVc.view.xmg_width = self.scrollView.bounds.size.width;
    //    childVc.view.xmg_height = self.scrollView.bounds.size.height;
    //  ===========>
    //    childVc.view.frame = CGRectMake(self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
    
    //    bounds.origin == contentOffset
    HJLog(@"%@ --- %@",NSStringFromCGRect(self.scrollview.bounds),NSStringFromCGPoint(self.scrollview.contentOffset));
    
        childVc.view.frame = self.scrollview.bounds;
        [self.scrollview addSubview:childVc.view];
        HJLogFUNC
    
}

#pragma mark -UIScrollViewDelegate
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    [self addChildVCview];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //点击/选中相应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.HJ_width;

    /*
      viewWithTag: 当index =0 时候 就会返回自己self.titlesview 所以就崩溃。
     This method searches the current view and all of its subviews for the specified view.-->
     这个方法会搜索当前的view和他的所有的子视图所相同的tag的view
     */
    
    
//    HJTitleSelectButton * titleSelebutton = (HJTitleSelectButton *)[self.titlesview viewWithTag:index];
    
    HJTitleSelectButton * titleSelebutton = (HJTitleSelectButton *)self.titlesview.subviews[index];
    [self titleButton:titleSelebutton];
    
    [self addChildVCview];
}

//左上角推荐关注按钮
-(void)TagSubIcon{

    HJLogFUNC
}

@end
