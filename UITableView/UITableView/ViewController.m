//
//  ViewController.m
//  UITableView
//
//  Created by Songmin Yu on 2024/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0) {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"ysm";
        } else if (indexPath.row == 1){
            cell.textLabel.text = @"oad";
        }
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"qwe";
    }
    return cell;
}
@end
