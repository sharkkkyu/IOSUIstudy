//
//  MessageListViewCell.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/17.
//

#import "MessageListViewCell.h"

@implementation MessageListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (void)configureWithMessage:(NSDictionary *)message {
    self.NameLabel.text = message[@"NameLabel"];
    self.contentLabel.text = message[@"contentLabel"];
    self.timeLabel.text = message[@"timeLabel"];
    self.imageView.image = [UIImage imageNamed:@"defaultUserIcon"];
}

@end
