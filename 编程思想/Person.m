//
//  Person.m
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/6.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)eat:(void (^)())block {
    block();
}

- (void (^)(int))eat {
    return ^(int n){
        NSLog(@"吃了 %d 个馒头！！！", n);
    };
}

- (void (^)(int))sleep {
    return ^(int m){
        NSLog(@"block当返回值，睡觉了%d分钟！！！", m);
    };
}


@end
