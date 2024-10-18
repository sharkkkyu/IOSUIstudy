//
//  MessageList.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/17.
//

#import "MessageList.h"
@interface MessageList ()
@property (copy, nonatomic) NSMutableArray *timeList;
@property (copy, nonatomic) NSArray *contentList;

@end

@implementation MessageList
- (void)initMessageList {
    [self initTimeList];
    [self initNameList];
    [self initcontentList];
    NSMutableArray *messagesArray = [NSMutableArray arrayWithCapacity:15];
    for(int i = 0; i < 15; i++) {
        NSDictionary *message = @{
            @"NameLabel":self.nameList[i],
            @"contentLabel":self.contentList[i],
            @"timeLabel":self.timeList[i],
        };
        [messagesArray addObject:message];
    }
    self.messages = [messagesArray copy];
}
-(void)initTimeList {
    NSMutableArray<NSString *> *timesArray = [NSMutableArray arrayWithCapacity:15];
    for(int i = 0; i < 15; i++) {
        int hour = arc4random_uniform(24);
        int minute = arc4random_uniform(60);
        NSString *timeString = [NSString stringWithFormat:@"%02d:%02d",hour,minute];
        [timesArray addObject:timeString];
    }
    [timesArray sortUsingComparator:^NSComparisonResult(NSString *time1, NSString *time2) {
        return [time2 compare:time1];
    }];
    self.timeList = [timesArray copy];
}
-(void)initNameList {
    self.nameList = [NSMutableArray arrayWithArray:@[@"勤奋的橙子",@"坚韧的袋鼠",@"上进的企鹅",@"勇敢的狮子",@"乐观的松鼠",@"温柔的猫咪",@"聪明的狐狸",@"活泼的兔子",@"坚强的海豚",@"自信的雄鹰",@"忠诚的牧羊犬",@"慷慨的熊猫",@"机智的鹦鹉",@"热情的梅花鹿",@"务实的蜜蜂"]];
}

-(void)initcontentList {
    self.contentList = @[@"今天的天气真好！", @"最近在忙什么", @"听说你有新的计划", @"周末有什么安排", @"有什么好电影推荐", @"最近读了什么书", @"你喜欢什么运动", @"最近有什么好消息", @"对未来有什么打算", @"有没有新的兴趣爱好", @"有什么新发现", @"你喜欢旅行吗", @"有什么特别的经历", @"喜欢什么音乐", @"有什么新目标"];
}
@end
