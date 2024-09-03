//
//  secondViewController.h
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface secondViewController : UIViewController
@property (nonatomic,copy) void (^myblock) (NSString *);
@end

NS_ASSUME_NONNULL_END
