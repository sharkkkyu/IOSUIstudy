//
//  CustomMenuView.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/16.
//

#import "CustomMenuView.h"
@interface CustomMenuView()
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat rowHeight;
@property (assign, nonatomic) CGFloat width;
@end
@implementation CustomMenuView

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight {
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    if(self) {
        if(rowHeight <= 0) {
            rowHeight = 44;
        }
        self.backgroundColor = [UIColor clearColor];
        self.origin = origin;
        self.rowHeight = rowHeight;
        self.width = width;
        self.arrData = [dataArr copy];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x - 10.0f, origin.y +10.0f, width, rowHeight * dataArr.count) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        self.tableView.layer.cornerRadius = 2;
        self.tableView.bounces = NO;
        self.tableView.separatorColor = [UIColor colorWithWhite:0.3 alpha:1];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CustomMenu"];
        if([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0 , 10, 0, 10)];
        }
        if([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:UIEdgeInsetsMake(0 , 10, 0, 10)];
        }
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomMenu"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = self.arrData[indexPath.row];
    if (self.arrImgName.count > indexPath.row) {
        cell.imageView.image = [UIImage imageNamed:self.arrImgName[indexPath.row]];
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.delegate respondsToSelector:@selector(CustomMenu:didSelectedRowAtIndexPath:)]) {
        [self.delegate CustomMenu:tableView didSelectedRowAtIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.isSeem = NO;
    [self removeFromSuperview];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0 , 10, 0, 10)];
    }
    if([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0 , 10, 0, 10)];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, _origin.x + self.width - 33.0f, _origin.y + 5.0f);
    CGContextAddLineToPoint(context, _origin.x + self.width - 37.0f, _origin.y + 10.0f);
    CGContextAddLineToPoint(context, _origin.x + self.width - 29.0f, _origin.y + 10.0f);
    CGContextClosePath(context);
    [self.tableView.backgroundColor setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}
@end
