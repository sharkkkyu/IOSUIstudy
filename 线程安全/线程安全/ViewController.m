//
//  ViewController.m
//  线程安全
//
//  Created by Songmin Yu on 2024/9/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSThread *thread01;
@property (nonatomic, strong) NSThread *thread02;
@property (nonatomic, strong) NSThread *thread03;
@property (nonatomic, assign) NSInteger totalticket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalticket = 100;
    self.thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(saleticket) object:nil];
    self.thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(saleticket) object:nil];
    self.thread03 = [[NSThread alloc] initWithTarget:self selector:@selector(saleticket) object:nil];
    self.thread01.name = @"1";
    self.thread02.name = @"2";
    self.thread03.name = @"3";
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
}
-(void) saleticket{
        
   
    while (1) {
        @synchronized (self) {

        NSInteger count = self.totalticket;
        if(count > 0){
            self.totalticket = count - 1;
            NSLog(@"%@卖了一张票，还剩%zd张",[NSThread currentThread].name,self.totalticket);
        } else {
            NSLog(@"%@发现票没了",[NSThread currentThread].name);
            break;
        }
    }
    }
}

@end
