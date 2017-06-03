//
//  HJClearCacheCell.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/17.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJClearCacheCell.h"
#import "NSString+HJCachePathFile.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>

#define CustomCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]

@implementation HJClearCacheCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadView startAnimating];
        self.accessoryView = loadView;
        
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        //禁止点击 如果userInteractionEnabled=NO 设置在文字之前，则文字会变灰色
        self.userInteractionEnabled = NO;
        
        __weak typeof (self) WeakSelf = self;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
          
        
            unsigned long long size = CustomCachePath.fileSize;
            
            size += [SDImageCache sharedImageCache].getSize;
            
            //如果cell被销毁，那就直接返回 不进行下面的操作。
            if (WeakSelf ==nil) return ;
            
            NSString * textSize = nil;
            // pow(10, 9) 10的9次方。
            if (size >= pow(10, 9)) { // size >= 1GB

                textSize = [NSString stringWithFormat:@"%.2fGB",size/pow(10, 9)];
                
            }else if (size >= pow(10, 6)){ //1GB > size >= 1MB
            
                textSize = [NSString stringWithFormat:@"%.2fMB",size/pow(10, 6)];
                
            }else if (size>= pow(10, 3)){ //1MB > size >= 1KB
            
                textSize = [NSString stringWithFormat:@"%.2fKB",size/pow(10, 3)];
                
            }else{ // 1KB > size >= 1B
                
                textSize = [NSString stringWithFormat:@"%zdB",size];
            }
            
            
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",textSize];
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                WeakSelf.textLabel.text = text;
                WeakSelf.accessoryView = nil;
                WeakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                //恢复cell 可以点击。
                WeakSelf.userInteractionEnabled = YES;
                //添加监听手势 --如果放外面 则计算文件较大的时候也能清除 这个是一个小bug  应该等计算完才能响应手势。
                [WeakSelf addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clearCache)]];

            });
            
            
        });
        
        
        
    }
    


    return self;
}

//当cell 重新回到窗口的时候都会重新绘制subViews
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //当cell 回到界面的时候 动画继续执行。
    UIActivityIndicatorView *loadView = (UIActivityIndicatorView *)self.accessoryView;
    [loadView startAnimating];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)clearCache{
    //弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存..." maskType:  SVProgressHUDMaskTypeBlack];
    
    //删除SDImage 的缓存, 因为SDImage的删除缓存也是一个子线程 为了确保两个子线程都完成删除 所以把自定义缓存的子线程写进，不然则无法保证两个线程都完成了删除缓存。
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
      
        //删除自定义缓存
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            [NSThread sleepForTimeInterval:2];
            NSFileManager *manager = [NSFileManager defaultManager];
            //删除自定义缓存
            [manager removeItemAtPath:CustomCachePath error:nil];
            //删除之后重新创建新的自定义缓存文件夹 withIntermediateDirectories:YES 是自定创建中间文件夹
            [manager createDirectoryAtPath:CustomCachePath withIntermediateDirectories:YES attributes:nil error:nil];
            
        });
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        self.textLabel.text = @"清除缓存(0B)";
        
    }];

}

@end
