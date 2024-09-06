//
//  TabbarViewController.m
//  分栏控制器
//
//  Created by Songmin Yu on 2024/9/6.
//

#import "TabbarViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}
-(void) creatUI
{
    NSArray *title = @[@"联系人",@"设置",@"动态",@"消息"];
    NSArray *nameArray = @[@"oneViewController",@"twoViewController",@"threeViewController",@"fourViewController"];
    for(int i = 0 ;i < nameArray.count ; i++){
        Class cls = NSClassFromString(nameArray[i]);
        UIViewController *vc = [[cls alloc] init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.title = title[i];
        nvc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:i];
        [self addChildViewController:nvc];
    }
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
