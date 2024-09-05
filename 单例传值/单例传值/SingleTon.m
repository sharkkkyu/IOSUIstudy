//
//  SingleTon.m
//  单例传值
//
//  Created by Songmin Yu on 2024/9/4.
//

#import "SingleTon.h"

@implementation SingleTon
+ (SingleTon *)shareSingle{
    static SingleTon *single = nil;
    if(single == nil) {
        single = [[SingleTon alloc] init];
    }
    return  single;
}
@end
