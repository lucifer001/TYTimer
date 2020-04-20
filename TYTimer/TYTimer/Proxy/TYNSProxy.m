//
//  TYNSProxy.m
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYNSProxy.h"

@implementation TYNSProxy

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy 对象不需要调用init方法
    TYNSProxy *proxy = [TYNSProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
