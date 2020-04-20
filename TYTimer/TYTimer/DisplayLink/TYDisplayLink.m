//
//  TYDisplayLink.m
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TYDisplayLink.h"
#import <UIKit/UIKit.h>
#import "TYProxy.h"
#import "TYNSProxy.h"

@interface TYDisplayLink ()

// 调用频率和刷帧频率一致，60FPS（大概1秒钟60次）
@property (strong, nonatomic) CADisplayLink *link;

@end

@implementation TYDisplayLink

- (instancetype)init
{
    if (self = [super init]) {
        
        /*
        self.link  = [CADisplayLink displayLinkWithTarget:[TYProxy proxyWithTarget:self] selector:@selector(timerRun)];
         */
        self.link  = [CADisplayLink displayLinkWithTarget:[TYNSProxy proxyWithTarget:self] selector:@selector(timerRun)];
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

    }
    return self;
}

- (void)timerRun
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [self.link invalidate];
}

@end
