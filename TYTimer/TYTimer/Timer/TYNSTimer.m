//
//  TYNSTimer.m
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYNSTimer.h"
#import "TYProxy.h"
#import "TYNSProxy.h"

@interface TYNSTimer ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation TYNSTimer


- (instancetype)init
{
    if (self = [super init]) {
        
        /*
         // 使用block方式解决循环引用问题
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf timerRun];
        }];
         */
        
        /*
         // 使用自定义类中间代理方式解决循环引用问题
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[TYProxy proxyWithTarget:self] selector:@selector(timerRun) userInfo:nil repeats:YES];
         */
        
        // 使用 NSProxy 子类中间代理方式解决循环引用问题
        // 使用此方式进行中间代理效率更高（因为会跳过方法查找、动态解析阶段，直接进入消息转发阶段）
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:[TYNSProxy proxyWithTarget:self]
                                                    selector:@selector(timerRun)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.timer fire];
    }
    return self;
}

- (void)timerRun
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [self.timer invalidate];
}

@end
