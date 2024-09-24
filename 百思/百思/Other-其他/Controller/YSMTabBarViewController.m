//
//  YSMTabBarViewController.m
//  百思
//
//  Created by Songmin Yu on 2024/9/20.
//

#import "YSMTabBarViewController.h"
#import "YSMNavigationController.h"
#import "YSMFollowViewController.h"
#import "YSMNEwViewController.h"
#import "YSMEssenceViewController.h"
#import "YSMMeViewController.h"
#import "YSMmeituanViewController.h"
@interface YSMTabBarViewController ()
@property (nonatomic, strong) UIButton *publishButton;
@end

@implementation YSMTabBarViewController
- (UIButton *)publishButton
{
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        _publishButton.frame = CGRectMake(0, 0, self.tabBar.frame.size.width / 5, self.tabBar.frame.size.height);
        _publishButton.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
            UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
            
            // 设置未选中状态的字体属性
            NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
            normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
            normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
            [appearance.stackedLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
            
            // 设置选中状态的字体属性
            NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
            selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
            selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
            [appearance.stackedLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];
            appearance.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:0.8];
            self.tabBar.standardAppearance = appearance;
            
            if (@available(iOS 15.0, *)) {
                self.tabBar.scrollEdgeAppearance = appearance;
            }
        } else {
            UITabBarItem *item = [UITabBarItem appearance];
            NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
            normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
            normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
            
            NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
            selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
            
            [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
            [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        }
    
    [self setupOneChildViewController:[[YSMNavigationController alloc]initWithRootViewController:[[YSMEssenceViewController alloc] init] ] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[YSMNavigationController alloc]initWithRootViewController:[[YSMNEwViewController alloc] init] ] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"" image:nil selectedImage:nil];
    [self setupOneChildViewController:[[YSMNavigationController alloc]initWithRootViewController:[[YSMFollowViewController alloc] init] ] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupOneChildViewController:[[YSMNavigationController alloc]initWithRootViewController:[[YSMMeViewController alloc] init]] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBar addSubview:self.publishButton];
}
-(void) publishClick
{
    DELog(@"publish done");
}
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}

@end
