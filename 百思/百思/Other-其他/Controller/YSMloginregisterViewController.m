//
//  YSMloginregisterViewController.m
//  百思
//
//  Created by Songmin Yu on 2024/9/23.
//

#import "YSMloginregisterViewController.h"

@interface YSMloginregisterViewController ()

@end

@implementation YSMloginregisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
