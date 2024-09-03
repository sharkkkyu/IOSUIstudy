//
//  secondViewController.m
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import "secondViewController.h"

@interface secondViewController ()
{
    UITextField *_text;
}
@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self creatUI];
}
-(void) creatUI{
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    b.backgroundColor = [UIColor redColor];
    [b setTitle:@"传值" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    _text = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 250, 35)];
    _text.borderStyle = UITextBorderStyleRoundedRect;
    _text.backgroundColor = [UIColor whiteColor];
    _text.textColor = [UIColor blackColor];
    _text.placeholder = @"请输入";
    _text.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:_text];
}
-(void) click{
    self.myblock(self->_text.text);
    [self dismissViewControllerAnimated:YES completion:nil];
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
