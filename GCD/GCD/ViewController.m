//
//  ViewController.m
//  GCD
//
//  Created by Songmin Yu on 2024/9/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_queue_t quene = dispatch_get_main_queue();
   self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"213");
    });
    dispatch_queue_t quene2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(quene2, ^{
        NSLog(@"01异步并发--%@",[NSThread currentThread]);
    });
    dispatch_async(quene2, ^{
        NSLog(@"02异步并发--%@",[NSThread currentThread]);
    });
    dispatch_async(quene2, ^{
        NSLog(@"03异步并发--%@",[NSThread currentThread]);
    });
    
    dispatch_resume(self.timer);
    NSLog(@"done");
}
@end
