//
//  NSObject+Tools.m
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import "NSObject+Tools.h"

@implementation NSObject (Tools)

+ (int)KY_makeCalculate:(void (^)(Manager *))block {
    Manager *mgr = [[Manager alloc] init];
    block(mgr);
    return mgr.result;
}

@end
