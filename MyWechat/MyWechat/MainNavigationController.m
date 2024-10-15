//
//  MainNavigationController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/12.
//

#import "MainNavigationController.h"

@interface MainNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置手势代理为自己，左滑
    self.interactivePopGestureRecognizer.delegate = self;
    //设置uinavigationbar字体
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.navigationBar.standardAppearance = appearance;
    self.navigationBar.scrollEdgeAppearance = appearance;
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
