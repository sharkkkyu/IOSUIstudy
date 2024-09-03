//
//  firstViewController.m
//  自定义导航栏
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "firstViewController.h"
#import "secondViewController.h"
@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self creatUI];
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
//    [self configureToolbarItems];
    // 设置背景颜色
    appearance.backgroundColor = [UIColor orangeColor];
//    UILabel *l = [[UILabel alloc] init];
//    l.backgroundColor = [UIColor redColor];
//    l.text = @"im tittqle";
//    l.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView = l;
//    self.title = @"first";
//    // 应用配置到导航栏
//    self.navigationController.navigationBar.standardAppearance = appearance;
//    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
//    UIToolbarAppearance *appearance2 = [[UIToolbarAppearance alloc] init];
//    appearance2.backgroundColor = [UIColor redColor];
//    self.navigationController.toolbar.standardAppearance = appearance2;
//    self.navigationController.toolbar.scrollEdgeAppearance = appearance2;
//    self.navigationController.toolbarHidden = NO;
//}
//- (void)configureToolbarItems {
//    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
//    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    
    // 将按钮添加到工具栏
//    self.toolbarItems = @[button1,button2];
}

//-(void) click
//{
//    secondViewController *second = [[secondViewController alloc] init];
//    [self.navigationController pushViewController:second animated:YES];
//}
-(void) creatUI
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
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
