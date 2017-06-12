//
//  NSObject+KVO.m
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/7.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

@implementation NSObject (KVO)

#pragma （KVO底层实现）
- (void)KY_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    // 1.动态生成一个类
    NSString *oldName = NSStringFromClass([self class]);
    NSString *newName = [@"KYKVO" stringByAppendingString:oldName];
    const char *className = [newName UTF8String];
    
    // 定义一个类
    Class MyClass = objc_allocateClassPair([self class], className, 0);
    // 添加一个set方法
    class_addMethod(MyClass, @selector(setName:), (IMP)setName, "");
    
    // 注册类
    objc_registerClassPair(MyClass);
    
    // 改变isa指针指向（改变对象类型）
    object_setClass(self, MyClass);
    
    // 关联对象
    objc_setAssociatedObject(self, (__bridge const void *)@"objc", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

void setName(id self, SEL _cmd, NSString * newName) {
    
    id class = [self class];
    
    object_setClass(self, class_getSuperclass([self class]));
    // 父类的setName
    objc_msgSend(self, @selector(setName:), newName);
    
    // 取出观察者
    id observer = objc_getAssociatedObject(self, (__bridge const void *)@"objc");
    NSDictionary *dict = @{@"new": newName};
    // 通知观察者
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:), @"name", self, dict, nil);

    // 改回类型
    object_setClass(self, class);
}



@end
