#import "ViewController.h"
#import "Masonry/Masonry.h"
#import <UserNotifications/UserNotifications.h>
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
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                           completionHandler:^(BOOL granted, NSError * _Nullable error) {
         if (granted) {
             NSLog(@">> Notification permission granted");
         } else {
             NSLog(@">> Notification permission denied");
         }
     }];

}

- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"Button Clicked!");
    [self scheduleLocalNotification];
}
- (void)scheduleLocalNotification{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        
        // 创建通知内容
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"提醒";
        content.body = @"该去吃晚饭了！";
        content.sound = [UNNotificationSound defaultSound];
        
        // 创建触发条件，10秒后触发
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
        
        // 创建请求标识符
        NSString *identifier = @"LocalNotification";
        
        // 创建请求
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        // 添加请求到通知中心
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"Error adding notification: %@", error.localizedDescription);
            } else{
                NSLog(@"success");
            }
        }];
}
@end
