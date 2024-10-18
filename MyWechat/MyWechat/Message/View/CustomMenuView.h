//
//  CustomMenuView.h
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CustomMenuDelegate <NSObject>

-(void) CustomMenu:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface CustomMenuView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) id<CustomMenuDelegate> delegate;
@property (strong ,nonatomic) NSArray *arrData;
@property (strong, nonatomic) NSArray *arrImgName;
@property (nonatomic, assign) BOOL isSeem;
-(instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight;
@end
NS_ASSUME_NONNULL_END
