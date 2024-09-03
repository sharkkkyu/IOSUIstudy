//
//  secondViewController.m
//  自定义导航栏
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "secondViewController.h"
#import "firstViewController.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}
-(void) click
{
    [self.navigationController popViewControllerAnimated:YES];
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
