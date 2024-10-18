//
//  MessageList.h
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageList : NSObject
@property (copy,nonatomic) NSArray <NSDictionary *> *messages;
@property (copy, nonatomic)NSMutableArray *nameList;
-(void)initMessageList;
@end

NS_ASSUME_NONNULL_END
