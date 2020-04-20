//
//  TestViewController.m
//  TYTimer
//
//  Created by PEND_Q on 2020/4/20.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#import "TestViewController.h"
#import "TYGCDTimer.h"
@interface TestViewController ()

@end

@implementation TestViewController

static NSString *const test_timer = @"test.timer";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [TYGCDTimer scheduledTimer:test_timer start:0 interval:1 repeats:YES async:YES task:^{
        NSLog(@"TYGCDTimer: %@", [NSThread currentThread]);
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [TYGCDTimer stopTimer:test_timer];
}

- (IBAction)clickCloseBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    [TYGCDTimer stopTimer:test_timer];
    NSLog(@"%s", __func__);
}

@end
