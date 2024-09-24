//
//  YSMListViewController.m
//  baisiMyTest
//
//  Created by Songmin Yu on 2024/9/24.
//

#import "YSMListViewController.h"

@interface YSMListViewController ()
@property(strong, nonatomic) UIScrollView *scrollview;
@end

@implementation YSMListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollview.contentSize = CGSizeMake(1125, 2436);
//    _scrollview.bounces = NO;
    [self.view addSubview:_scrollview];
    
    UIImage *img = [UIImage imageNamed:@"test"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [_scrollview addSubview:imgView];
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
