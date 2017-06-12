//
//  Manager.h
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

/** 计算结果 */
@property (nonatomic, assign) int result;

//- (instancetype)add:(int)value;

//- (void(^)(int))add;

- (Manager *(^)(int))add;


@end
