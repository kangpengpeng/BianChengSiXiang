//
//  NSObject+KVO.h
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)KY_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
