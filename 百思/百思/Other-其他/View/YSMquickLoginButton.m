//
//  YSMquickLoginButton.m
//  baisiMyTest
//
//  Created by Songmin Yu on 2024/9/26.
//

#import "YSMquickLoginButton.h"

@implementation YSMquickLoginButton
- (void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect imageframe = self.imageView.frame;
    imageframe.origin.y = 0;
    imageframe.origin.x = self.frame.size.width * 0.5 - imageframe.size.width * 0.5;
    self.imageView.frame = imageframe;
    CGRect titleframe = self.titleLabel.frame;
    titleframe.origin.x = 0;
    titleframe.origin.y = self.imageView.frame.size.height;
    titleframe.size.height = self.frame.size.height - self.imageView.frame.size.height;
    titleframe.size.width = self.frame.size.width;
    self.titleLabel.frame = titleframe;
}

@end
