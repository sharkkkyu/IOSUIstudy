//
//  ViewController.m
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "SingleTon.h"
@interface ViewController (){
    UILabel *_label;
}
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _label.text = [SingleTon shareSingle].text;
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
    [self presentViewController:s animated:YES completion:nil];
    _label.text = [SingleTon shareSingle].text;

    NSLog(@"%@",_label.text);
}
@end
