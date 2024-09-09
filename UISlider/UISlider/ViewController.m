//
//  ViewController.m
//  UISlider
//
//  Created by Songmin Yu on 2024/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISlider *s = [[UISlider alloc] initWithFrame:CGRectMake(100, 500, 200, 30)];
    self.l = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 30)];
    self.l.textColor = [UIColor blackColor];
    s.tintColor = [UIColor redColor];
    [self.view addSubview:s];
    [self.view addSubview:self.l];
    s.value = 0;
    s.maximumValue = 100.0;
    s.minimumValue = 0.0;
    self.l.text = [NSString stringWithFormat:@"%.2f",s.minimumValue];
    [s addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)change:(UISlider *)s{
    self.l.text = [NSString stringWithFormat:@"%.2f", s.value];
}
 @end
