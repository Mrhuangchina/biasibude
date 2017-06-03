//
//  HJsettingViewController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/2.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJsettingViewController.h"
#import "HJtestViewController.h"
#import "NSString+HJCachePathFile.h"
#import "SDImageCache.h"
#import "HJClearCacheCell.h"
#import "HJSettingCell.h"

static NSString * const cellID = @"ClearCache";
static NSString * const SettingID = @"setting";

@interface HJsettingViewController ()

@end

@implementation HJsettingViewController

-(instancetype)init{

    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.tableView registerClass:[HJClearCacheCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[HJSettingCell class] forCellReuseIdentifier:SettingID];
    
//    self.view.backgroundColor = HJRandomColor;
    
//    [self GetSize];
    // Do any additional setup after loading the view.
}

      /*- 以下两个方法封装到#import "NSString+HJCachePathFile.h" 中 -*/
//-(void)GetSize{
//    
//    long size = 0;
//    
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *dirPath = [path stringByAppendingPathComponent:@"MP3"];
//    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    //遍历器/迭代器计算文件夹大小。
//     NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:dirPath];
//    
//    for (NSString *enumera in enumerator) {
//        
//        NSString *fullPath = [dirPath stringByAppendingString:enumera];
//        
//        size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
//    }
//
//
//}
//
//-(void)GetSize2{
//
//    long size = 0;
//    //获取缓存文件夹路径。
//   NSString * path =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *dirPath = [path stringByAppendingPathComponent:@"MP3/AAA"];
//    
//    NSFileManager *maneger = [NSFileManager defaultManager];
//    
//    NSArray *subPaths = [maneger subpathsAtPath:dirPath];
//    // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
//    //    HJLog(@"contents - %@", [mgr contentsOfDirectoryAtPath:dirpath error:nil]);
//    //遍历所有子路径
//    for (NSString *subPath in subPaths) {
//        //全路径
//        NSString *Fullpath = [ dirPath stringByAppendingPathComponent:subPath];
//        
////        NSDictionary *atts = [maneger attributesOfItemAtPath:Fullpath error:nil];
////        size += [atts[NSFileSize] unsignedIntegerValue];
//        size += [maneger attributesOfItemAtPath:Fullpath error:nil].fileSize;
//     }
//
//    
//}
//

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HJtestViewController * test = [[HJtestViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
       
        /* 当cell 重新显示到界面的时候 动画继续  可以写到cell中。
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        UIActivityIndicatorView * loadView = (UIActivityIndicatorView *)cell.accessoryView;
        [loadView startAnimating];
        return cell;
        */
        return [tableView dequeueReusableCellWithIdentifier:cellID];
    }else{
    
        HJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingID];
        
        if (indexPath.row == 1) {
            cell.textLabel.text = @"检查更新";
        }else if (indexPath.row ==2){
        
            cell.textLabel.text = @"给我们评分";
        }else if (indexPath.row ==3){
            cell.textLabel.text = @"推送设置";
        }else{
            cell.textLabel.text = @"关于我们";
        }
        
        return cell;
    }
    
    
    
    
    
//    直接写到cell中。
//    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray
//                                         ];
//    [loadView startAnimating];
//    
//    cell.accessoryView = loadView;
//    
//    cell.textLabel.text = @"清除缓存(正在缓存大小...)";
//    //子线程中计算文件大小。
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
////        NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
////        NSString *dirPath = [path stringByAppendingPathComponent:@"Custom"];
////    
////         unsigned long long size = dirPath.fileSize;
//        //测试路径
//        unsigned long long size = @"/Users/Mrhuang/Desktop/项目资源".fileSize;
//        // 利用SDImaheCache或许问价的大小。
//        size += [SDImageCache sharedImageCache].getSize;
//        
//        NSString * text = [NSString stringWithFormat:@"清除缓存大小(%zdB)",size];
//        dispatch_async(dispatch_get_main_queue(), ^{
//           
//            cell.textLabel.text = text;
//            //因为accessoryView的优先级比accessoryType的高 所以必须先强制转成nil。
//            cell.accessoryView = nil;
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        });
//        
//        
//    });
    
}

#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[HJSettingCell class]]) {
        
        
        
    }

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
