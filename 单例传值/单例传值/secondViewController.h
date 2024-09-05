//
//  secondViewController.h
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol Twodelegate <NSObject>
-(void)input:(NSString*)text;
@end
@interface secondViewController : UIViewController
@property (nonatomic,assign) id <Twodelegate> delegate;
@end

NS_ASSUME_NONNULL_END
