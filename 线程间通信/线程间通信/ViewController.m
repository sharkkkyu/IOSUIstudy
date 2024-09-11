//
//  ViewController.m
//  线程间通信
//
//  Created by Songmin Yu on 2024/9/11.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIImageView *imaView;
@end

@implementation ViewController
- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    self.imaView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 500, 300)];
    [self.view addSubview:self.imaView];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
}
-(void)download{
    NSURL *url = [NSURL URLWithString:@"https://img.meituan.net/smartvenus/32bbdf3d6b82d7a9afb5dfa23ffb4617101702.jpg@80Q%7Cpr=1"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:data];
    [self.imaView performSelectorOnMainThread:@selector(setImage:) withObject:img waitUntilDone:YES];
    NSLog(@"done");
}
- (void)updateImageView:(UIImage *)image {
    self.imaView.image = image;
}
@end
