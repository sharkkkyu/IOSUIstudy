//
//  MainTabBarController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/12.
//
//这头文件import目录有问题，没懂啥原因
//正常应该都是去各自文件夹引用，不知道为啥contact和me变成同级了
#import "MainTabBarController.h"
#import "Message/MessageTableViewController.h"
#import "Discovery/DiscoveryTableViewController.h"
#import "ContactTableViewController.h"
#import "MeTableViewController.h"
#import "MainNavigationController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = YES;
    self.tabBar.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    //设置字体
    UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
    //设置未选中字体属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [appearance.stackedLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
    
    //设置选中状态字体属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:35.0 / 255.0 green:177.0 / 255.0 blue:45.0 / 255.0 alpha:1.0];
    [appearance.stackedLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];
    self.tabBar.standardAppearance = appearance;
    
    
    [self setupChildViewController:[[MainNavigationController alloc] initWithRootViewController:[[MessageTableViewController alloc] init]] title:@"微信" image:@"tabbar_message" selectedImage:@"tabbar_messageSel"];
    [self setupChildViewController:[[MainNavigationController alloc] initWithRootViewController:[[ContactTableViewController alloc] init]] title:@"通讯录" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsSel"];
    [self setupChildViewController:[[MainNavigationController alloc] initWithRootViewController:[[DiscoveryTableViewController alloc] init]] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discoverSel"];
    [self setupChildViewController:[[MeTableViewController alloc] init] title:@"我" image:@"tabbar_mine" selectedImage:@"tabbar_mineSel"];
}




#pragma mark - 封装压入子控制器
-(void)setupChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    if(image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}
@end
