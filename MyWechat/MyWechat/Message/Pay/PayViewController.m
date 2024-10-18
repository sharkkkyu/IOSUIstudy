//
//  PayViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/16.
//

#import "PayViewController.h"

@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0.5 * self.view.frame.size.height-200, 300, 200)];
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"PayViewController";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
