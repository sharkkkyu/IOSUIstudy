//
//  ViewController.m
//  自定义导航栏
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.toolbarHidden = NO;

}
- (void)toolbarItemTapped {
    NSLog(@"Toolbar item tapped");
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
       
       // 显示工具栏
       [self.navigationController setToolbarHidden:NO animated:YES];
    
}

@end
