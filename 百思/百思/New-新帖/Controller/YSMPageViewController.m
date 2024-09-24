//
//  YSMPageViewController.m
//  baisiMyTest
//
//  Created by Songmin Yu on 2024/9/24.
//

#import "YSMPageViewController.h"

@interface YSMPageViewController ()
@property (nonatomic, strong)UIScrollView* scrollview;
@end

@implementation YSMPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollview.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
//    _scrollview.bounces = NO;
    [self.view addSubview:_scrollview];
    for(int i = 0; i < 3; i++) {
        NSString* imgName = [NSString stringWithFormat:@"cat%d.jpeg", i + 1];
        UIImage* img = [UIImage imageNamed:imgName];
        UIImageView* imgView = [[UIImageView alloc] initWithImage:img];
        imgView.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height);
        [_scrollview addSubview:imgView];
        
        _scrollview.pagingEnabled=YES;
    }
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
