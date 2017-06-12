//
//  Manager.m
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import "Manager.h"

@implementation Manager

- (instancetype)add:(int)value {
    _result += value;
    return self;
}

//- (void (^)(int))add {
//    return ^(int value) {
//        _result += value;
//    };
//}

- (Manager *(^)(int))add {
    return ^(int value) {
        _result += value;
        return self;
    };
}

@end
