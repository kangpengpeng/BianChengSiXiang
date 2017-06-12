//
//  NSObject+Tools.h
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager.h"

@interface NSObject (Tools)

/** 计算 */
+ (int)KY_makeCalculate:(void(^)(Manager *mgr))block;


@end
