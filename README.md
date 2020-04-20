# TYTimer

1.时间精确的GCDTimer封装

```objective-c
/// 启动一个timer
/// @param timerId timer 的唯一标识符
/// @param start 几秒后开始执行任务
/// @param interval 每隔几秒执行一次任务
/// @param repeats 是否循环调用
/// @param async 是否异步执行任务
/// @param task 要执行的任务
+ (void)scheduledTimer:(NSString *)timerId
                 start:(NSTimeInterval)start
              interval:(NSTimeInterval)interval
               repeats:(BOOL)repeats
                 async:(BOOL)async
                  task:(dispatch_block_t)task;


/// 取消某个timer
/// @param timerId timer 的唯一标识符
+ (void)stopTimer:(NSString *)timerId;

```

使用：

```objective-c
static NSString *const test_timer = @"test.timer";

[TYGCDTimer scheduledTimer:test_timer start:0 interval:1 repeats:YES async:YES task:^{
	NSLog(@"TYGCDTimer: %@", [NSThread currentThread]);
}];

[TYGCDTimer stopTimer:test_timer];
```



2.NSTimer 与 CADisplayLink 产生循环引用问题的解决方案

- 使用block方式
- 使用proxy代理
- 详细方式见`TYNSTimer.m` 与 `TYDisplayLink.m`

