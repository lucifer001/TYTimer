//
//  TYNSProxy.h
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 使用此方式进行中间代理效率更高（因为会跳过方法查找、动态解析阶段）
@interface TYNSProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

@property (weak, nonatomic) id target;


@end

NS_ASSUME_NONNULL_END
