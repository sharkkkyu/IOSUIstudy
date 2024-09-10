#import "ViewController.h"
#import "Masonry/Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化并添加 UILabel
    self.label = [[UILabel alloc] init];
    self.label.text = @"Hello, Masonry!";
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.label];

    // 初始化并添加 UIButton
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"Click Me" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.button];

    // 使用 Masonry 设置布局
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];

    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.label.mas_left).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
}

- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"Button Clicked!");
}

@end
