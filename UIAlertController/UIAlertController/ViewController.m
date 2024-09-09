//
//  ViewController.m
//  UIAlertController
//
//  Created by Songmin Yu on 2024/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"this is alert" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:act];
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:act2];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
            textField.placeholder = @"账号";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"密码";
            textField.secureTextEntry = YES;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)change:(NSNotification *) noti
{
    UIAlertController *alert = (UIAlertController *)self.presentedViewController;
    if(alert) {
        UITextField *listen = alert.textFields[1];
        UIAlertAction *a  = alert.actions.lastObject;
        a.enabled = listen.text.length <=6;
    }
}
@end
