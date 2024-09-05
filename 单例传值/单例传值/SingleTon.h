//
//  SingleTon.h
//  单例传值
//
//  Created by Songmin Yu on 2024/9/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleTon : NSObject

@property (nonatomic, copy)NSString *text;

+(SingleTon *)shareSingle;
@end

NS_ASSUME_NONNULL_END
