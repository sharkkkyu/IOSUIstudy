//
//  MessageListViewCell.h
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageListViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
-(void) configureWithMessage:(NSDictionary *)message;
@end

NS_ASSUME_NONNULL_END
