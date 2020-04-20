//
//  TYProxy.m
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYProxy.h"

@implementation TYProxy

+ (instancetype)proxyWithTarget:(id)target
{
    TYProxy *proxy = [[TYProxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.target;
}

/*
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    
}
*/

@end
