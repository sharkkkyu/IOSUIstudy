//
//  secondViewController.h
//  block传值
//
//  Created by Songmin Yu on 2024/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//声明代理
@protocol TwoDelegate <NSObject>

-(void)input:(NSString *)text;

@end
@interface secondViewController : UIViewController
//生成一个成员变量，便于访问设置代理
@property (nonatomic,assign) id <TwoDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
