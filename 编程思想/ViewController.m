//
//  ViewController.m
//  编程思想
//
//  Created by 康鹏鹏 on 2017/6/6.
//  Copyright © 2017年 dhcc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Tools.h"
#import "NSObject+KVO.h"

@interface ViewController ()
@property (nonatomic, strong) Person *p;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo4];
    
    _p = [[Person alloc] init];
//    [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_p KY_addObserver:self forKeyPath:@"named" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma 链式编程思想（方法渐进带入）
- (void)demo1 {
    Person *p = [Person new];
    void(^block)() = ^() {
        NSLog(@"吃过饭了");
    };
    p.eat = block;
    
    _p = p;
}

/** 当做方法的参数使用 */
- (void)demo2 {
    self.p = [[Person alloc] init];
    [self.p eat:^{
        NSLog(@"告诉你我是怎样吃饭的");
    }];
}

- (void)demo3 {
    // block当返回值
    self.p = [[Person alloc] init];
    self.p.eat(2);
}

// 链式实现
- (void)demo4 {
    // 链式实现
    int result = [NSObject KY_makeCalculate:^(Manager *mgr) {
        mgr.add(1).add(2).add(3).add(4).add(5);
    }];
    NSLog(@"运算结果----> %d", result);

}

#pragma 响应式编程（KVO底层实现）
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    _p.name = [NSString stringWithFormat:@"康鹏鹏 %d", i];
}




- (void)dealloc {
    [_p removeObserver:self forKeyPath:@"name"];
}



@end
