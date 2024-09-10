//
//  ViewController.m
//  UIScrollView
//
//  Created by Songmin Yu on 2024/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:sv];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1920, 1080)];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    [sv addSubview:imageView];
    sv.contentSize = CGSizeMake(1920, 1080);
    sv.bounces = NO;
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
}


@end
