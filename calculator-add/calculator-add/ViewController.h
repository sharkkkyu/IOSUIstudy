//
//  ViewController.h
//  calculator-add
//
//  Created by Songmin Yu on 2024/9/2.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(IBAction)sum;
@property (nonatomic,weak) IBOutlet UITextField *text1;
@property (nonatomic,weak) IBOutlet UITextField *text2;
@property (nonatomic,weak) IBOutlet UILabel *sumLabel;
@end

