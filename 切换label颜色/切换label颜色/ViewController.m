//
//  ViewController.m
//  切换label颜色
//
//  Created by Songmin Yu on 2024/8/30.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.textAlignment = NSTextAlignmentCenter;
}
-(IBAction)ClickRedButton{
    self.label.textColor = [UIColor redColor];
    self.label.text = @"红色了";
    self.label.backgroundColor = [UIColor greenColor];
}
-(IBAction)ClickGreenButton{
    self.label.textColor = [UIColor greenColor];
    self.label.text = @"绿色了";
    self.label.backgroundColor = [UIColor redColor];
}
-(IBAction)ClickBlueButton{
    self.label.textColor = [UIColor blueColor];
    self.label.text = @"蓝色了";
    self.label.backgroundColor = [UIColor yellowColor];
}

@end
