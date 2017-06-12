//
//  Person.h
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/6.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


#pragma 链式编程
// block：ARC使用strong，非ARC使用copy
@property (nonatomic, strong) void(^eat)();


/** block当参数（block代码块）*/
- (void)eat:(void (^)())block;

/** block作为方法返回值使用 */
- (void(^)(int))eat;


- (void(^)(int))sleep;


#pragma 响应式编程
/**  */
@property (nonatomic, strong) NSString *name;

@end
