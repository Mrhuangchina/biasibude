//
//  HJSessionManager.m
//  百思不得姐
//
//  Created by MrHuang on 17/6/3.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJSessionManager.h"

@implementation HJSessionManager

-(instancetype)initWithBaseURL:(NSURL *)url{

    if (self = [super initWithBaseURL:url]) {
        self.securityPolicy.validatesDomainName = NO;
//        self.responseSerializer  = nil;
//        self.requestSerializer = nil;
    }

    return self;
}

@end
