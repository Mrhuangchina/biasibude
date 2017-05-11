//
//  HJsettingViewController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJsettingViewController.h"
#import "HJtestViewController.h"

@interface HJsettingViewController ()

@end

@implementation HJsettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = HJRandomColor;
    
    [self GetSize];
    // Do any additional setup after loading the view.
}

-(void)GetSize{

    long size = 0;
    //获取缓存文件夹路径。
   NSString * path =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dirPath = [path stringByAppendingPathComponent:@"MP3/AAA"];
    
    NSFileManager *maneger = [NSFileManager defaultManager];
    
    NSArray *subPaths = [maneger subpathsAtPath:dirPath];
    // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
    //    HJLog(@"contents - %@", [mgr contentsOfDirectoryAtPath:dirpath error:nil]);
    //遍历所有子路径
    for (NSString *subPath in subPaths) {
        //全路径
        NSString *Fullpath = [ dirPath stringByAppendingPathComponent:subPath];
        
//        NSDictionary *atts = [maneger attributesOfItemAtPath:Fullpath error:nil];
//        size += [atts[NSFileSize] unsignedIntegerValue];
        size += [maneger attributesOfItemAtPath:Fullpath error:nil].fileSize;
     }

    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HJtestViewController * test = [[HJtestViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];

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
