//
//  YSMloginregisterViewController.m
//  百思
//
//  Created by Songmin Yu on 2024/9/23.
//

#import "YSMloginregisterViewController.h"

@interface YSMloginregisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *LoginButtonQQ;
@property (weak, nonatomic) IBOutlet UIButton *LoginButtonSina;
@property (weak, nonatomic) IBOutlet UIButton *LoginButtonTencent;

@end

@implementation YSMloginregisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.LoginButtonQQ setImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateHighlighted];
    [self.LoginButtonQQ setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
    [self.LoginButtonSina setImage:[UIImage imageNamed:@"login_sina_icon_click"] forState:UIControlStateHighlighted];
    [self.LoginButtonSina setImage:[UIImage imageNamed:@"login_sina_icon"] forState:UIControlStateNormal];
    [self.LoginButtonTencent setImage:[UIImage imageNamed:@"login_tecent_icon_click"] forState:UIControlStateHighlighted];
    [self.LoginButtonTencent setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:UIControlStateNormal];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
