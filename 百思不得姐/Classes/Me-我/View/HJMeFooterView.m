//
//  HJMeFooterView.m
//  百思不得姐
//
//  Created by MrHuang on 17/4/21.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJMeFooterView.h"
#import <AFNetworking.h>
#import "HJSquareModel.h"
#import <MJExtension.h>
#import "HJSquareButton.h"
#import "HJMEWebView.h"
#import <SafariServices/SafariServices.h>

@interface HJMeFooterView()

@end

@implementation HJMeFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
//            [responseObject writeToFile:@"/Users/Mrhuang/Desktop/me1.plist" atomically:YES];
            NSArray *modelArray = [HJSquareModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            [self CreateSquares:modelArray];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HJLog(@"请求失败 - %@",error);
        }];
    }
    return self;
}

-(void)CreateSquares:(NSArray *)squareArray{
    //总个数。
    NSUInteger squares = squareArray.count;
    
    //每一行最大个数
    int MaxCount = 4;
    
    CGFloat buttonW = self.HJ_width / MaxCount;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i = 0; i < squares; i++) {
        //i位置对应的模型数据。
        HJSquareModel *square = squareArray[i];
        
        HJSquareButton *button = [HJSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(squareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        //button的frame
        button.HJ_x = (i % MaxCount) *buttonW;
        button.HJ_y = (i / MaxCount) *buttonH;
        button.HJ_width = buttonW;
        button.HJ_height = buttonH;
        
        button.square = square;
        
    }

    //设置footerView的高度 == 最后一个按钮的底部（最大的Y值）。
    self.HJ_height = self.subviews.lastObject.HJ_bottom;
    /*
     计算footView高度的其他的方法：行数*按钮的高度。
     */
    // 总数 : 1660
    // 每一行最多显示的数量 : 30
    // 总行数 : (1660 + 30 - 1) / 30
    //    NSUInteger rowsCount = 0;
    //    if (count % maxColsCount == 0) { // 能整除
    //        rowsCount = count / maxColsCount;
    //    } else { // 不能整除
    //        rowsCount = count / maxColsCount + 1;
    //    }
    // 简写成如下代码：
    //    NSUInteger rowsCount = count / maxColsCount;
    //    if (count % maxColsCount) { // 不能整除
    //        rowsCount += 1;
    //    }
    /*--------------------------------------------------------*/
    // 总数 : 2476
    // 每页显示的最大数量 : 35
    // 总页数 :  (2476 + 35 - 1) / 35
    // pagesCount = (总数  +  每页显示的最大数量 - 1) / 每页显示的最大数量
    
    //    NSUInteger rowsCount = (count + maxColsCount - 1) / maxColsCount;
    //    self.xmg_height = rowsCount * buttonH;
    
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    // reloadData 会重新刷新数据 也会重新计算contentSize.
    [tableView reloadData];
//    tableView.contentSize = CGSizeMake(0, self.HJ_bottom);
    
    
}

-(void)squareButtonAction:(HJSquareButton *)squareButton{
    
    HJSquareModel *square =squareButton.square;
       HJLog(@"%@",square.url);
    
//      字符串前面是否包含str  是则返回YES 不是则返回NO；
//    - (BOOL)hasPrefix:(NSString *)str;
    //字符串后面是否包含str 是则返回YES 不是则返回NO；
//    - (BOOL)hasSuffix:(NSString *)str;
//
    
    
    if ([square.url hasPrefix:@"http"]) {

        /*利用SFSafariViewController显示真实的进度条，会调用苹果自带的safar浏览器。（因为在苹果系统中的浏览器真实的进度条是无法获取到的，例如国内的UC 等其他的浏览器的进度条都是通过定时器来加载一个UIView来实现的。）
        */
        
//        UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
//        UINavigationController *NaVC = tabBarVC.selectedViewController;
//        
//        SFSafariViewController *safarWebView = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:square.url]];
//        [NaVC presentViewController:safarWebView animated:YES completion:nil];
//        
        
        //拿到[我]模块对应的导航控制器。
        UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = tabBarVC.selectedViewController;
        
        HJMEWebView *webView = [[HJMEWebView alloc]init];
        webView.url = square.url;
        webView.navigationItem.title = square.name;
        
        [nav pushViewController:webView animated:YES];
        
//        HJLog(@"跳转到UIWebView界面");
     
    }else if ([square.url hasPrefix:@"mod"]){
        if ([square.url hasSuffix:@"BDJ_To_Check"]) {
            HJLog(@"跳转到[审帖]界面");
        }else if ([square.url hasSuffix:@"BDJ_To_RankingList"]){
            HJLog(@"跳转到[排行榜界面]");
        }
        
    }else{
    
        HJLog(@"跳转到其他的界面");
    }
    
}
@end
