//
//  ViewController.m
//  calculator-add
//
//  Created by Songmin Yu on 2024/9/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)sum
{
    NSString *num1 = self.text1.text;
    NSString *num2 = self.text2.text;
    int sum = num1.intValue+num2.intValue;
    self.sumLabel.text = [NSString stringWithFormat:@"%d",sum];
    [self.view endEditing:YES];
}

@end
