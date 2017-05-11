//
//  HJTabBarController.m
//  百思不得姐
//
//  Created by MrHuang on 16/12/26.
//  Copyright © 2016年 Mrhuang. All rights reserved.
//



#import "HJTabBarController.h"
#import "HJTabBar.h"
#import "HJEssenceController.h"
#import "HJNewController.h"
#import "HJMeController.h"
#import "HJFollowController.h"
#import "HJNavigationController.h"

@interface HJTabBarController ()

@end

@implementation HJTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*** 设置TabBarItem属性***/
    [self SetUpTabBarTitleTextAttributes];
    /***设置TabBarItem的图片和标题等***/
    [self SetUpTableViewControllers];
    
    
        //通过KVC 设置自定义tabbar
    [self setValue:[[HJTabBar alloc]init] forKey:@"TabBar"];
    
    //将被选中的tabBar选中颜色改成深灰色，因为真机上的是默认的蓝色。
    self.tabBar.selectedImageTintColor = [UIColor darkGrayColor];
    
}

-(void)SetUpTabBarTitleTextAttributes{

    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *dicAttr = [NSMutableDictionary dictionary];
    dicAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    dicAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:dicAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectAttr = [NSMutableDictionary dictionary];
    selectAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectAttr forState:UIControlStateSelected];


}

-(void)SetUpTableViewControllers{


    [self setupChildOneController:[[HJNavigationController alloc]initWithRootViewController:[[HJEssenceController alloc]init]]
                            title:@"精华"
                            image:@"tabBar_essence_icon"
                      selectImage:@"tabBar_essence_click_icon"];
    
    [self setupChildOneController:[[HJNavigationController alloc]initWithRootViewController:[[HJNewController alloc]init]]
                            title:@"新帖"
                            image:@"tabBar_new_icon"
                      selectImage:@"tabBar_new_click_icon"];
    
    [self setupChildOneController:[[HJNavigationController alloc]initWithRootViewController:[[HJFollowController alloc]init]]
                            title:@"关注"
                            image:@"tabBar_friendTrends_icon"
                      selectImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildOneController:[[HJNavigationController alloc]initWithRootViewController:[[HJMeController alloc]init]]
                            title:@"我"
                            image:@"tabBar_me_icon"
                      selectImage:@"tabBar_new_click_icon"];


}

-(void)setupChildOneController:(UIViewController *)Controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    /**
     *下面这个背景颜色不可以统一设置 因为这样统一设置则一次性加载了各个控制器模块的内容，并没有是的各个模块来被点击之后懒加载出来，这样统一加载非常耗费用户的流量。
        因此适合懒加载在各个模块的viewDidLoad里设置背景颜色等
     **/
//    self.view.backgroundColor = HJRandomColor;
    Controller.tabBarItem.title = title;
    
    if (image.length) {
        
        Controller.tabBarItem.image = [UIImage imageNamed:image];
        Controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    }
        
    [self addChildViewController:Controller];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
