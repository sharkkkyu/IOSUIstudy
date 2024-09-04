//
//  ViewController.m
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "ViewController.h"
#import "secondViewController.h"
@interface ViewController ()<Twodelegate>

@end

@implementation ViewController
{
    UILabel *_label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    [self creatUI];
}
-(void)creatUI{
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    b.backgroundColor = [UIColor redColor];
    [b setTitle:@"返回" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 250, 250, 35)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
}
- (void) click {
    secondViewController *s = [[secondViewController alloc] init];
    s.delegate = self;
    
    [self presentViewController:s animated:YES completion:nil];
}
//实现代理方法
-(void) input:(NSString *)text{
    _label.text = text;
}
@end
