//
//  NSString+HJCachePathFile.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/15.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "NSString+HJCachePathFile.h"

@implementation NSString (HJCachePathFile)

//方法一:

-(unsigned long long )fileSize{

    unsigned long long size = 0;
    
    //文件管理者
    NSFileManager * manager = [NSFileManager defaultManager];
    //是否为文件夹
    BOOL isDirectory = NO;
    //路径是否存在
    BOOL isExists = [manager fileExistsAtPath:self isDirectory:&isExists];
    //路径不存在则返回
    if (!isExists) return size;
    
    if (isDirectory) {//文件夹
        
        NSDirectoryEnumerator *DirEnumerator = [manager enumeratorAtPath:self];
        
        for (NSString *dirEnumerator in DirEnumerator) {
            
            NSString *fullPath = [self stringByAppendingPathComponent:dirEnumerator];
            
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        
    }else{//文件
    
        size = [manager attributesOfItemAtPath:self error:nil].fileSize;
    
    }
    
    return size;
    
    }

//方法二:
//-(unsigned long long )fileSize{
//
//    unsigned long long size = 0;
//    
//    //文件管理者
//    NSFileManager *manager = [NSFileManager defaultManager];
//    //文件属性
//    NSDictionary *atts = [manager attributesOfItemAtPath:self error:nil];
//    HJLog(@"%@",atts);
//    
//    if ([atts.fileType isEqualToString:NSFileTypeDirectory]) { //文件夹 :NSFileTypeDirectory
//        
//        NSDirectoryEnumerator *DirEnumerators = [manager enumeratorAtPath:self];
//        
//        //遍历器遍历文件
//        for (NSString *DirEnumer in DirEnumerators) {
//            
//            NSString *fullPath = [self stringByAppendingPathComponent:DirEnumer];
//            
//            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
//        }
//    }else{  //文件:NSFileTypeRegular
//    
//    
//        size = atts.fileSize;
//        
//    }
//    
//    return size;
//   }
//
@end
